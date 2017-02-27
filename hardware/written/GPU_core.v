
module gpu_core (
	//GPU clk domain
	input gpu_clk,
	input gpu_resetn,

	//clk domain
	input clk,
	input resetn,
	
	//avalon slave for control
	input [3:0]slave_address,
	input slave_read_en,
	input slave_write_en,
	output [31:0]slave_read_data,
	output slave_wait_request,
	input [31:0]slave_write_data,
	
	//avalon master for accessing SDRAM
	output [31:0]master_address, 
	output master_write,
	output [31:0]master_write_data,
	input master_wait_request
);

	//buffer commands from the CPU
	reg cb_rdreq;
	wire cb_empty;
	wire cb_full;
	wire [7:0]cb_usedw;
	wire [35:0]cb_readdata;
	
	//read requests
	reg [31:0]read_reg;
	assign slave_read_data = read_reg;
	always @ (*) begin
		case(slave_address)
			4'd0 : read_reg = seq_no;
			4'd1 : read_reg = cb_usedw;
			default: read_reg = 32'd0;
		endcase
	end
	
	command_buffer cb0(
		.aclr		(!resetn),
		.data		({slave_address, slave_write_data}),
		.rdclk	(gpu_clk),
		.rdreq	(cb_rdreq),
		.wrclk	(clk),
		.wrreq	(slave_write_en & !slave_wait_request),
		.q			(cb_readdata),
		.rdempty	(cb_empty),
		.wrfull	(cb_full),
		.wrusedw (cb_usedw)
	);
		
	assign slave_wait_request = slave_write_en & cb_full;

	wire [3:0]cmd_addr = cb_readdata[35:32];
	wire [31:0]cmd_data = cb_readdata[31:0];
	
	//asert cb_rdreq if the command can be completed this cycle
	reg seq_reset;
	reg start_write;
	always @ (*) begin
		cb_rdreq = 1;
		tile_start = 0;
		start_write = 0;
		seq_reset = 0;
		if(cb_empty) begin
			cb_rdreq = 0;
		end else begin
			if(cmd_addr == 4'b0) begin
				case(cmd_data[3:0])
					//start tile raster
					0: begin
						if(tile_done && !writing_to_fifo) begin
							tile_start = 1;
						end else begin
							cb_rdreq = 0;
						end
					end
					//wait for tile raster to finish
					1: begin
						cb_rdreq = tile_done;
					end
					//start tile write to fifo
					2: begin
						if(!fifo_writer_running && !writing_to_fifo && tile_done) begin
							start_write = 1;
						end else begin
							cb_rdreq = 0;
						end
					end
					//wait for title to finish writing to fifo
					3: begin
						cb_rdreq = !writing_to_fifo;
					end
					//wait for fifo to finish writing to RAM
					4: begin
						cb_rdreq = !fifo_writer_running;
					end
					//reset the seq_no
					5: begin
						seq_reset = 1;
					end
					default: ;//do nothing
				endcase
			end
		end
	end
	
	//process command buffer
	reg [31:0]seq_no;
	always @ (posedge gpu_clk or negedge gpu_resetn) begin
		if (!gpu_resetn) begin
			color <= 0;
			A01 <= 0;
			A12 <= 0;
			A20 <= 0;
			w0 <= 0;
			w1 <= 0;
			w2 <= 0;
			addr <= 0;
			stride <= 0;
			B01 <= 0;
			B12 <= 0;
			B20 <= 0;
			seq_no <= 0;
		end else begin
			if(!cb_empty) begin
				if(seq_reset) begin
					seq_no <= 0;
				end else if(cb_rdreq) begin
					seq_no <= seq_no + 1;
				end
				case(cmd_addr)
					4'd1 : color <= cmd_data[15:0];
					4'd2 : A01 <= cmd_data[18:0];
					4'd3 : A12 <= cmd_data[18:0];
					4'd4 : A20 <= cmd_data[18:0];
					4'd5 : w0 <= cmd_data[31:0];
					4'd6 : w1 <= cmd_data[31:0];
					4'd7 : w2 <= cmd_data[31:0];
					4'd8 : addr <= cmd_data[31:0];
					4'd9 : stride <= cmd_data[15:0];
					4'd10: B01 <= cmd_data[23:0];
					4'd11: B12 <= cmd_data[23:0];
					4'd12: B20 <= cmd_data[23:0];
				endcase	
			end
		end
	end
	
	
	reg [15:0]color; 
	
	reg signed [18:0]A01;
	reg signed [18:0]A12;
	reg signed [18:0]A20;
	
	reg signed [31:0]w0;
	reg signed [31:0]w1;
	reg signed [31:0]w2;
	
	reg [31:0]addr;
	
	reg [15:0]stride;
	
	reg signed [23:0]B01;
	reg signed [23:0]B12;
	reg signed [23:0]B20;

	
	wire tile_done;
	reg tile_start;
	wire [15:0]tile_out;
	tile_renderer t0(
		.clk 			(gpu_clk),
		.resetn 		(gpu_resetn),
		.start		(tile_start),
	
		.A01_in			(A01),
		.B01_in			(B01),
		.A12_in			(A12),
		.B12_in			(B12),
		.A20_in			(A20),
		.B20_in			(B20),
	
		.w0_in			(w0),
		.w1_in			(w1),
		.w2_in			(w2),
		
		.color_in		(color),
		.done			(tile_done),
		.addr			(ram_addr),
		.data			(tile_out)
	);
	
	
	//whenever the fifo is at least half-empty, write 8 pixels into it
	wire shouldWriteBurst = !usedw[8] && !full && writing_to_fifo;
	wire shouldWrite = shouldWriteBurst || (ram_addr[2:0] != 0);
	
	reg fifo_wren;
	reg [9:0]ram_addr;
	reg writing_to_fifo;

	always @ (posedge gpu_clk or negedge gpu_resetn) begin
		if(!gpu_resetn) begin
			ram_addr <= 0;
			writing_to_fifo <= 0;
			fifo_wren <= 0;
		end else begin
			fifo_wren <= 0;
			if (start_write) begin
				ram_addr <= 0;
				writing_to_fifo <= 1;
			end else if (shouldWrite) begin
				if(ram_addr == 1023) begin
					writing_to_fifo <= 0;
				end
				fifo_wren <= 1;
				ram_addr <= ram_addr + 1'd1;
			end
		end
	end	
	
	wire [31:0]fifo_d_out;
	wire empty;
	wire full;
	wire fifo_ack;
	wire [8:0]usedw;
	tile_fifo f0(
		.aclr (!gpu_resetn),
		.data (tile_out),
		.rdclk(clk),
		.rdreq(fifo_ack),
		.wrclk(gpu_clk),
		.wrreq(fifo_wren),
		.q(fifo_d_out),
		.rdempty(empty),
		.wrfull(full),
		.wrusedw(usedw)
	);

	
	wire fifo_writer_running;
	fifo_writer p0(
		.clk 						(clk),
		.resetn					(resetn),
		.stride_in				(stride),
		.addr_in					(addr),
		.start					(start_write),
		.running_out			(fifo_writer_running),
		
		.fifo_data				(fifo_d_out),
		.fifo_empty				(empty),
		.fifo_ack				(fifo_ack),
	
		.master_address 		(master_address), 
		.master_write 			(master_write),
		.master_write_data	(master_write_data),
		.master_wait_request	(master_wait_request)
);

	
endmodule


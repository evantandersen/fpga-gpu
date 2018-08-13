
module gpu_core (
	//GPU clk domain
	input gpu_clk,
	input gpu_rst,

	//clk domain
	input clk,
	input rst,
	
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
			4'd0 : read_reg = cb_usedw;
			default: read_reg = 32'd0;
		endcase
	end
	
	command_buffer cb0(
		.aclr		(rst),
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
	reg start_write;
	reg set_clear;
	always @ (*) begin
		cb_rdreq = 1;
		tile_start = 0;
		start_write = 0;
		set_clear = 0;
		if(cb_empty) begin
			cb_rdreq = 0;
		end else begin
			if(cmd_addr == 4'b0) begin
				case(cmd_data[3:0])
					//start tile raster
					0: begin
						if(tile_done) begin
							tile_start = 1;
						end else begin
							cb_rdreq = 0;
						end
					end
					//start tile write to fifo
					2: begin
						if(!reading_from_tile && tile_done) begin
							start_write = 1;
							set_clear = 1;
						end else begin
							cb_rdreq = 0;
						end
					end
					//wait for fifo to finish writing to RAM
					4: begin
						cb_rdreq = flushed_to_bus;
					end
					//reset the GPU state
					5: begin
						set_clear = 1;
					end
					default: ;//do nothing
				endcase
			end
		end
	end
	
	//process command buffer
	reg buffers_swapped;
	always @ (posedge gpu_clk or posedge gpu_rst) begin
		if (gpu_rst) begin
			color <= 0;
			clear <= 0;
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
			buffers_swapped <= 0;
			zX <= 0;
			zY <= 0;
			zC <= 0;
		end else begin
			if(!cb_empty) begin
				if(start_write) begin
					buffers_swapped <= !buffers_swapped;
				end
				if(set_clear) begin
					clear <= 1;
				end else if(tile_start) begin
					clear <= 0;
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
					4'd13: zX <= GPUFout;
					4'd14: zY <= GPUFout;
					4'd15: zC <= GPUFout;
				endcase	
			end
		end
	end
	
	wire [26:0]GPUFout;
	IEEEtoGPUF c0(
		.X			(cmd_data),
		.R			(GPUFout)
	);
	
	
	reg [15:0]color;
	reg clear;
	
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

	reg [26:0]zX;
	reg [26:0]zY;
	reg [26:0]zC;
	
	wire tile_done;
	reg tile_start;
	wire tile_wren;
	wire [15:0]tile_out;
	wire [9:0]tile_ram_addr;
	tile_renderer t0(
		.clk 			(gpu_clk),
		.rst			(gpu_rst),
		.start		(tile_start),
	
		.A01_in		(A01),
		.B01_in		(B01),
		.A12_in		(A12),
		.B12_in		(B12),
		.A20_in		(A20),
		.B20_in		(B20),

		.w0_in		(w0),
		.w1_in		(w1),
		.w2_in		(w2),
		
		.dzdx_in		(zX),
		.dzdy_in		(zY),
		.zC_in		(zC),
		
		.color_in	(color),
		.clear_in	(clear),
		.wren			(tile_wren),
		.done			(tile_done),
		.X				(tile_ram_addr[4:0]),
		.Y				(tile_ram_addr[9:5]),
		.color_out	(tile_out)
	);
	
	wire [15:0]r0_out;
	big_tile_ram r0(
		.clock		(gpu_clk),
		.data			(tile_out),
		.rdaddress	(writer_ram_addr),
		.wraddress	(tile_ram_addr),
		.wren			(tile_wren && !buffers_swapped),
		.q				(r0_out)
	);
	
	wire [15:0]r1_out;
	big_tile_ram r1(
		.clock		(gpu_clk),
		.data			(tile_out),
		.rdaddress	(writer_ram_addr),
		.wraddress	(tile_ram_addr),
		.wren			(tile_wren && buffers_swapped),
		.q				(r1_out)
	);

	
	wire reading_from_tile;
	wire flushed_to_bus;
	wire [9:0]writer_ram_addr;
	wire [15:0]ram_data_out = buffers_swapped ? r0_out : r1_out;
	tile_writer d0(
		.gpu_clk			(gpu_clk),
		.gpu_rst			(gpu_rst),
		.stride_in		(stride),
		.addr_in			(addr),
		.start			(start_write),
		.reading 		(reading_from_tile),
		.flushed			(flushed_to_bus),

		.ram_addr_out	(writer_ram_addr),
		.ram_data		(ram_data_out),
	
		//avalon master for writing
		.clk				(clk),
		.rst				(rst),
		.master_address		(master_address),
		.master_write			(master_write),
		.master_write_data	(master_write_data),
		.master_wait_request	(master_wait_request)
	);


	
endmodule


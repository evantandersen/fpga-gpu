
module gpu_core (
	input clk,
	input resetn,
	
	//avalon slave for control
	input [3:0]slave_address,
	input slave_read_en,
	input slave_write_en,
	output [31:0]slave_read_data,
	input [31:0]slave_write_data,
	
	//avalon master for accessing SDRAM
	output [31:0]master_address, 
	output master_write,
	output [15:0]master_write_data,
	input master_wait_request
);

	reg [31:0]addr0;
	wire [4:0]x = addr0[25:21]; 
	wire [4:0]y = addr0[20:16]; 
	wire [15:0]color = addr0[15:0]; 
	
	reg signed [18:0]A01;
	reg signed [18:0]A12;
	reg signed [18:0]A20;
	
	//addr = 4-6
	reg signed [31:0]w0;
	reg signed [31:0]w1;
	reg signed [31:0]w2;
	
	//addr 7
	reg [31:0]addr;
	
	//addr 8
	reg [31:0]addr8;
	wire [15:0]stride = addr8[15:0];
	
	//addr 10-12
	reg signed [23:0]B01;
	reg signed [23:0]B12;
	reg signed [23:0]B20;

	
	wire tile_done;
	wire [15:0]tile_out;
	tile_renderer t0(
		.clk 			(clk),
		.resetn 		(resetn),
		.start		(slave_write_en && slave_address == 4'd9 && slave_write_data[1:0] == 2'd1),
	
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
	
	
	reg [2:0]gpu_state;

	
	//writing
	always @ (posedge clk or negedge resetn) begin
		if (!resetn) begin
			addr0 <= 32'b0;
			A01 <= 0;
			A12 <= 0;
			A20 <= 0;
			w0 <= 32'b0;
			w1 <= 32'b0;
			w2 <= 32'b0;
			addr <= 32'b0;
			addr8 <= 32'b0;
			B01 <= 0;
			B12 <= 0;
			B20 <= 0;
		end else begin
			if(slave_write_en) begin
				case(slave_address)
					4'd0 : addr0 <= slave_write_data[31:0];
					4'd1 : A01 <= slave_write_data[18:0];
					4'd2 : A12 <= slave_write_data[18:0];
					4'd3 : A20 <= slave_write_data[18:0];
					4'd4 : w0 <= slave_write_data[31:0];
					4'd5 : w1 <= slave_write_data[31:0];
					4'd6 : w2 <= slave_write_data[31:0];
					4'd7 : addr <= slave_write_data[31:0];
					4'd8 : addr8 <= slave_write_data[31:0];
					4'd10: B01 <= slave_write_data[23:0];
					4'd11: B12 <= slave_write_data[23:0];
					4'd12: B20 <= slave_write_data[23:0];
				endcase
			end
		end
	end

	//read requests
	reg [31:0]READ_REG;
	assign slave_read_data = READ_REG;
	always @ (*) begin
		if(slave_read_en) begin
			case(slave_address)
				4'd0 : READ_REG = addr0;
				4'd1 : READ_REG = {13'b0, A01};
				4'd2 : READ_REG = {13'b0, A12};
				4'd3 : READ_REG = {13'b0, A20};
				4'd4 : READ_REG = w0;
				4'd5 : READ_REG = w1;
				4'd6 : READ_REG = w2;
				4'd7 : READ_REG = addr;
				4'd8 : READ_REG = addr8;
				4'd9 : READ_REG = {29'b0, gpu_state};
				4'd10: READ_REG = {8'b0, B01};
				4'd11: READ_REG = {8'b0, B12};
				4'd12: READ_REG = {8'b0, B20};
				default: READ_REG = 32'd0;
			endcase
		end else begin
			READ_REG = 32'd0;
		end
	end
	
	reg [10:0]ram_addr;
	always @ (posedge clk or negedge resetn) begin
		if(!resetn) begin
			ram_addr <= 11'd0;
			gpu_state <= 3'd0;
		end else begin
			case(gpu_state)
				3'd0: begin
					if(slave_write_en && slave_address == 4'd9) begin
						//software can only set states 0-3
						gpu_state[1:0] <= slave_write_data[1:0];
					end
				end
				3'd1: begin
					if(tile_done) begin
						gpu_state <= 3'd0;
					end
				end
				3'd2: begin
					if(usedw == 10'd0 && !full) begin
						gpu_state <= 3'd3;
						ram_addr <= 10'd0;
					end
				end
				3'd3: gpu_state <= 3'd4;
				3'd4: begin
						gpu_state <= 3'd5;
						ram_addr <= ram_addr + 1'd1;
				end
				3'd5: begin
					ram_addr <= ram_addr + 1'd1;
					if(ram_addr == 11'd1024) begin
						gpu_state <= 3'd0;
					end
				end
			endcase
		end
	end
	
	reg [15:0]fifo_in;
	always @ (*) begin
		case(gpu_state)
			3'd3: fifo_in = addr[31:16];
			3'd4: fifo_in = addr[15:0];
			3'd5: fifo_in = tile_out;
			default: fifo_in = 16'd0;
		endcase
	end
	
	wire wrreq = (gpu_state > 3'd2) & !full;
	
	
	wire [15:0]fifo_d_out;
	wire empty;
	wire full;
	wire [9:0]usedw;
	wire fifo_ack;
	tile_fifo f0(
		clk,
		fifo_in,
		fifo_ack,
		wrreq,
		empty,
		full,
		fifo_d_out,
		usedw
	);
	
	
	fifo_writer p0(
		.clk 						(clk),
		.resetn					(resetn),
		.stride					(stride),
		.fifo_data				(fifo_d_out),
		.fifo_empty				(empty),
		.fifo_ack				(fifo_ack),
	
		.master_address 		(master_address), 
		.master_write 			(master_write),
		.master_write_data	(master_write_data),
		.master_wait_request	(master_wait_request)
);

	
endmodule


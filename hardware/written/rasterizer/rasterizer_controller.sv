module raster_controller(
	input clk,
	input rst,

	//CPU writeable registers	
	input [3:0]reg_addr,
	input [31:0]reg_data,
	input [17:0]reg_float,
	input reg_wren,
	
	//control signals
	input start,
	output busy,
	input clear,
	
	//output
	output [7:0]addr,
	output [3:0]wren,
	output [15:0]data	
);

	reg [15:0]color;
	
	reg signed [18:0]A01;
	reg signed [18:0]A12;
	reg signed [18:0]A20;
	
	reg signed [23:0]B01;
	reg signed [23:0]B12;
	reg signed [23:0]B20;

	reg signed [31:0]w0;
	reg signed [31:0]w1;
	reg signed [31:0]w2;
	
	reg [17:0]zX;
	reg [17:0]zY;
	reg [17:0]zC;


	always_ff @ (posedge clk) begin
		if(rst) begin
			color <= 0;
			A01 <= 0;
			A12 <= 0;
			A20 <= 0;
			B01 <= 0;
			B12 <= 0;
			B20 <= 0;
			w0 <= 0;
			w1 <= 0;
			w2 <= 0;
			zX <= 0;
			zY <= 0;
			zC <= 0;
		end
		if(reg_wren) begin	
			case(reg_addr)
				4'd0 : color <= reg_data[15:0];
				4'd1 : A01 <= reg_data[18:0];
				4'd2 : A12 <= reg_data[18:0];
				4'd3 : A20 <= reg_data[18:0];
				4'd4 : B01 <= reg_data[23:0];
				4'd5 : B12 <= reg_data[23:0];
				4'd6 : B20 <= reg_data[23:0];
				4'd7 : w0 <= reg_data[31:0];
				4'd8 : w1 <= reg_data[31:0];
				4'd9 : w2 <= reg_data[31:0];
				4'd10: zX <= reg_float;
				4'd11: zY <= reg_float;
				4'd12: zC <= reg_float;
			endcase
		end
	end

	wire tile_done;
	wire tile_wren;
	wire [9:0]tile_ram_addr;
	raster_pipeline t0(
		.clk 			(clk),
		.rst			(rst),
		.start		(start),
	
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
		.color_out	(data)
	);
	
	
	
	assign addr = tile_ram_addr[9:2];
	assign wren = tile_wren << tile_ram_addr[1:0];
	
	assign busy = !tile_done;

endmodule
	
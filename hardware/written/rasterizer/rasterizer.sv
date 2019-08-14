module rasterizer(
	input clk,
	input rst,
	input start,
	input enable,
	input clear,
	
	input signed [18:0]A01,
	input signed [18:0]A12,
	input signed [18:0]A20,
	
	input signed [23:0]B01,
	input signed [23:0]B12,
	input signed [23:0]B20,
	
	input signed [31:0]w0_in,
	input signed [31:0]w1_in,
	input signed [31:0]w2_in,
		
	input [4:0]X,
	input [4:0]Y,
	output clearPixel,
	output rasterPixel
);
	
	wire E01;
	wire E12;
	wire E20;

	wire row_end_next = (X == 5'd30);
	reg row_end;
	reg enable_delay;


	//point inside if all edge functions are positive (test the sign bit)
	wire pixel_inside = !(E01 | E12 | E20);
	assign rasterPixel = pixel_inside & enable_delay;
	assign clearPixel = clear & enable_delay;
		
	always_ff @ (posedge clk or posedge rst) begin
		if (rst) begin
			enable_delay <= 0;
			row_end <= 0;
		end else begin
			row_end <= row_end_next;
			enable_delay <= enable;
		end
	end
	
	edge_function #(
		.SIZE(1)
		) edge01 (
		.clk	(clk),
		.rst	(rst),
		.start			(start),
		.row_end			(row_end),
		.dx	(A01),
		.dy	(B01),
		.w_in	(w2_in),
		.sign	(E01)
	);
	edge_function #(
		.SIZE(1)
		) edge12 (
		.clk	(clk),
		.rst	(rst),
		.start			(start),
		.row_end			(row_end),
		.dx	(A12),
		.dy	(B12),
		.w_in	(w0_in),
		.sign	(E12)
	);
	edge_function #(
		.SIZE(1)
		) edge20 (
		.clk	(clk),
		.rst	(rst),
		.start			(start),
		.row_end			(row_end),
		.dx	(A20),
		.dy	(B20),
		.w_in	(w1_in),
		.sign	(E20)
	);

	
endmodule


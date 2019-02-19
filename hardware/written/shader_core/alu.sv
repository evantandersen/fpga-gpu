module alu #(
	FMA_WIDTH=16,
	DIV_WIDTH=4,
	SIN_WIDTH=1
)(
	input clk,
	input rst,
	
	input [2:0]op,
	
	input [FMA_WIDTH-1:0][17:0]a,
	input [FMA_WIDTH-1:0][17:0]b,
	input [FMA_WIDTH-1:0][17:0]c,
	
	output [FMA_WIDTH-1:0][17:0]q
);

	

	//latency 13
	wire [DIV_WIDTH-1:0][17:0]div_out;
	div_f18 div[DIV_WIDTH-1:0](
		.clk	(clk),
		.rst	(rst),
		.a(),
		.b(),
		.q(div_out)
	);

	//latency 14
	wire [FMA_WIDTH-1:0][17:0]fma_out;
	fma_unit fma[FMA_WIDTH-1:0] (
		.clk	(clk),
		.rst	(rst),
		.op	(op[1:0]),
		.a(),
		.b(),
		.c(),
		.q(fma_out)
	);

	//1 cycle to mux output
	
	
	
endmodule

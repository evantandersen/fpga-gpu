module fast_3_adder #(
	WIDTH=32
) (
	input [WIDTH-1:0]a,
	input [WIDTH-1:0]b,
	input [WIDTH-1:0]c,
	output [WIDTH-1:0]q
);

	wire [WIDTH-1:0] S = a ^ b ^ c;
	wire [WIDTH-1:0]	C = (a & b) | (a & c) | (b & c);

	assign q = S + (C << 1);

endmodule

	
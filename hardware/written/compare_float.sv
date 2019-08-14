module compare_float(
	X,
	Y,
	XGreaterThanY
);
	parameter int EXPONENT = 6;
	parameter int MANTISSA = 11;
	localparam int END = EXPONENT+MANTISSA;

	input [END:0]X;
	input [END:0]Y;
	output XGreaterThanY;

	wire signX = X[END];
	wire signY = Y[END];

	
	wire comp = X[END-1:0] > Y[END-1:0];
	
	reg result;
	always_comb begin
		case({signX, signY})
			2'b00: result = comp;
			2'b01: result = 1;
			2'b10: result = 0;
			2'b11: result = ~comp;
		endcase
	end

	wire bothZero = (X == 0) && (Y == 0);
	
	assign XGreaterThanY = result && !bothZero;

endmodule

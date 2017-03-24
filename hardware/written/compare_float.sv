module compare_float #(
	parameter EXPONENT = 7,
	parameter MANTISSA = 17
)
(
	input [EXPONENT+MANTISSA+2:0]X,
	input [EXPONENT+MANTISSA+2:0]Y,
	output XGreaterThanY
);
	localparam END = EXPONENT+MANTISSA+2;

	wire signX = X[END-2];
	wire signY = Y[END-2];

	wire [END-1:0]Xbits = {X[END:END-1], X[END-3:0]}; 
	wire [END-1:0]Ybits = {Y[END:END-1], Y[END-3:0]}; 
	
	wire comp = Xbits > Ybits;
	
	reg result;
	always_comb begin
		case({signX, signY})
			2'b00: result = comp;
			2'b01: result = 1;
			2'b10: result = 0;
			2'b11: result = ~comp;
		endcase
	end

	wire bothZero = (X[END:END-1] == 0) && (Y[END:END-1] == 0);
	
	assign XGreaterThanY = result && !bothZero;

endmodule

module carry_mult #(
	parameter WIDTH = 8
)
(
	input [WIDTH-1:0]a,
	input [WIDTH-1:0]b,
	output [WIDTH*2 - 1:0]result
);



wire [WIDTH-1:0]AB[WIDTH];

genvar i;
generate
	for(i = 0; i < WIDTH; i++) begin : create_partial_products
		assign AB[i] = b & {WIDTH{a[i]}};
	end
endgenerate


wire [WIDTH-2:0]inter[WIDTH];
assign inter[WIDTH-1] = AB[WIDTH-1][WIDTH-2:0];

wire [WIDTH-1:0]sumA;
wire [WIDTH-1:0]sumB;
assign sumA[0] = 0;
assign sumB[WIDTH-1] = AB[WIDTH-1][WIDTH-1];


generate
	for(i = WIDTH-2; i >= 0; i--) begin : adder_array
		wire [WIDTH:0]col_total = {inter[i+1], 1'b0} + AB[i];
		assign sumA[i+1] = col_total[WIDTH];
		assign sumB[i] = col_total[WIDTH-1];
		assign inter[i] = col_total[WIDTH-2:0];
	end
endgenerate

assign result[WIDTH*2-1 : WIDTH-1] = sumA + sumB;
assign result[WIDTH-2:0] = inter[0];

endmodule

module array_mult #(
	parameter WIDTH = 8
)
(
	input [WIDTH-1:0]a_i,
	input [WIDTH-1:0]b_i,
	output [WIDTH*2 - 1:0]result
);

localparam INT_WIDTH = WIDTH + 1;

//handle negative muliplier
wire [INT_WIDTH-1:0]a_2 = {a_i[WIDTH-1], a_i};
wire [INT_WIDTH-1:0]b_2 = {b_i[WIDTH-1], b_i};

wire [INT_WIDTH-1:0]a = b_i[WIDTH-1] ? (~a_2) + 1'b1 : a_2;
wire [INT_WIDTH-1:0]b = b_i[WIDTH-1] ? (~b_2) + 1'b1 : b_2;


wire [INT_WIDTH-1:0]AB[INT_WIDTH];

genvar i;
generate
	for(i = 0; i < INT_WIDTH; i++) begin : create_partial_products
		assign AB[i] = a & {INT_WIDTH{b[i]}};
	end
endgenerate

wire [INT_WIDTH-1:0]inter[INT_WIDTH+1];
assign inter[0] = {INT_WIDTH+1{1'b0}};

generate
	for(i = 0; i < INT_WIDTH; i++) begin : adder_array
		//sign extend the inputs to do signed addition (handle negative multiplicand)
		wire [INT_WIDTH:0]sum = {AB[i][INT_WIDTH-1], AB[i]} + {inter[i][INT_WIDTH-1], inter[i]};
		assign result[i] = sum[0];
		assign inter[i+1] = sum[INT_WIDTH:1];
	end
endgenerate

assign result[WIDTH*2 - 1:INT_WIDTH] = inter[INT_WIDTH][WIDTH-2:0];

endmodule


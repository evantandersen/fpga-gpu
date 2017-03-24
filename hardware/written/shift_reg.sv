module shift_reg #(
	parameter WIDTH = 8,
	parameter DEPTH = 1
)
(
	input clk,
	input [WIDTH-1:0]in,
	output [WIDTH-1:0]out
);

	reg [WIDTH-1:0]flops[DEPTH];
	
	always_ff @ (posedge clk) begin
		for(int i = 1; i < DEPTH; i = i + 1) begin
			flops[i-1] <= flops[i];
		end
		flops[DEPTH-1] <= in;
	end
		
	assign out = flops[0];

endmodule

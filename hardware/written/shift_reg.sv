module shift_reg #(
	parameter WIDTH = 8,
	parameter DEPTH = 1
)
(
	input clk,
	input rst,
	input [WIDTH-1:0]in,
	output [WIDTH-1:0]out
);

	reg [WIDTH-1:0]flops[DEPTH];
	
	wire [WIDTH-1:0]next[DEPTH] = '{in, flops[DEPTH-2:0]};
	
	always_ff @ (posedge clk or rst) begin
		if(rst) begin
			flops <= 0;
		end else begin
			flops <= next;
		end
	end
	
	assign out = flops[DEPTH-1];

endmodule

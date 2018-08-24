module shift_reg #(
	parameter WIDTH = 8,
	parameter DEPTH = 1
)
(
	input clk,
	input rst,
	input clk_en,
	input [WIDTH-1:0]in,
	output [WIDTH-1:0]out
);

	reg [WIDTH-1:0]flops[DEPTH];
	
	always_ff @ (posedge clk  or posedge rst) begin
		if(rst) begin
			for(int i = 0; i < DEPTH; i = i + 1) begin
				flops[i] <= 0;
			end
		end else begin
			if(clk_en) begin
				for(int i = 1; i < DEPTH; i = i + 1) begin
					flops[i-1] <= flops[i];
				end
				flops[DEPTH-1] <= in;
			end
		end
	end
		
	assign out = flops[0];

endmodule

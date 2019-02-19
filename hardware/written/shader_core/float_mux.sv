module float_mux #(
	WIDTH_IN=16,
	WIDTH_OUT=4,
	FBITS=18
)(
	input clk,
	input rst,

	input [WIDTH_IN-1:0][FBITS-1:0]in,
	input [$clog2(WIDTH_IN)-$clog2(WIDTH_OUT)-1:0]sel,
	output [WIDTH_OUT-1:0][FBITS-1:0]out
);
	localparam ratio = WIDTH_IN / WIDTH_OUT;

	reg [WIDTH_OUT-1:0][FBITS-1:0]q;
	assign out = q;

	always_ff @ (posedge clk or posedge rst) begin
		if(rst) begin
			out <= 0;
		end else begin
			for(int i = 0; i < WIDTH_OUT; i++) begin
				out[i] <= in[i + sel*ratio];
			end
		end
	end

endmodule

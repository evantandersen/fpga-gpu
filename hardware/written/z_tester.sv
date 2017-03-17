module z_tester(
	input clk,
	input rst,
	
	input start,
	
	input [26:0]dzdx_in,
	input [26:0]dzdy_in,
	input [26:0]offset_in,
	
	output [26:0]z,
);
	reg [26:0]dzdx;
	reg [26:0]dzdy;
	reg [26:0]offset;
	reg [9:0]index;

	always_ff @ (posedge clk or rst) begin
		if(rst) begin
			index <= 0;
			dzdx <= 0;
			dzdy <= 0;
			offset <= 0;
		end else begin
			if(start) begin
				index <= 0;
				dzdx <= dzdx_in;
				dzdy <= dzdy_in;
				offset <= offset_in;
			end else begin
				index <= index + 1'd1;
			end
		end
	end
	
	wire [26:0]z_val;
	z_interpolation z0(
		.clk		(clk),
		.rst		(rst),
		.x			(index[4:0]),
		.y			(index[9:5]),
		.dzdx		(dzdx),
		.dzdy		(dzdy),
		.c			(zC),
		.z			(z_val)
	);
	

endmodule

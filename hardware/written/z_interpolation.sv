module z_interpolation(
	input clk,
	input rst,
	
	input [4:0]x,
	input [4:0]y,
	
	input [26:0]dzdx,
	input	[26:0]dzdy,
	input [26:0]c,
	
	output [26:0]z
);

	//convert the integers to floats
	wire [26:0]xFloat;
	FixtoGPUF fX(
		.I			(x),
		.O			(xFloat)
	);
	wire [26:0]yFloat;
	FixtoGPUF fY(
		.I			(y),
		.O			(yFloat)
	);
	
	//multiply them by their respective z derivatives
	wire [26:0]xMult;
	reg [26:0]xMult_reg;
	GPUFMult m0(
		.clk		(clk), 
		.rst		(rst),
		.X			(xFloat),
		.Y			(dzdx),
		.R			(xMult)
	);
	wire [26:0]yMult;
	reg [26:0]yMult_reg;
	GPUFMult m1(
		.clk		(clk), 
		.rst		(rst),
		.X			(yFloat),
		.Y			(dzdy),
		.R			(yMult)
	);

	always @ (posedge clk) begin
		xMult_reg <= xMult;
		yMult_reg <= yMult;
	end
	
	//add it all together
	GPUF3Add a0(
		.clk		(clk), 
		.rst		(rst),
		.X			(xMult_reg),
		.Y			(yMult_reg),
		.Z			(c),
		.R			(z)
	);

endmodule

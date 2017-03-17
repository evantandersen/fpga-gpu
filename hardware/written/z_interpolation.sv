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
		.clk		(clk), 
		.rst		(rst),
		.I			(x),
		.O			(xFloat)
	);
	wire [26:0]yFloat;
	FixtoGPUF fY(
		.clk		(clk), 
		.rst		(rst),
		.I			(y),
		.O			(yFloat)
	);
	
	//multiply them by their respective z derivatives
	wire [26:0]xMult;
	GPUFMult m0(
		.clk		(clk), 
		.rst		(rst),
		.X			(xFloat),
		.Y			(dzdx),
		.R			(xMult)
	);
	wire [26:0]yMult;
	GPUFMult m1(
		.clk		(clk), 
		.rst		(rst),
		.X			(yFloat),
		.Y			(dzdy),
		.R			(yMult)
	);

	//add it all together
	GPUF3Add a0(
		.clk		(clk), 
		.rst		(rst),
		.X			(xMult),
		.Y			(yMult),
		.Z			(c),
		.R			(z)
	);

endmodule

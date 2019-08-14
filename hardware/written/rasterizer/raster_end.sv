module raster_end(
	input [17:0]pixelZ,
	input [17:0]currZ,
	input [15:0]color_in,
	input rasterPixel,
	input clearPixel,
	
	output wren,
	output [15:0]color,
	output [17:0]newZ
);
	wire zTest;

	assign wren = (rasterPixel & zTest) | clearPixel;
	assign color = rasterPixel ? color_in : 16'b0;
	assign newZ = rasterPixel ? pixelZ : 18'b0;
	
	compare_float c0(
		.X		(pixelZ),
		.Y		(currZ),
		.XGreaterThanY	(zTest)
	);

endmodule

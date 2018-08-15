
module tile_renderer(
	input clk,
	input rst,
	input start,
		
	input signed [18:0]A01_in,
	input signed [18:0]A12_in,
	input signed [18:0]A20_in,
	
	input signed [23:0]B01_in,
	input signed [23:0]B12_in,
	input signed [23:0]B20_in,
	
	input signed [31:0]w0_in,
	input signed [31:0]w1_in,
	input signed [31:0]w2_in,
	
	input [26:0]dzdx_in,
	input [26:0]dzdy_in,
	input [26:0]zC_in,
	
	input [15:0]color_in,
	input clear_in,
	
	output [4:0]X,
	output [4:0]Y,
	output wren,
	output [15:0]color_out,
	
	output done
);	
	reg signed [18:0]A12;
	reg signed [18:0]A20;
	reg signed [18:0]A01;
               
	reg signed [23:0]B12;
	reg signed [23:0]B20;
	reg signed [23:0]B01;
	            
	reg [26:0]dzdx;
	reg [26:0]dzdy;
	reg [26:0]zC;

	reg [15:0]color;
	reg clear;
		
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			A12 <= 0;
			A20 <= 0;
			A01 <= 0;
			B12 <= 0;
			B20 <= 0;
			B01 <= 0;
			dzdx <= 0;
			dzdy <= 0;
			zC <= 0;
			color <= 0;
			clear <= 0;
		end else begin
			if(start) begin				
				A12 <= A12_in;
				A20 <= A20_in;
				A01 <= A01_in;
				
				B12 <= B12_in;
				B20 <= B20_in;
				B01 <= B01_in;
	
				dzdx <= dzdx_in;
				dzdy <= dzdy_in;
				zC <= zC_in;
				
				color <= color_in;
				clear <= clear_in;
			end
		end
	end

	wire [4:0]X_start;
	wire [4:0]Y_start;
	wire clearPixel_start;
	wire rasterPixel_start;
	wire raster_done;
	rasterizer r0(
		.clk		(clk),
		.rst		(rst),
		.start	(start),
		.done		(raster_done),
		.clear	(clear),
	
		.A01		(A01),
		.A12		(A12),
		.A20		(A20),
		
		.B01		(B01),
		.B12		(B12),
		.B20		(B20),
		
		.w0_in	(w0_in),
		.w1_in	(w1_in),
		.w2_in	(w2_in),
		
		.X					(X_start),
		.Y					(Y_start),
		.clearPixel		(clearPixel_start),
		.rasterPixel	(rasterPixel_start)
	);

	wire [26:0]pixelZ;
	z_interpolation z0(
		.clk	(clk),
		.rst	(rst),
		.x		(X_start),
		.y		(Y_start),
		.dzdx	(dzdx),
		.dzdy	(dzdy),
		.c		(zC),
	
		.z		(pixelZ)
	);

	wire [26:0]newZ;
	raster_end e0(
		.pixelZ		(pixelZ),
		.currZ		(currZ),
		.color_in	(color),
		.rasterPixel(rasterPixel),
		.clearPixel	(clearPixel),
	
		.wren			(wren),
		.color		(color_out),
		.newZ			(newZ)
	);

	wire [26:0]currZ;
	depth_buffer b0 (
		.clock 		(clk),
		.data			(newZ),
		.rdaddress	(addr_inter),
		.wraddress	(addr_final),
		.wren			(wren),
		.q				(currZ)
	);

	
	wire clearPixel, rasterPixel;
	shift_reg #(
		.WIDTH(2),
		.DEPTH(8)
	) s0 (
		.clk	(clk),
		.in	({clearPixel_start, rasterPixel_start}),
		.out	({clearPixel, rasterPixel})
	);

	wire [9:0]addr_inter;
	shift_reg #(
		.WIDTH(10),
		.DEPTH(6)
	) s1 (
		.clk	(clk),
		.in	({Y_start, X_start}),
		.out	(addr_inter)
	);

	wire [9:0]addr_final;
	shift_reg #(
		.WIDTH(10),
		.DEPTH(2)
	) s2 (
		.clk	(clk),
		.in	(addr_inter),
		.out	(addr_final)
	);

	assign X = addr_final[4:0];
	assign Y = addr_final[9:5];
	
	reg [3:0]timeToFlush;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			timeToFlush <= 0;
		end else begin
			if(!raster_done) begin
				timeToFlush <= 8;
			end else if(timeToFlush > 0) begin
				timeToFlush <= timeToFlush - 1'd1;
			end
		end
	end
	assign done = (timeToFlush == 0);
	
endmodule




module raster_pipeline(
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
	
	input [17:0]dzdx_in,
	input [17:0]dzdy_in,
	input [17:0]zC_in,
	
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
	            
	reg [17:0]dzdx;
	reg [17:0]dzdy;
	reg [17:0]zC;

	reg [15:0]color;
	reg clear;
		
	reg [9:0]index;
	wire [4:0]X_start = index[4:0];
	wire [4:0]Y_start = index[9:5];
	
	reg enable;

	wire clearPixel_start;
	wire rasterPixel_start;
	wire [17:0]pixelZ;

	wire [17:0]newZ;
	wire [17:0]currZ;

	wire clearPixel, rasterPixel;

	wire [9:0]addr_inter;
	wire [9:0]addr_final;

	reg [4:0]timeToFlush;
	reg flushed;


	always_ff @ (posedge clk or posedge rst) begin
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

	always_ff @ (posedge clk or posedge rst) begin
		if (rst) begin
			enable <= 0;
			index <= 0;
		end else begin
			if(start) begin												
				index <= 0;
				enable <= 1;
			end else begin
				index <= index + 1'd1;
				if (index == 1023) begin
					enable <= 1'd0;
				end
			end
		end
	end
	
	rasterizer r0(
		.clk		(clk),
		.rst		(rst),
		.start	(start),
		.enable	(enable),
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

	plane_eq #(
		.SIZE(1)
	) z_calc (
		.clk	(clk),
		.rst	(rst),
		.dzdy	(dzdy),
		.dzdx	(dzdx),
		.c		(zC),
		.x	({11'b0, X_start}),
		.y	({11'b0, Y_start}),
		.z	(pixelZ)
	);
	
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
	
	byte_enabled_dual_port_ram #(
		.RADDR_WIDTH(10),
		.WADDR_WIDTH(10),
		.BYTE_WIDTH(18),
		.BYTES(1)
	) depth_buffer (
		.clk(clk),
		.waddr(addr_final),
		.raddr(addr_inter),
		.be(wren),
		.wdata(newZ), 
		.we(wren),
		.q(currZ)
	);

	shift_reg #(
		.WIDTH(2),
		.DEPTH(27)
	) s0 (
		.clk	(clk),
		.rst	(rst),
		.clk_en(1'b1),
		.in	({clearPixel_start, rasterPixel_start}),
		.out	({clearPixel, rasterPixel})
	);

	shift_reg #(
		.WIDTH(10),
		.DEPTH(26)
	) s1 (
		.clk	(clk),
		.rst	(rst),
		.clk_en(1'b1),
		.in	({Y_start, X_start}),
		.out	(addr_inter)
	);

	shift_reg #(
		.WIDTH(10),
		.DEPTH(2)
	) s2 (
		.clk	(clk),
		.rst	(rst),
		.clk_en(1'b1),
		.in	(addr_inter),
		.out	(addr_final)
	);

	assign X = addr_final[4:0];
	assign Y = addr_final[9:5];
	
	always_ff @ (posedge clk or posedge rst) begin
		if(rst) begin
			timeToFlush <= 0;
			flushed <= 0;
		end else begin
			if(start) begin
				flushed <= 0;
				timeToFlush <= 27;
			end else begin
				flushed <= (timeToFlush == 0);
				if(enable) begin
					timeToFlush <= 27;
				end else if(timeToFlush > 0) begin
					timeToFlush <= timeToFlush - 1'd1;
				end
			end
		end
	end
	assign done = flushed;
	
endmodule



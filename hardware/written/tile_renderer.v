
module tile_renderer(
	input clk,
	input resetn,
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
	
	output [9:0]addr,
	output wren,
	output [15:0]data,
	
	output done
);

	assign wren = (point_inside | clear) & enable;
	assign data = point_inside? color : 0;
	
	//point is inside triangle as long as all 3 values are positive
	wire point_inside = !(w0[31] | w1[31] | w2[31]);
	
	reg signed [18:0]A12;
	reg signed [18:0]A20;
	reg signed [18:0]A01;
               
	reg signed [23:0]B12;
	reg signed [23:0]B20;
	reg signed [23:0]B01;
	            
	reg signed [31:0]w0;
	reg signed [31:0]w1;
	reg signed [31:0]w2;

	reg [26:0]dzdx;
	reg [26:0]dzdy;
	reg [26:0]zC;

	reg [15:0]color;
	reg clear;
	
	reg [9:0]index;
	assign addr = index;
	
	reg enable;
	assign done = !enable;	
	
	wire row_end = (index[4:0] == 5'd31);
	
	//sign extend A values
	wire signed [23:0]A12_ex = {{5{A12[18]}}, A12};
	wire signed [23:0]A20_ex = {{5{A20[18]}}, A20};
	wire signed [23:0]A01_ex = {{5{A01[18]}}, A01};
	
	//add Axx for each column, Bxx for rows
	wire signed [23:0]delta0 = row_end ? B12 : A12_ex;
	wire signed [23:0]delta1 = row_end ? B20 : A20_ex;
	wire signed [23:0]delta2 = row_end ? B01 : A01_ex;

	//floating point arithmetic for Z interpolation
	depth_buffer d0(
		.clock		(clk),
		.data			(z_val),
		.rdaddress	(read_addr),
		.wraddress	(),
		.wren			(wren),
		.q				()
	);

	
	always @ (posedge clk or negedge resetn) begin
		if (!resetn) begin
			A12 <= 0;
			A20 <= 0;
			A01 <= 0;
			B12 <= 0;
			B20 <= 0;
			B01 <= 0;
			w0 <= 0;
			w1 <= 0;
			w2 <= 0;
			dzdx <= 0;
			dzdy <= 0;
			zC <= 0;
			color <= 0;
			clear <= 0;
			index <= 0;
			enable <= 0;
		end else begin
			if(start) begin
				w0 <= w0_in;
				w1 <= w1_in; 
				w2 <= w2_in;
				
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
				
				index <= 0;
				enable <= 1;
			end else begin
				w0 <= w0 + delta0;
				w1 <= w1 + delta1;
				w2 <= w2 + delta2;
				index <= index + 1'd1;
				
				if (index == 1023) begin
					enable <= 1'd0;
				end
			end
		end
	end

endmodule



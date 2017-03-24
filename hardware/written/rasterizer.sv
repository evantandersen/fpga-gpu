module rasterizer(
	input clk,
	input rst,
	input start,
	output done,
	input clear,
	
	input signed [18:0]A01,
	input signed [18:0]A12,
	input signed [18:0]A20,
	
	input signed [23:0]B01,
	input signed [23:0]B12,
	input signed [23:0]B20,
	
	input signed [31:0]w0_in,
	input signed [31:0]w1_in,
	input signed [31:0]w2_in,
		
	output [4:0]X,
	output [4:0]Y,
	output clearPixel,
	output rasterPixel
);
	
	//point inside if all edge functions are positive (test the sign bit)
	wire pixel_inside = !(w0[31] | w1[31] | w2[31]);
	assign rasterPixel = pixel_inside & enable;
	assign clearPixel = clear & enable;
	
	reg signed [31:0]w0;
	reg signed [31:0]w1;
	reg signed [31:0]w2;

	//sign extend A values
	wire signed [23:0]A12_ex = {{5{A12[18]}}, A12};
	wire signed [23:0]A20_ex = {{5{A20[18]}}, A20};
	wire signed [23:0]A01_ex = {{5{A01[18]}}, A01};
	
	//add Axx for each column, Bxx for rows
	wire signed [23:0]delta0 = row_end ? B12 : A12_ex;
	wire signed [23:0]delta1 = row_end ? B20 : A20_ex;
	wire signed [23:0]delta2 = row_end ? B01 : A01_ex;
	
	reg [9:0]index;
	assign X = index[4:0];
	assign Y = index[9:5];
	wire row_end = (X == 5'd31);
	
	reg enable;
	assign done = !enable;	

	always_ff @ (posedge clk or posedge rst) begin
		if (rst) begin
			w0 <= 0;
			w1 <= 0;
			w2 <= 0;
			enable <= 0;
			index <= 0;
		end else begin
			if(start) begin
				w0 <= w0_in;
				w1 <= w1_in; 
				w2 <= w2_in;
												
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


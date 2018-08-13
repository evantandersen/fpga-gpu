`timescale 1 ns / 1 ps

module plane_eq_tb; 

  reg clk, reset;
  localparam SIZE=2;
  wire [SIZE-1:0][SIZE-1:0][17:0] result; 
  
  wire [17:0]one = {2'b0, {5{1'b1}}, 11'b0};
  wire [17:0]half = {2'b0, {4{1'b1}}, 12'b0};

  plane_eq #(
    .SIZE(SIZE)
  ) u0 ( 
  .clk    (clk), 
  .rst  (reset), 
  .dzdx(one),
  .dzdy(half),
  .c(18'b0),
  .x(16'b1),
  .y(16'b0),
  .z(result)
  ); 
    
  initial 
  begin 
    clk = 0; 
    reset = 0; 
    #100;
  end 
    
  always 
    #5 clk = !clk; 

endmodule 
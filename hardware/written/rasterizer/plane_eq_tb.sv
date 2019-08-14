`timescale 1 ns / 1 ps

integer f;

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
  
  wire [17:0]result_a = result[0][0];

  initial 
  begin 
    $dumpfile ("plane_eq.vcd"); 
    f = $fopen("output.txt");
    $dumpvars(1, plane_eq_tb.result_a, clk); 
    clk = 1; 
    reset = 0;
    #4 reset = 1;
    #4 reset = 0;
    #200 
    $fclose(f);
    $finish;
  end 
    
  initial  begin
    $fdisplay(f, "time,\tclk,\treset,\tresult[0][0]"); 
    $monitor("%d,\t%b,\t%b,\t%b",$time/2, clk,reset,result[0][0]); 
  end 

  always begin
    #2 clk = !clk;
  end

  integer count = 0;
  always @(posedge clk) begin
    $fdisplay(f, "%d, %b, %b", count, reset, result[0][0]);
    count++;
  end

endmodule 
`timescale 1 ns / 1 ps

integer f;

module gpu_tb; 

  reg sys_clk, gpu_clk, reset;
  
  wire [17:0]one = {2'b0, {5{1'b1}}, 11'b0};
  wire [17:0]half = {2'b0, {4{1'b1}}, 12'b0};


  reg [39:0]data_in[1023:0];

  reg [31:0]data_out[511:0];

  wire slave_wait_request;

  wire master_write;
  wire [31:0]write_data;
  wire [31:0]master_address;

  int i;
  wire shouldWrite = (i < 15);

  gpu_core c0(
    //GPU clk domain
    .gpu_clk(gpu_clk),
    .gpu_rst(reset),

    //clk domain
    .clk(sys_clk),
    .rst(reset),
    
    //avalon slave for control
    .slave_address(data_in[i][39:32]),
    .slave_read_en(1'b0),
    .slave_write_en(shouldWrite),
    .slave_read_data(),
    .slave_wait_request(slave_wait_request),
    .slave_write_data(data_in[i][31:0]),
    
    //avalon master for accessing SDRAM
    .master_address(master_address), 
    .master_write(master_write),
    .master_write_data(write_data),
    .master_wait_request(1'b0)
);
  
always @ (posedge sys_clk) begin
  if (master_write) begin
    data_out[master_address[10:2]] <= write_data;
  end
end

always @ (posedge sys_clk or posedge reset) begin 
  if(reset) begin
    i <= 0;
  end else if(!slave_wait_request && shouldWrite) begin
    i <= i + 1;
  end
end

  initial 
  begin 
    f = $fopen("gpu.txt");
    $readmemh("input.hex", data_in);

    // $dumpvars(1, plane_eq_tb.result_a, clk); 
    sys_clk = 1; 
    gpu_clk = 1;
    reset = 0;
    #4 reset = 1;
    #4 reset = 0;
    #8000 
    $fdisplay(f, "%d", i);
    $fclose(f);
    $writememh("output.hex", data_out);
    $finish;
  end 
    
  initial  begin
    // $fdisplay(f, "time,\tclk,\treset,\tresult[0][0]"); 
    // $monitor("%d,\t%b,\t%b,\t%b",$time/2, clk,reset,result[0][0]); 
  end 

  always begin
    #1 gpu_clk = !gpu_clk;
  end

  always begin
    #2 sys_clk = !sys_clk;
  end

  integer count = 0;
  always @(posedge sys_clk) begin
    $fdisplay(f, "%d, %b, %d", count, reset, i);
    count++;
  end

endmodule 
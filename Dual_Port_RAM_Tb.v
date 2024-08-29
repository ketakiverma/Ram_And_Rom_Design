// Dual Port RAM testbench

module tbDualPRAM;
  reg [7:0] data_a, data_b; //input data
  reg [5:0] ad_a, ad_b; //Port A and Port B address
  reg wre_a, wre_b; //write enable for Port A and Port B
  reg clk; //clk
  wire [7:0] q_a, q_b; //output data at Port A and Port B
  
  DualPRAM dpr1(
    .data_a(data_a),
    .data_b(data_b),
    .ad_a(ad_a),
    .ad_b(ad_b),
    .wre_a(wre_a),
    .wre_b(wre_b),
    .clk(clk),
    .q_a(q_a),
    .q_b(q_b)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1,tbDualPRAM);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      data_a = 8'h22;
      ad_a = 6'h02;
      
      data_b = 8'h34;
      ad_b = 6'h01;
      
      wre_a = 1'b1;
      wre_b = 1'b1;
      
      #10;
      
      data_a = 8'h45;
      ad_a = 6'h03;
      
      ad_b = 6'h01;
      
      wre_b = 1'b0;
      
      #10;          
            
      ad_a = 6'h02;
      
      ad_b = 6'h03;
      
      wre_a = 1'b0;
      
      #10;
      
      ad_a = 6'h01;
      
      data_b = 8'h77;
      ad_b = 6'h02;
      
      wre_b = 1'b1;
      
      #10;
    end
  
  initial	
    #40 $stop;
  
endmodule

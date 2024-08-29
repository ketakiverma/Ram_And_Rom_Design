// Dual Port RAM module design

module DualPRAM(
  input [7:0] data_a, data_b, //input data
  input [5:0] ad_a, ad_b, //Port A and Port B address
  input wre_a, wre_b, //write enable for Port A and Port B
  input clk, //clk
  output reg [7:0] q_a, q_b //output data at Port A and Port B
);
  
  reg [7:0] ram [63:0]; //8*64 bit ram

 
  always @ (posedge clk)
    begin
      if(wre_a)
        ram[ad_a] <= data_a;
      else
        q_a <= ram[ad_a]; 
    end
  
  always @ (posedge clk)
    begin
      if(wre_b)
        ram[ad_b] <= data_b;
      else
        q_b <= ram[ad_b]; 
    end
  
endmodule

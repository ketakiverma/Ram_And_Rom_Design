/ ROM testbench

module ROM_tb;
  reg clk; //clk
  reg en; //enable
  reg [3:0] addr; //address
  wire [3:0] data; //output data
  
  ROM R1(
    .clk(clk),
    .en(en),
    .addr(addr),
    .data(data)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1, ROM_tb);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      en = 1'b0;
      #10;                  
      
      en = 1'b1;      
      addr = 4'b1110;
      #10;
      
      addr = 4'b0110;
      #10;
      
      addr = 4'b0111;
      #10;
      
      en = 1'b0;
      addr = 4'b1011;
      #10;
            
      en = 1'b1;
      addr = 4'b1010;
      #10;
      
      addr = 4'b0010;
      #10;
      
      addr = 4'bxxxx;
      #10;
    end
  
  initial
    begin
      #80 $stop;
    end

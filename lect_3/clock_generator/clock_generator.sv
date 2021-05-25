module clock_generator
   (
     input clk_in,
     input rst_b,
     input stop,
     output reg clk_out1,
     output reg clk_out2,
     output reg clk_out3,
     output reg clk_out4
   );
  
  parameter sys_clk = 10000000; // 10MHz
  
  parameter clk1 = 1000000; // 1 MHz
  parameter max1 = sys_clk / (2 * clk1);
  
  parameter clk2 = 1330000; // 1.33 MHz
  parameter max2 = sys_clk / (2 * clk2);
  
  parameter clk3 = 1660000; // 1.66 MHz
  parameter max3 = sys_clk / (2 * clk3);
  
  parameter clk4 = 2000000; // 2 MHz
  parameter max4 = sys_clk / (2 * clk4);
  
  reg [5:0] counter1 = 0;
  reg [5:0] counter2 = 0;
  reg [5:0] counter3 = 0;
  reg [5:0] counter4 = 0;
  
     
  always@(posedge clk_in or negedge rst_b) begin
     if (counter1 == max1-1 && ~stop && ~rst_b)
        begin
           counter1 <= 0;
           clk_out1 = ~clk_out1;
        end
     else
        begin
           counter1 <= counter1 + 1'd1;
        end
    
    clk_out1 <= (counter1 == 6'd0);
     end
//---------------------------------------------//
  always@(posedge clk_in or negedge rst_b) begin
     if (counter2 == max2-1 && ~stop && ~rst_b)
        begin
           counter2 <= 0;
           clk_out2 = ~clk_out2;
        end
     else
        begin
           counter2 <= counter2 + 1'd1;
        end
    
    clk_out2 <= (counter2 == 6'd0);
     end
//---------------------------------------------//
  always@(posedge clk_in or negedge rst_b) begin
     if (counter3 == max3-1 && ~stop && ~rst_b)
        begin
           counter3 <= 0;
           clk_out3 = ~clk_out3;
        end
     else
        begin
           counter3 <= counter3 + 1'd1;
        end
    
    clk_out3 <= (counter3 == 6'd0);
     end
//---------------------------------------------//
  always@(posedge clk_in or negedge rst_b) begin
     if (counter4 == max4-1 && ~stop && ~rst_b)
        begin
           counter4 <= 0;
           clk_out4 = ~clk_out4;
        end
     else
        begin
           counter4 <= counter4 + 1'd1;
        end
    
    clk_out4 <= (counter4 == 6'd0);
     end
endmodule

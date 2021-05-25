`timescale 1ns/1ns

module clock_generator_TB();
  
   reg clk_in;
   reg rst_b;
   reg stop;
   wire clk_out1;
   wire clk_out2;
   wire clk_out3;
   wire clk_out4;
  
 parameter sys_clk  = 10000000;
 parameter clk1     = 1000000;
 parameter clk2     = 1330000;
 parameter clk3     = 1660000;
 parameter clk4     = 2000000; 
   
 clock_generator uut 
  (
   .clk_in(clk_in),
   .rst_b(rst_b),
   .stop(stop),
   .clk_out1(clk_out1),
   .clk_out2(clk_out2),
   .clk_out3(clk_out3),
   .clk_out4(clk_out4)
  );
  
always #10 clk_in = ~clk_in;
//always #5 rst_b = ~rst_b;
   initial begin
      clk_in = 0;
	  rst_b  = 0;
	  stop   = 0;        
     
     $display("clk_in frequency is %g MHz", sys_clk);
     $display("clk1   frequency is %g MHz", clk1);
     $display("clk2   frequency is %g MHz", clk2);
     $display("clk3   frequency is %g MHz", clk3);
     $display("clk4   frequency is %g MHz", clk4); 
     
#500 $finish;     
   end
initial begin   
   $dumpfile("dump.vcd");
   $dumpvars(1);
end 
endmodule

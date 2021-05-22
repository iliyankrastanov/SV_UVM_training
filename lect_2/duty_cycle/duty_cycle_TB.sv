`include "task.sv"

module top();
  
 logic clk = 0;
 real duty_cycle; 

 initial begin
  repeat(5) begin
    #10 clk = 1;
    #9 clk = 0;
  end
 end
 
 //Requirments to start simulation
 initial begin
 	 $dumpfile("dump.vcd");
   $dumpvars(1, top);
 end
  
  initial calculate_duty_cycle(clk, duty_cycle);
  
endmodule

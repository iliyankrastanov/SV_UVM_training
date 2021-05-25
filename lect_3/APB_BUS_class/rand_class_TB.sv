`include "rand_class.sv"

module rand_top();
  
  initial begin
  	rand_class rand_signals = new();
    
    //Randomize test
    repeat (5) begin
      rand_signals.randomize(); 
      $display("PADDR = %d PWRITE = %b PSEL = %b PWDATA = %b PREADY = %b", rand_signals.PADDR, rand_signals.PWRITE, rand_signals.PSEL, rand_signals.PWDATA, rand_signals.PREADY);
    end
    
  end

endmodule

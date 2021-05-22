module top();
  
  
  logic clk = 0;
  logic request = 0;
  logic grant = 0;
  
  //clock generator
  initial begin
    repeat (10) #20 clk = ~clk;
  end
  
  //signal simulation
  always @(posedge clk) begin
    request = 1;
    #130 grant = 1;
  end
  
  //Requirments to start simulation
  initial begin
  	$dumpfile("dump.vcd");
    $dumpvars(1, top);
  end
  
  sequence req;
    request;
  endsequence
  
  sequence gr;
    grant;
  endsequence
  
  property pr;
    @(posedge clk) req |-> ##2 gr;
  endproperty
  
  //assertion to check if grant is high two clock cycles 
  //after request went high at posedge of clk
  assert property (pr) $display("Success!");
    	else $error("Fail!");
  
  
endmodule

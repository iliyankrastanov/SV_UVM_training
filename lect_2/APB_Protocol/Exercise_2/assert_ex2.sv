module asertion_ex_2;
  bit clk,PSEL,PWRITE,PREADY,RENABLE;
  bit [1:0] PWDATA,PADDR;
  
  //clock generation
  always #5 clk = ~clk; 
  
  //Simulation purposes
  initial begin 
    #5  PWDATA=1; PADDR=1; PSEL=0; PWRITE=0;
    #9  PWDATA=0; PADDR=0; PSEL=0; PWRITE=0;
    #1  PWDATA=1; PADDR=1; PSEL=1; PWRITE=1;
    #5  PWDATA=1; PADDR=1; PSEL=1; PWRITE=1; 
    #4  PWDATA=1; PADDR=1; PSEL=1; PWRITE=1; 
    #1  PREADY=1; RENABLE=1;
    #2  PWDATA=1; PADDR=1; PSEL=1; PWRITE=1;
    #7  PWDATA=0;
    #1  PWDATA=1; PREADY=0; RENABLE=0; PSEL=0;
    #1  PWDATA=1; PADDR=1; PWRITE=1; 
    #1  PWDATA=1; PADDR=1; PSEL=0; PWRITE=1;
    #10;
    $finish;
  end
  
  //Checks if PSEL && PWRITE are high
  sequence seq_1;
  	(PSEL && PWRITE);
  endsequence

  sequence seq_2;
    (PWDATA && PADDR);
  endsequence
  
  //Non-overlapped implication implication, checks if PWDATA && PADDR
  //are high oen the positive edge then  
  //PSEL && PWRITE are high on the next
  property p;
    @(posedge clk) seq_2 |=> seq_1;
  endproperty
  
  //calling assert property
  //isunknown checks if any bit of the vector “PWDATA” is X or Z
  a_1: assert property(p);
  a_2: assert property (@(posedge clk) PWDATA |-> (!$isunknown(PADDR)));
  
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule

module asertion_ex_3;
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
  
  //PADDRis high on a given positive clock edge,
  //PREADY should be high after 3 clock cycles
  property p;
    @(posedge clk) (PADDR && PWRITE) |-> ##3 PREADY;
  endproperty
  
  //RENABLE high on same positive clock edge when 
  //READY is also high
  property q;
    @(posedge clk) RENABLE |-> PREADY;
  endproperty
  
  a_1: assert property(q);
  a_2: assert property(p);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule

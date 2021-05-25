interface interf(input logic clk);
  
  logic   PWRITE    ;
  logic   PSEL      ;
  logic   PENABLE   ;
  
  sequence p_write;
     (PSEL && PWRITE);
  endsequence
  
  sequence p_enable;
     ##1 PENABLE;
  endsequence
  
  property check_p_enable;
     @(posedge clk) p_write |-> p_enable;
  endproperty
    
    
    assertion_penable: assert property (check_p_enable) begin
          $display("!!! Successful !!!");
       end
       else begin
         $display("!!! Fail !!!");
       end
  
endinterface: interf




module assertion_penable_TB();
  
   logic clk;
  
   always #1 clk = ~clk;
  
   interf intf  
      (
         .clk(clk)
      );
  
   assertion_penable uut 
      (
         .clk      (clk)       ,
         .PWRITE   (intf.PWRITE)    ,
         .PSEL     (intf.PSEL)      ,
         .PENABLE  (intf.PENABLE)         
      );
     
   initial begin
     
     $dumpfile("dump.vcd");
     $dumpvars(1, assertion_penable_TB);
        
	 $display("assertion_penable_TB");
      
     $monitor 
        (
       	   "%t\|  PWRITE = %b  PSEL = %b  PENABLE = %b",
            $time, intf.PWRITE, intf.PSEL, intf.PENABLE
         );

    
      // Initialize Inputs
      clk           =   0   ;
      intf.PWRITE   =   1   ;
      intf.PSEL 	=   1   ;
			
      // Add stimulus here
      #5
      intf.PWRITE   =   1   ;
      intf.PSEL 	=   1   ;
     
      #5
      intf.PWRITE   =   0   ;
      intf.PSEL 	=   0   ;
     
      #5
      intf.PWRITE   =   1   ;
      intf.PSEL 	=   1   ;



      #10 $finish;
   end   


endmodule

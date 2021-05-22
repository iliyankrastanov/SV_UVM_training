interface inter_f(input logic clk, rst_n);
  logic wr_en_i;
  logic [7:0] data_i;
  logic full_o;
  logic rd_en_i;
  logic [7:0] data_o;
  logic empty_o;
  logic [3:0] count;
  
  always @ (posedge clk) begin
    if (wr_en_i) begin
      push: assert (!full_o) begin
          $display("[PASS] push when fifo not full");
       end 
       else begin
          $display("[FAIL] push when fifo full !");
       end
  	end
    
    if (rd_en_i) begin
      pop: assert (!empty_o) begin
      		$display ("[PASS] pop when fifo not empty");
    	end else begin
      		$display ("[FAIL] pop when fifo empty !");
    	end
    end
  end
endinterface: inter_f
  

module tb;
  logic rst_n;
  logic clk;
  integer i;
  
  always #10 clk <= ~clk;
  
  inter_f _if  
  			(
    		  .clk(clk),
              .rst_n(rst_n)
            );
  
  FIFO dut
  			(
    		  .clk(_if.clk),
              .rst_n(_if.rst_n),
              .data_i(_if.data_i),
              .full_o(_if.full_o),
              .rd_en_i(_if.rd_en_i),
              .data_o(_if.data_o),
              .empty_o(_if.empty_o),
              .wr_en_i(_if.wr_en_i)
            );	
  
  initial begin
    
    rst_n = 0;
    #1 rst_n = 1;
    #2 clk = 0;
    
    begin
      for (int i = 0; i < 50; i++) begin
      _if.data_i <= $random;
     _if.wr_en_i <= $random;
     _if.rd_en_i <= $random;
      
      $strobe("[%0t] push=%0b full=%0b pop=%0b empty=%0b",
              $time, _if.wr_en_i, _if.full_o, _if.rd_en_i, _if.empty_o);
      @(posedge clk);
    end
    #10 $finish;
  end   
 end
endmodule

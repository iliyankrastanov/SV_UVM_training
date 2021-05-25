module assertion_penable
   (
       input        clk          ,
       input        PWRITE       ,
       input        PSEL         ,
       output reg   PENABLE            
   );
   
  always @(posedge clk) begin
     if (PSEL && PWRITE) begin
        @(posedge clk) begin
           assign PENABLE = 1'b1;
        end
     end
     else begin
        assign PENABLE = 1'b0;
     end
  end
    
endmodule

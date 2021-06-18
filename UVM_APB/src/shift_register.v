`timescale 1ns/1ns
module shift_register ( input clk,res,
                        input [7:0] data_in,
  						      input valid_in,
                        output [31:0] data_out,
                        output valid_fifo);
  
  reg[31:0] shift_count = 0;
  reg[31:0] shift_reg ;
  reg data_change;
  
   always @(data_in or res)begin
   
    if(res)begin
    
      data_change = 1'b0;
    end
    else begin
    
      data_change = 1'b1;
    end
   end
   
   always @(posedge clk) begin
     if (res || valid_in) begin
 		shift_reg <= 32'b0;
     end
     
   else if (data_change) begin
      shift_reg <= {shift_reg, data_in};
      data_change <= 0;
   end
   end

  assign data_out = shift_reg;
  
  always @(data_out)
    begin
      shift_count = shift_count + 1;
    end
  
  always @(posedge clk) begin
    if (shift_count == 5 ) begin
    	shift_count <= 0; 
    end
  end
	
 assign valid_fifo = (shift_count == 4 && !valid_in ) ? 1 : 0;
  
endmodule
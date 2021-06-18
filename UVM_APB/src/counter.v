`timescale 1ns/1ns
module counter ( input clk,
                 input res,
                 input stop,
                 input vin,
                 output reg [7:0] dataout,
                 output reg valid1);

  always @(posedge clk) begin
    if (res || stop)
      dataout = 0;
    end
  
  always @(posedge vin) begin
    if (~res && ~stop) begin
      dataout = dataout + 1; 
  	end
	if (stop)
	  valid1 = 1'b1;
	else
	  valid1 = 1'b0;
     end
  
endmodule
`ifndef INTER_F
`define INTER_F

interface inter_f(input logic clk, res);
  
  bit data_in;
  logic full;
  logic is_apb;
 
endinterface: inter_f
`endif
`ifndef APB_INTER_F
`define APB_INTER_F

interface apb_inter_f(input logic clk, res);

  logic [6:0] paddr;
  logic psel;
  logic enbl;
  logic pwrite;
  logic [31:0] pwdata;
  logic pready;
  logic slerr;
  logic [31:0] prdata;
  logic is_apb;
 
 
endinterface: apb_inter_f
`endif

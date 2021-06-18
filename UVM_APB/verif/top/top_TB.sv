`ifndef TB_TOP
`define TB_TOP

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "apb_interface.sv"

import mem_test_list::*;

module tb_top;

  bit clk;
  bit res;
  //clock generation
  always #5 clk = ~clk;
  //reset Generation
  initial begin
    res = 1;
    #30 res = 0;
  end
  
  //creatinng instance of interface, inorder to connect DUT and testcase
  inter_f intf(clk,res);
  apb_inter_f a_intf(clk,res);
    
//     //DUT instance, interface signals are connected to the DUT ports
  mem_top DUT 
  (
    .clk(intf.clk),
    .res(intf.res),
    .button(intf.data_in),
    .mem_full(intf.full)
   );
   
   
  mem_top UUT
  (
    .clk(a_intf.clk),
    .res(a_intf.res),
    .paddr(a_intf.paddr),
    .psel(a_intf.psel),
    .enbl(a_intf.enbl),
    .pwrite(a_intf.pwrite),
    .pwdata(a_intf.pwdata),
    .pready(a_intf.pready),
    .slerr(a_intf.slerr),
    .prdata(a_intf.prdata),
    .is_apb(a_intf.is_apb)
   );
   
   
  initial begin
    uvm_config_db#(virtual inter_f)::set(uvm_root::get(),"*","inter_f", intf);
    uvm_config_db#(virtual apb_inter_f)::set(uvm_root::get(), "*","apb_inter_f", a_intf);
   
    run_test("apb_test");
  end
  
endmodule
`endif

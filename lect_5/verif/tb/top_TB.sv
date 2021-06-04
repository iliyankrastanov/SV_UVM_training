`ifndef TB_TOP
`define TB_TOP

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"

import mem_test_list::*;

module tb_top;
   
  //clock and reset signal declaration
  bit clk;
  bit rst;
   
  //clock generation
  always #5 clk = ~clk;
   
  //reset Generation
  initial begin
    rst = 1;
    #5 rst =0;
  end
   
  //creatinng instance of interface, inorder to connect DUT and testcase
  inter_f intf(clk,rst);
   
  //DUT instance, interface signals are connected to the DUT ports
  memory_driver DUT 
  (
    .clk(intf.clk),
    .rst(intf.rst),
    .data_in(intf.data_in),
    .full(intf.full)
   );
   
  //enabling the wave dump
  initial begin
   uvm_config_db#(virtual inter_f)::set(uvm_root::get(),"*","inter_f",intf);
    
    run_test();
  end
 
endmodule
`endif
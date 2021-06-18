`ifndef MEM_TEST_LIST
`define MEM_TEST_LIST


package mem_test_list;

import uvm_pkg::*;
`include "uvm_macros.svh"

import mem_agent_pkg::*;
import apb_agent_pkg::*;
import mem_env_pkg::*;

`include "base_test.sv"
`include "mem_test.sv"
`include "apb_test.sv"

endpackage

`endif
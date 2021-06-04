`ifndef MEM_ENV
`define MEM_ENV

class mem_env extends uvm_env;

`uvm_component_utils(mem_env)

//Declaration of Agent
mem_agent agent;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent=mem_agent::type_id::create("agent",this);
  
endfunction

endclass: mem_env

`endif
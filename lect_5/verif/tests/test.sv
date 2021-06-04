`ifndef TEST
`define TEST

class test extends uvm_test;

`uvm_component_utils(test)

mem_env env;
mem_sequence seq;

function new(string name = "test",uvm_component parent= null);
super.new(name,parent);
endfunction: new

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env = mem_env::type_id::create("env",this);
seq = mem_sequence::type_id::create("seq");
endfunction

 task run_phase(uvm_phase phase);
   seq.start(env.agent.sequencer);
 endtask : run_phase


endclass
`endif
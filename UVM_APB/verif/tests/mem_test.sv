`ifndef MEM_TEST
`define MEM_TEST

class mem_test extends base_test;

`uvm_component_utils(mem_test)


function new(string name = "mem_test",uvm_component parent= null);
   super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);

endfunction

task run_phase(uvm_phase phase); 
mem_sequence seq;
seq = mem_sequence::type_id::create("seq");
   phase.raise_objection(this);
 seq.start(env.agent.sequencer);
   phase.drop_objection(this);
endtask

endclass: mem_test
`endif
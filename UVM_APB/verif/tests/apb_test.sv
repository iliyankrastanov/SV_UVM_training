`ifndef APB_TEST
`define APB_TEST

class apb_test extends base_test;

`uvm_component_utils(apb_test)


function new(string name = "apb_test",uvm_component parent= null);
   super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);

endfunction

task run_phase(uvm_phase phase); 
   apb_sequence a_seq;
   a_seq = apb_sequence::type_id::create("a_seq");
   phase.raise_objection(this);
   a_seq.start(env.a_agent.a_sequencer);
   phase.drop_objection(this);
endtask

endclass: apb_test
`endif
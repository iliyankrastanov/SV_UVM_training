`ifndef MEM_SEQUENCE
`define MEM_SEQUENCE

class mem_sequence extends uvm_sequence#(mem_seq_item);

`uvm_object_utils(mem_sequence)

//constructor
function new(string name="mem_sequence",uvm_component parent=null);
super.new(name);
endfunction

virtual task body();
  repeat(10) begin
    req=mem_seq_item::type_id::create("req");
    start_item(req);
    req.randomize();
    finish_item(req);
  end
endtask
endclass
`endif
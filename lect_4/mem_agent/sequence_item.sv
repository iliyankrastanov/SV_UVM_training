`ifndef MEM_SEQ_ITEM
`define MEM_SEQ_ITEM

class mem_seq_item extends uvm_sequence_item;
  
  rand bit [1:0] data_in;

`uvm_object_utils_begin(mem_seq_item)
`uvm_field_int(data_in,UVM_ALL_ON)
`uvm_object_utils_end

//Constructor
function new(string name = "mem_seq_item");
super.new(name);
endfunction

endclass
`endif
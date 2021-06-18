`ifndef MEM_SEQUENCE
`define MEM_SEQUENCE

class mem_sequence extends uvm_sequence#(mem_seq_item);
`uvm_object_utils(mem_sequence)

//constructor
function new(string name= "mem_sequence");
super.new(name);
endfunction

 task body();
   repeat(1200) begin
   req=mem_seq_item::type_id::create("req");
      start_item(req);
      req.is_apb = 0;
      req.randomize();
      $display("rand sequence: %0b",req.data_in);
      finish_item(req);
   end
 endtask
 
endclass
`endif
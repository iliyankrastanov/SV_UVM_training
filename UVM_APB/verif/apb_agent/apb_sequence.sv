`ifndef APB_SEQUENCE
`define APB_SEQUENCE

 class apb_sequence extends uvm_sequence#(apb_seq_item);
  `uvm_object_utils(apb_sequence)

  //constructor
  function new(string name = "apb_sequence");
     super.new(name);
   endfunction

  task body();
    repeat(10) begin
    req = apb_seq_item::type_id::create("req");
    start_item(req);
       req.is_apb = 1;
       req.randomize();
    finish_item(req);
    end
   endtask 
endclass
`endif

`ifndef APB_SEQ_ITEM
`define APB_SEQ_ITEM

class apb_seq_item extends uvm_sequence_item;

  `uvm_object_utils(apb_seq_item)
  
   // rand 
   rand bit [6:0] paddr;
   rand bit [31:0] pwdata;
   rand bit pwrite;   
   bit is_apb;

   //Constructor
   function new(string name = "apb_seq_item");
     super.new(name);
   endfunction

endclass
`endif

`ifndef MEM_DRIVER
`define MEM_DRIVER

class mem_driver extends uvm_driver #(mem_seq_item);
 `uvm_component_utils(mem_driver)
  // Virtual Interface
  virtual inter_f vif;
 
  
     
  // Constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual inter_f)::get(this, "", "inter_f", vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
 
  // run phase
   task run_phase(uvm_phase phase);
    forever begin
    seq_item_port.get_next_item(req);
    $display( "rand driver: %0b",req.data_in);
  //respond_to_transfer(req);
    drive();
    seq_item_port.item_done();
    end
  endtask : run_phase
 
  // drive
   task drive();
    @(posedge vif.clk);
    vif.is_apb <= req.is_apb;
    vif.data_in <= req.data_in;
    $display("data = %0b", vif.data_in);
   endtask : drive
 
endclass : mem_driver

`endif
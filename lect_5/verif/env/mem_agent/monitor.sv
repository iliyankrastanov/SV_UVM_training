`ifndef MEM_MONITOR
`define MEM_MONITOR

class mem_monitor extends uvm_monitor;
 
  // Virtual Interface
  virtual inter_f vif;
 
  uvm_analysis_port #(mem_seq_item) item_collected_port;
 
  // Placeholder to capture transaction information.
  mem_seq_item trans_collected;
 
  `uvm_component_utils(mem_monitor)
 
  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual inter_f)::get(this, "", "inter_f", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
 
  // run phase
  virtual task run_phase(uvm_phase phase);
    item_collected_port.write(trans_collected);
  endtask : run_phase
 
endclass : mem_monitor

`endif
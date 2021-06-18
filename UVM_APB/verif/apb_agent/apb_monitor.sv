`ifndef APB_MONITOR
`define APB_MONITOR

class apb_monitor extends uvm_monitor;
 `uvm_component_utils(apb_monitor)
  // Virtual Interface
  virtual apb_inter_f a_vif;
    
  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
      if(!uvm_config_db#(virtual apb_inter_f)::get(this, "", "apb_inter_f", a_vif))
         `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".a_vif"});
  endfunction: build_phase 
  // run phase
  task run_phase(uvm_phase phase);        
     forever begin
        @(posedge a_vif.clk);
           if(a_vif.slerr == 1 && a_vif.pwrite == 0)
              `uvm_error("read state error", "unable to read information")
           else if(a_vif.slerr == 1 && a_vif.pwrite == 1)
              `uvm_error("write state error", "unable to write information")
     end        
  endtask : run_phase 
endclass : apb_monitor
`endif

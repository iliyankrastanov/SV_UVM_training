`ifndef APB_AGENT_CONFIG
`define APB_AGENT_CONFIG

class apb_agent_config extends uvm_object;
  `uvm_object_utils(apb_agent_config)
  
  virtual apb_inter_f a_vif;
  
  function new(string name = "apb_agent_config");
    super.new(name);
  endfunction
  
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  
endclass
`endif

`ifndef APB_AGENT
`define APB_AGENT

class apb_agent extends uvm_agent;
  
  `uvm_component_utils(apb_agent)

  apb_agent_config a_config;
  apb_driver a_driver;
  apb_monitor a_monitor;
  apb_sequencer a_sequencer;

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

  if(a_config == null)
     if(!uvm_config_db#(apb_agent_config)::get(this, "*", "apb_agent_config", a_config))
     `uvm_fatal("APB_AGNT", "No apb_agent config")

  if(get_is_active() == UVM_ACTIVE) begin
     a_driver = apb_driver::type_id::create("a_driver",this);
     a_sequencer = apb_sequencer::type_id::create("a_sequencer",this);
  end
 
     a_monitor = apb_monitor::type_id::create("a_monitor",this);
  endfunction

  function void connect_phase(uvm_phase phase);
     if(get_is_active() == UVM_ACTIVE) begin
        a_driver.seq_item_port.connect(a_sequencer.seq_item_export);
     end
  endfunction
endclass
`endif

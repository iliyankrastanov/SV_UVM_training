`ifndef AGENT_CONFIG
`define AGENT_CONFIG

class agent_config extends uvm_object;
  `uvm_object_utils(agent_config)
  
  virtual inter_f vif;
  
  function new(string name = "agent_config");
    super.new(name);
  endfunction
  
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  
endclass
`endif


`ifndef MEM_AGENT
`define MEM_AGENT

class mem_agent extends uvm_agent;
`uvm_component_utils(mem_agent)

agent_config mem_config;

mem_driver driver;
mem_monitor monitor;
mem_sequencer sequencer;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
   super.build_phase(phase);
      
    if(mem_config == null)
    if(!uvm_config_db#(agent_config)::get(this, "*", "agent_config", mem_config))
    `uvm_fatal("AGNT", "No agent config")
       
   if(get_is_active() == UVM_ACTIVE) begin
      driver=mem_driver::type_id::create("driver",this);
   sequencer=mem_sequencer::type_id::create("sequencer",this);
  
   end
 
   monitor=mem_monitor::type_id::create("monitor",this);
endfunction

function void connect_phase(uvm_phase phase);
if(get_is_active() == UVM_ACTIVE) begin
driver.seq_item_port.connect(sequencer.seq_item_export);
end
endfunction

endclass
`endif
`ifndef ENV_CONFIG
`define ENV_CONFIG

class env_config extends uvm_object;
 `uvm_object_utils(env_config)
 
  bit has_mem_agent_implemented=1;
  bit has_apb_agent_implemented=1;
  
  agent_config mem_agent_cfg;
  apb_agent_config apb_agent_cfg;
  
  function new(string name = "");
    super.new(name);
  endfunction
  
endclass
`endif

`ifndef MEM_ENV
`define MEM_ENV

class mem_env extends uvm_env;

  `uvm_component_utils(mem_env)
  
  virtual inter_f vif;
  virtual apb_inter_f a_vif;
  
  //Declaration of Environment
  env_config env_cfg;

  //Declaration of Agent
  mem_agent agent;
  apb_agent a_agent;

  //Handle to config
  agent_config conf;
  apb_agent_config a_conf;

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(env_cfg == null)
      if(!uvm_config_db#(env_config)::get(this, "", "env_config", env_cfg))
       `uvm_fatal("ENV_CFG", "No environment config")

     agent = mem_agent::type_id::create("agent",this);
     a_agent = apb_agent::type_id::create("a_agent",this);
  
     uvm_config_db#(virtual inter_f)::set(this, "agent","inter_f", vif);
     uvm_config_db#(agent_config)::set(this, "*", "agent_config", conf);
   
     uvm_config_db#(virtual apb_inter_f)::set(this, "a_agent","apb_inter_f", a_vif);
     uvm_config_db#(apb_agent_config)::set(this, "*", "apb_agent_config", a_conf);
endfunction

endclass: mem_env

`endif
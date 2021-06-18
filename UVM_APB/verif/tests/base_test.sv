`ifndef BASE_TEST
`define BASE_TEST

class base_test extends uvm_test;

   `uvm_component_utils(base_test)
   
  virtual inter_f vif;
  virtual apb_inter_f a_vif;
   
   mem_env env;
   env_config env_cfg;
   agent_config mem_agent_cfg;
   apb_agent_config apb_agent_cfg;
   
   function new(string name = "base_test",uvm_component parent= null);
      super.new(name,parent);
   endfunction: new

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     
     env_cfg = env_config::type_id::create("env_cfg", this);
     mem_agent_cfg = agent_config::type_id::create("mem_agent_cfg", this);
     apb_agent_cfg = apb_agent_config::type_id::create("apb_agent_cfg", this);
     
     mem_agent_cfg.vif = vif;     
     apb_agent_cfg.a_vif = a_vif;
     
     env_cfg.mem_agent_cfg = mem_agent_cfg;
     env_cfg.apb_agent_cfg = apb_agent_cfg;
     
     uvm_config_db#(env_config)::set(this, "*", "env_config", env_cfg);  
     
     env = mem_env::type_id::create("env",this);
     
   endfunction


endclass
`endif
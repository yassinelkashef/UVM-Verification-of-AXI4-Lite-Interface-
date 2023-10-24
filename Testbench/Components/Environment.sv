class Environment extends uvm_env;




  `uvm_component_utils(Environment)
  
  
  
  
  Agent agent;
  
  
  Coverage_Collector coverage_collector;
 
 
 
 
  function new (string name = "Environment" , uvm_component parent);
  
  
     super.new(name,parent);
	  
	  `uvm_info(get_type_name(),"Inside constructor of Environment Class",UVM_LOW)
	  
	  
  
  endfunction: new
 
 
 

 
 
 

 
 function void build_phase (uvm_phase phase);
 
 
 
    super.build_phase(phase);
	 
	 
	 `uvm_info(get_type_name(),"Inside build phase of Environment Class",UVM_LOW)
	 

	 agent = Agent::type_id::create("agent",this);

	 
	 coverage_collector = Coverage_Collector::type_id::create("coverage_collector",this);
	 
	 
 
 
 endfunction: build_phase
 
 
 
 
 
 
 
   function void connect_phase (uvm_phase phase);
  
  
    super.connect_phase(phase);
	 
	 
	 `uvm_info(get_type_name(),"Inside connect phase of Environment Class",UVM_LOW)
	 
	 
	  agent.monitor.monitor_port.connect(coverage_collector.analysis_export);

  
  endfunction :connect_phase

 
 
 
 
 
 
 
endclass: Environment
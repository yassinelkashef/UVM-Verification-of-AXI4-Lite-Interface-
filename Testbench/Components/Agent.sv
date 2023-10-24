class Agent  extends uvm_agent;






  `uvm_component_utils(Agent)
  
  
  
  Monitor monitor;
    
  Sequencer sequencer; 
	 
  Driver   driver;
	 
	 
	 
	 
	 
	 
  
  function new(string name = "Agent" ,uvm_component parent);
  
  
    super.new(name,parent);
  
    `uvm_info(get_type_name(),"Inside constructor of Agent Class",UVM_LOW)
  
  
  endfunction :new
  
  
  
  
  
  
  
  function void build_phase(uvm_phase phase);
  
  
    super.build_phase(phase);
    
	 
	 `uvm_info(get_type_name(),"Inside build phase of Agent Class",UVM_LOW)
	 
	 

    monitor = Monitor::type_id::create("monitor",this);
	 
    driver = Driver::type_id::create("driver",this);
	 
    sequencer = Sequencer::type_id::create("sequencer",this);
	 
    
  
  endfunction :build_phase 
  
  
  
  
  
  
  
  
  function void connect_phase (uvm_phase phase);
  
  
    super.connect_phase(phase);
	 
	 
	 `uvm_info(get_type_name(),"Inside connect phase of Agent Class",UVM_LOW)
	 
	 
  	 driver.seq_item_port.connect(sequencer.seq_item_export);

  
  endfunction: connect_phase
  
  
  
  
  
  
  
  task  run_phase(uvm_phase phase);
  
  
    super.run_phase(phase);
  
  
	 `uvm_info(get_type_name(),"Inside run phase of Agent Class",UVM_LOW)
  
 
  endtask :run_phase
  
  
  
  
  
  
  
  
endclass :Agent
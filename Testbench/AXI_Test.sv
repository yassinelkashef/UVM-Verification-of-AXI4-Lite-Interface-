class AXI_Test  extends uvm_test;



  `uvm_component_utils(AXI_Test)
  
  
  
  Environment  AXI_env;
  
  
  
  AXI_Reset_Seq   reset_seq;
  
  AXI_Write_Data_8 AXI_WR_8;
  
  AXI_Write_Data_16 AXI_WR_16;

  AXI_Write_Data_32 AXI_WR_32;
  
  AXI_Read_Data AXI_RD;

  
  
  
  
  
  function new(string name = "AXI_Test" ,uvm_component parent);
  
  
    super.new(name,parent);
  
    `uvm_info(get_type_name(),"Inside constructor of AXI Test Class",UVM_LOW)
  
  
  endfunction :new
  
  
  
  
  
  
  
  
  
  function void build_phase(uvm_phase phase);
  
  
    super.build_phase(phase);
    
	 
	 `uvm_info(get_type_name(),"Inside build phase of AXI Test Class",UVM_LOW)

	 
	 AXI_env = Environment::type_id::create("AXI_env",this);
	 
	 
  
  endfunction :build_phase 
  
  
  
  
  
  
  
  
  function void connect_phase (uvm_phase phase);
  
  
    super.connect_phase(phase);
	 
	 
	 `uvm_info(get_type_name(),"Inside connect phase of AXI Test Class",UVM_LOW)
	 
  
  endfunction :connect_phase
  
  
  
  
  
  
  
  
  
  task  run_phase(uvm_phase phase);
  
  


  
    super.run_phase(phase);
  
  
	 `uvm_info(get_type_name(),"Inside run phase of AXI Test Class",UVM_LOW)
  
   
	
	
	 phase.raise_objection(this);
	 
	   

           
           reset_seq = AXI_Reset_Seq::type_id::create("reset_seq");
	 
	   reset_seq.start(AXI_env.agent.sequencer);
	    
	   #30;
	    
		 
		 repeat(6000) begin 
		 
      
		  #50;
		  		 
       AXI_WR_8 = AXI_Write_Data_8::type_id::create("AXI_WR_8");
	 
	     AXI_WR_8.start(AXI_env.agent.sequencer);
		 

		 end
	 
	 
	 
	 
	 
	 
		 repeat(6000) begin 
		 
      
		  #50;
		  		 
		  AXI_WR_16 = AXI_Write_Data_16::type_id::create("AXI_WR_16");
	 
	     AXI_WR_16.start(AXI_env.agent.sequencer);
		 

		 end
	 
	 
	 
	 
	 
	 
		 repeat(6000) begin 
		 
      
		  #50;
		  		 
		  AXI_WR_32 = AXI_Write_Data_32::type_id::create("AXI_WR_32");
	 
	     AXI_WR_32.start(AXI_env.agent.sequencer);
		 

		 end
	

           
           reset_seq = AXI_Reset_Seq::type_id::create("reset_seq");
	 
	   reset_seq.start(AXI_env.agent.sequencer);
	    
	   #30;
	
	
	
		 repeat(6000) begin 
		 
      
		  #50;
		  		 
		  AXI_RD = AXI_Read_Data::type_id::create("AXI_RD");
	 
	     AXI_RD.start(AXI_env.agent.sequencer);
		 

		 end 
	
	
	
	 
	 
	 phase.drop_objection(this);
  
  

  

  endtask :run_phase
  
  
  
  
  
  
  
  
  
  
  
endclass :AXI_Test
class Coverage_Collector extends uvm_subscriber #(Seq_Item);






  `uvm_component_utils(Coverage_Collector)
  
  
   Seq_Item item;
  
  
  
  
  
  
   
  
  
  covergroup AXI4lite_Signals_Cover;
 
    
	 option.per_instance = 1;
	 
	 
	 
	 
	 AXI_Reset_cover :coverpoint item.rst ;
	 
	 
	 
	 AXI_WR_ADDER_cover :coverpoint item.s_axil_awaddr ;
	 

	 
	 
	 AXI_WR_DATA_cover :coverpoint item.s_axil_wdata ;
	 

	 
	 
	 awprot_cover :coverpoint item.s_axil_awprot 
	 {
	 

	    wildcard bins unprivileged_access= {3'b??0} ;

	    wildcard bins privileged_access= {3'b??1} ;


	    wildcard bins non_secure_access = {3'b?0?} ;

	    wildcard bins secure_access = {3'b?1?} ;
		 

	    wildcard bins data_access = {3'b0??} ;

	    wildcard bins instruction_access = {3'b1??} ;		 	 
		 	 
	 }
	 
	 
	 
	 
	 
    wstrb_cover:coverpoint item.s_axil_wstrb
	 {
	 
	    bins data_8bit = {4'b0001} ;

	    bins data_16bit = {4'b0011} ;
		 
	    bins data_32bit = {4'b1111} ;
		 	 
	 }
	 
 
 
 
	 AXI_RD_ADDER_cover :coverpoint item.s_axil_araddr ;
	
	
	
	
	
	 arprot_cover :coverpoint item.s_axil_arprot 
	 
	 {
	 
	    wildcard bins unprivileged_access= {3'b??0} ;

	    wildcard bins privileged_access= {3'b??1} ;


	    wildcard bins non_secure_access = {3'b?0?} ;

	    wildcard bins secure_access = {3'b?1?} ;
		 

	    wildcard bins data_access = {3'b0??} ;

	    wildcard bins instruction_access = {3'b1??} ;	
		 
		 	 
	 }

	
	 

	 


   endgroup: AXI4lite_Signals_Cover
  
  
   
  
  

  
  
  
  
  
  
  
  
    function new(string name = "Coverage_collector" ,uvm_component parent);
  
  
    super.new(name,parent);
  
    `uvm_info(get_type_name(),"Inside constructor of Coverage Collector Class",UVM_LOW)
  
    AXI4lite_Signals_Cover = new();
    
    
  endfunction :new
    
  
  
  
  
  
  function void build_phase(uvm_phase phase);
  
  
    super.build_phase(phase);
    
	 
	 `uvm_info(get_type_name(),"Inside build phase of Coverage Collector Class",UVM_LOW)
	 
  
  endfunction :build_phase 
  
  
  
  
  
  
  
  
  function void connect_phase (uvm_phase phase);
  
  
    super.connect_phase(phase);
	 
	 
	 `uvm_info(get_type_name(),"Inside connect phase of Coverage Collector Class",UVM_LOW)
	 
  
  endfunction :connect_phase
  
  
  
  
  
  
  
  task  run_phase(uvm_phase phase);
  
  
    super.run_phase(phase);
  
  
	 `uvm_info(get_type_name(),"Inside run phase of Coverage Collector Class",UVM_LOW)
    
 
  endtask :run_phase

  
  
  
  
  
  
  
  function void write(Seq_Item t);
  
  
    item = Seq_Item::type_id::create("item");
	 
	 $cast(item,t);
  
    AXI4lite_Signals_Cover.sample();
    
	 
	  	 
	 
     	 
  endfunction: write
  
  
  

  
  
  
  
endclass: Coverage_Collector
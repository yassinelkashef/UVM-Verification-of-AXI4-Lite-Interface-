class Monitor  extends uvm_monitor;




  `uvm_component_utils(Monitor)
  
  
   virtual Interface intf;
  
  
   Seq_Item item;

  
  uvm_analysis_port #(Seq_Item) monitor_port;
  
  

  
  
  
  
  function new(string name = "Monitor" ,uvm_component parent);
  
  
    super.new(name,parent);
  
    `uvm_info(get_type_name(),"Inside constructor of Monitor Class",UVM_LOW)
    
    
    
  endfunction :new
  
  
  
  
  
  
  
  function void build_phase(uvm_phase phase);
  
  
  
    super.build_phase(phase);
    
	 
	 `uvm_info(get_type_name(),"Inside build phase of Monitor Class",UVM_LOW)
	 
    
	 if(!(uvm_config_db #(virtual Interface)::get(this,"*","intf",intf)))
	 
	     `uvm_error(get_type_name(),"failed to get virtual interface inside Monitor class")
  
  
    
	monitor_port = new("monitor_port",this);
	 
	 
	 
  endfunction :build_phase 
  
  
  
  
  
  
  
  
  function void connect_phase (uvm_phase phase);
  
  
    super.connect_phase(phase);
	 
	 
	 `uvm_info(get_type_name(),"Inside connect phase of Monitor Class",UVM_LOW)
	
  
  
  endfunction :connect_phase
  
  
  
  
  
  
  
  
  
  task  run_phase(uvm_phase phase);
  
  
  
  
    super.run_phase(phase);
  
  
	 `uvm_info(get_type_name(),"Inside run phase of Monitor Class",UVM_LOW)
  
               wait(intf.rst);
               item = Seq_Item::type_id::create("item");		
	       item.rst= intf.rst;  
               monitor_port.write(item);	
		
	  forever begin 
	  
	  
	  
	    item = Seq_Item::type_id::create("item");
		 
		 
                       
		 
		 wait(!intf.rst && ((intf.s_axil_awvalid && intf.s_axil_wvalid) || intf.s_axil_arvalid) )	 
		 
		 
		 
		   @(posedge intf.clk); 
			 
			 
			 

			if(intf.s_axil_awvalid && intf.s_axil_wvalid) begin 
		


	           item.s_axil_awaddr = intf.s_axil_awaddr;
				  
	           item.s_axil_wdata = intf.s_axil_wdata;
				  
	           item.s_axil_awprot = intf.s_axil_awprot;
				  
	           item.s_axil_wstrb = intf.s_axil_wstrb;
	
	           item.s_axil_araddr = 0;
				  
	           item.s_axil_arprot = 0; 
	

         end	
			 
			 
			 
			 
			 
			 
			 
			if(intf.s_axil_arvalid) begin 
		


	           item.s_axil_araddr = intf.s_axil_araddr;
				  
	           item.s_axil_arprot = intf.s_axil_arprot;
				  
	           item.s_axil_awaddr = 0;
				  
	           item.s_axil_wdata = 0;
				  
	           item.s_axil_awprot = 0;
				  
	           item.s_axil_wstrb = 0;
				  
	

         end	
			 
			 
			 
			 
		  wait(intf.s_axil_rvalid || intf.s_axil_bvalid);
		 
		 
		 
		 item.rst= intf.rst;


		  if(intf.s_axil_rvalid)
		  
		      item.s_axil_rdata = intf.s_axil_rdata;
		 
		 
		 
			 
		  monitor_port.write(item);
	 
			 
	  
	  end
	 



 
 
 
  endtask :run_phase
  
  
  
  
  
  
  
  
  
  
endclass :Monitor
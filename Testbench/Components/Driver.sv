class Driver extends uvm_driver #(Seq_Item);




  `uvm_component_utils(Driver)
  
  
  virtual Interface intf;
  
  
  Seq_Item item;
  
  
  
  
  
  
  
  function new(string name = "Driver" ,uvm_component parent);
  
  
    super.new(name,parent);
  
    `uvm_info(get_type_name(),"Inside constructor of Driver Class",UVM_LOW)
  
  
  endfunction :new
  
  
  
  
  
  
  
  function void build_phase(uvm_phase phase);
  
  
    super.build_phase(phase);
    
	 
	 `uvm_info(get_type_name(),"Inside build phase of Driver Class",UVM_LOW)
   
   
   if(!(uvm_config_db #(virtual Interface)::get(this,"*","intf",intf)))
	 
	     `uvm_error(get_type_name(),"failed to get virtual interface inside Driver class")
  


  
  endfunction :build_phase 
  
  
  
  
  
  
  
  
  function void connect_phase (uvm_phase phase);
  
  
    super.connect_phase(phase);
	 
	 
	 `uvm_info(get_type_name(),"Inside connect phase of Driver Class",UVM_LOW)
	 
  
  endfunction :connect_phase
  
  
  
  
  
  
  
  task run_phase(uvm_phase phase);
  
  
    super.run_phase(phase);
  
  
	 `uvm_info(get_type_name(),"Inside run phase of Driver Class",UVM_LOW)
    
	 
	 
	 
	 forever begin 
	 
	 
	 
	  item = Seq_Item::type_id::create("item");

	 
	  seq_item_port.get_next_item(item);
	  
	  
	  drive(item);
	  
	  
	  
	  seq_item_port.item_done();
	  
	  
	 
	 end
	 
 
 
 
  endtask :run_phase
  
  
  
  
  
  
  
  
  task  drive (Seq_Item item);
  
  
      @(posedge intf.clk);
			 
			 
		if(item.op==1 )begin	 
			 
			 
	       intf.rst = item.rst;
			 
          intf.s_axil_awaddr = item.s_axil_awaddr;
			 
			 intf.s_axil_wstrb = item.s_axil_wstrb;

			 intf.s_axil_wdata = item.s_axil_wdata;
			 
			 intf.s_axil_awprot  = item.s_axil_awprot ;
			 
			 intf.s_axil_awvalid = 1'b1;
			 
          intf.s_axil_wvalid  = 1'b1;
			 
			 intf.s_axil_bready  = 1'b1;
			 
			 
			 
			 wait(intf.s_axil_awready && intf.s_axil_wready );
			 
			 
			 @(posedge intf.clk);
			 
			 
			 intf.s_axil_awvalid = 1'b0;
			 
          intf.s_axil_wvalid  = 1'b0;
			 
			 
			 
			 wait(intf.s_axil_bvalid);
			 
			 @(posedge intf.clk);
			 
			 intf.s_axil_bready  = 1'b0;
			  
                         intf.s_axil_awaddr = 0;
			 
			 intf.s_axil_wstrb = 0;

			 intf.s_axil_wdata = 0;			 
			 
			 

			 
			 



        end
		  
		  
		  
		  
		  
		 if(item.op==2) begin 
		 

	       intf.rst = item.rst;
			 
          intf.s_axil_araddr  = item.s_axil_araddr;
			 
			 intf.s_axil_arprot   = item.s_axil_arprot  ;
			 
			 intf.s_axil_arvalid = 1'b1;
			 
			 intf.s_axil_rready = 1'b1;
			 
			 
			 wait(intf.s_axil_arready);
			 
			 
			 @(posedge intf.clk);
			 
	 
			 intf.s_axil_arvalid = 1'b0;
			 
                         intf.s_axil_araddr= 0;
			 	 
			 
			 wait(intf.s_axil_rvalid);
			 
			 
			 @(posedge intf.clk);
			 
			 
                         intf.s_axil_rready= 0;	
			  

		 
		 
		 
		 
		 
		 
		 
		 
		 end
          
		
 		 if(item.op==0) begin 
		 
		 
	       intf.rst = item.rst;
			 
          intf.s_axil_wstrb  = item.s_axil_wstrb;
			 
			 intf.s_axil_wdata   = item.s_axil_wdata  ;
			 
          intf.s_axil_awprot  = item.s_axil_awprot;
			 
			 intf.s_axil_arprot   = item.s_axil_arprot  ;
			 
			 //intf.s_axil_awaddr   = item.s_axil_awaddr  ;
			 

 
		 
		 end     
		
		





		
  
  endtask: drive
















endclass: Driver
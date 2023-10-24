class AXI_Reset_Seq extends Base_Sequence;




    `uvm_object_utils(AXI_Reset_Seq)
	 
	 
	 Seq_Item AXI_RST;
	 
	 
	 
	 
	 
	 
	 function new (string name = "AXI_Reset_Seq");
	 
	     super.new(name);
	 
	 endfunction: new
	 
	 
	 
	 
	 
	 
	 
	 task body;
	 
	 
	 
	   AXI_RST = Seq_Item::type_id::create("AXI_RST");
	   
		
		
		start_item(AXI_RST);
		
		
		
		if(!(AXI_RST.randomize() with {  rst==1;
	                                     s_axil_wstrb==4'b0000; 
													 s_axil_wdata==0;
													 s_axil_awprot==0; 
													 s_axil_arprot==0;
													 s_axil_awaddr==0;
													 op==0;
												                   	  } ))
		
		    `uvm_error(get_type_name(),"randomization failed in AXI_Reset_Seq")
		
		
		
		finish_item(AXI_RST);
	 
	 
	 
	 
	 endtask: body
	 

	 
	 
	 
	 

endclass: AXI_Reset_Seq
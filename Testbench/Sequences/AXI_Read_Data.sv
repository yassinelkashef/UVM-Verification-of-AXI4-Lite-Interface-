class AXI_Read_Data extends Base_Sequence;




    `uvm_object_utils(AXI_Read_Data)
	 
	 
	 Seq_Item AXI_RD;
	 
	 
	 
	 
	 
	 
	 function new (string name = "AXI_Read_Data");
	 
	     super.new(name);
	 
	 endfunction: new
	 
	 
	 
	 
	 
	 
	 
	 task body;
	 
	 
	 
	   AXI_RD = Seq_Item::type_id::create("AXI_RD");
	   
		
		
		start_item(AXI_RD);
		
		
		
		if(!(AXI_RD.randomize() with {  rst==0;
	                                     s_axil_wstrb==0; 
													 s_axil_wdata==0;
													 s_axil_awprot==0; 
																										 s_axil_awaddr==0;
													 op==2;
												                   	  } ))
		
		    `uvm_error(get_type_name(),"randomization failed in AXI_Read_Data")
		
		
		
		finish_item(AXI_RD);
	 
	 
	 
	 
	 endtask: body
	 

	 
	 
	 
	 

endclass: AXI_Read_Data
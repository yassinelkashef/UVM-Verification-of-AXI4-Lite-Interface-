class AXI_Write_Data_32 extends Base_Sequence;




    `uvm_object_utils(AXI_Write_Data_32)
	 
	 
	 Seq_Item AXI_WR_32;
	 
	 
	 
	 
	 
	 
	 function new (string name = "AXI_Write_Data_32");
	 
	     super.new(name);
	 
	 endfunction: new
	 
	 
	 
	 
	 
	 
	 
	 task body;
	 
	 
	 
	   AXI_WR_32 = Seq_Item::type_id::create("AXI_WR_32");
	   
		
		
		start_item(AXI_WR_32);
		
		
		
		if(!(AXI_WR_32.randomize() with {  rst==0; 
		                                   s_axil_wstrb==4'b1111; 
													  s_axil_wdata inside {[32'h00000000:32'hffffffff]} ;
													  s_axil_araddr==0;
													
													  s_axil_arprot==0;
													  op==1;                       
																				} ))
		
		    `uvm_error(get_type_name(),"randomization failed in AXI_Write_Data_32")
		
		
		
		finish_item(AXI_WR_32);
	 
	 
	 
	 
	 endtask: body
	 

	 
	 
	 
	 

endclass: AXI_Write_Data_32
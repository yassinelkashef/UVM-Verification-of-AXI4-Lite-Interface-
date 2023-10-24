class Seq_Item extends uvm_sequence_item;




  `uvm_object_utils(Seq_Item)

  
  
   rand logic rst;
   
  	rand logic [31:0] s_axil_awaddr;
	
	rand logic [31:0] s_axil_wdata;
	
   rand logic [2:0] s_axil_awprot;
	
	rand logic [31:0] s_axil_araddr;
	
	rand logic [2:0] s_axil_arprot;

	rand logic [3:0] s_axil_wstrb;
	
	logic      [31:0] s_axil_rdata;
   
	rand bit[1:0]  op;
   
  
  

  
  
constraint data_width {
  
     s_axil_wstrb inside {4'b1111,4'b0111,4'b0011,4'b0001,4'b0000};
  
  }
  
  
  

  
  
function new (string name = "Seq_Item");


   super.new(name);
 

endfunction





endclass: Seq_Item
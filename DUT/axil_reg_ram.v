module axi_reg_ram #(
	// Width of data bus in bits
	parameter DATA_WIDTH  = 32            ,
	// Width of address bus in bits
	parameter ADDR_WIDTH  = 32            ,
	// Width of wstrb (width of data bus in words)
	parameter STRB_WIDTH  = (DATA_WIDTH/8),
	// AW channel register type
	// 0 to bypass, 1 for simple buffer
	parameter AW_REG_TYPE = 1             ,
	// W channel register type
	// 0 to bypass, 1 for simple buffer
	parameter W_REG_TYPE  = 1             ,
	// B channel register type
	// 0 to bypass, 1 for simple buffer
	parameter B_REG_TYPE  = 1             ,
	// AR channel register type
	// 0 to bypass, 1 for simple buffer
	parameter AR_REG_TYPE = 1             ,
	// R channel register type
	// 0 to bypass, 1 for simple buffer
	parameter R_REG_TYPE  = 1
) (
	input  wire                  clk           , // Clock
	input  wire                  rst           , // reset active high
	/*
	* AXI lite slave interface
	*/
	input  wire [ADDR_WIDTH-1:0] s_axil_awaddr ,
	input  wire [           2:0] s_axil_awprot ,
	input  wire                  s_axil_awvalid,
	output wire                  s_axil_awready,
	input  wire [DATA_WIDTH-1:0] s_axil_wdata  ,
	input  wire [STRB_WIDTH-1:0] s_axil_wstrb  ,
	input  wire                  s_axil_wvalid ,
	output wire                  s_axil_wready ,
	output wire [           1:0] s_axil_bresp  ,
	output wire                  s_axil_bvalid ,
	input  wire                  s_axil_bready ,
	input  wire [ADDR_WIDTH-1:0] s_axil_araddr ,
	input  wire [           2:0] s_axil_arprot ,
	input  wire                  s_axil_arvalid,
	output wire                  s_axil_arready,
	output wire [DATA_WIDTH-1:0] s_axil_rdata  ,
	output wire [           1:0] s_axil_rresp  ,
	output wire                  s_axil_rvalid ,
	input  wire                  s_axil_rready
);


	wire [ADDR_WIDTH-1:0] axil_awaddr ;
	wire [           2:0] axil_awprot ;
	wire                  axil_awvalid;
	wire                  axil_awready;
	wire [DATA_WIDTH-1:0] axil_wdata  ;
	wire [STRB_WIDTH-1:0] axil_wstrb  ;
	wire                  axil_wvalid ;
	wire                  axil_wready ;
	wire [           1:0] axil_bresp  ;
	wire                  axil_bvalid ;
	wire                  axil_bready ;
	wire [ADDR_WIDTH-1:0] axil_araddr ;
	wire [           2:0] axil_arprot ;
	wire                  axil_arvalid;
	wire                  axil_arready;
	wire [DATA_WIDTH-1:0] axil_rdata  ;
	wire [           1:0] axil_rresp  ;
	wire                  axil_rvalid ;
	wire                  axil_rready ;

	axil_register #(
		.DATA_WIDTH (DATA_WIDTH ),
		.ADDR_WIDTH (ADDR_WIDTH ),
		.STRB_WIDTH (STRB_WIDTH ),
		.AW_REG_TYPE(AW_REG_TYPE),
		.W_REG_TYPE (W_REG_TYPE ),
		.B_REG_TYPE (B_REG_TYPE ),
		.AR_REG_TYPE(AR_REG_TYPE),
		.R_REG_TYPE (R_REG_TYPE )
	) axil_mem_buffer (
		.clk           (clk           ),
		.rst           (rst           ),
		.s_axil_awaddr (s_axil_awaddr ),
		.s_axil_awprot (s_axil_awprot ),
		.s_axil_awvalid(s_axil_awvalid),
		.s_axil_awready(s_axil_awready),
		.s_axil_wdata  (s_axil_wdata  ),
		.s_axil_wstrb  (s_axil_wstrb  ),
		.s_axil_wvalid (s_axil_wvalid ),
		.s_axil_wready (s_axil_wready ),
		.s_axil_bresp  (s_axil_bresp  ),
		.s_axil_bvalid (s_axil_bvalid ),
		.s_axil_bready (s_axil_bready ),
		.s_axil_araddr (s_axil_araddr ),
		.s_axil_arprot (s_axil_arprot ),
		.s_axil_arvalid(s_axil_arvalid),
		.s_axil_arready(s_axil_arready),
		.s_axil_rdata  (s_axil_rdata  ),
		.s_axil_rresp  (s_axil_rresp  ),
		.s_axil_rvalid (s_axil_rvalid ),
		.s_axil_rready (s_axil_rready ),
		.m_axil_awaddr (axil_awaddr   ),
		.m_axil_awprot (axil_awprot   ),
		.m_axil_awvalid(axil_awvalid  ),
		.m_axil_awready(axil_awready  ),
		.m_axil_wdata  (axil_wdata    ),
		.m_axil_wstrb  (axil_wstrb    ),
		.m_axil_wvalid (axil_wvalid   ),
		.m_axil_wready (axil_wready   ),
		.m_axil_bresp  (axil_bresp    ),
		.m_axil_bvalid (axil_bvalid   ),
		.m_axil_bready (axil_bready   ),
		.m_axil_araddr (axil_araddr   ),
		.m_axil_arprot (axil_arprot   ),
		.m_axil_arvalid(axil_arvalid  ),
		.m_axil_arready(axil_arready  ),
		.m_axil_rdata  (axil_rdata    ),
		.m_axil_rresp  (axil_rresp    ),
		.m_axil_rvalid (axil_rvalid   ),
		.m_axil_rready (axil_rready   )
	);



	axil_ram #(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(16        )
	) i_axil_ram (
		.clk           (clk         ),
		.rst           (rst         ),
		.s_axil_awaddr (axil_awaddr ),
		.s_axil_awvalid(axil_awvalid),
		.s_axil_awready(axil_awready),
		.s_axil_wdata  (axil_wdata  ),
		.s_axil_wstrb  (axil_wstrb  ),
		.s_axil_wvalid (axil_wvalid ),
		.s_axil_wready (axil_wready ),
		.s_axil_bresp  (axil_bresp  ),
		.s_axil_bvalid (axil_bvalid ),
		.s_axil_bready (axil_bready ),
		.s_axil_araddr (axil_araddr ),
		.s_axil_arprot (axil_arprot ),
		.s_axil_arvalid(axil_arvalid),
		.s_axil_arready(axil_arready),
		.s_axil_rdata  (axil_rdata  ),
		.s_axil_rresp  (axil_rresp  ),
		.s_axil_rvalid (axil_rvalid ),
		.s_axil_rready (axil_rready )
	);


endmodule
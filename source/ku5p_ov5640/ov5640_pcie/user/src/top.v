module top (
    output        C0_DDR4_0_act_n       ,
    output [16:0] C0_DDR4_0_adr         ,
    output [1:0]  C0_DDR4_0_ba          ,
    output [0:0]  C0_DDR4_0_bg          ,
    output [0:0]  C0_DDR4_0_ck_c        ,
    output [0:0]  C0_DDR4_0_ck_t        ,
    output [0:0]  C0_DDR4_0_cke         ,
    output [0:0]  C0_DDR4_0_cs_n        ,
    inout [3:0]   C0_DDR4_0_dm_n        ,
    inout [31:0]  C0_DDR4_0_dq          ,
    inout [3:0]   C0_DDR4_0_dqs_c       ,
    inout [3:0]   C0_DDR4_0_dqs_t       ,
    output [0:0]  C0_DDR4_0_odt         ,
    output        C0_DDR4_0_reset_n     ,
    input         C0_SYS_CLK_0_clk_n    ,
    input         C0_SYS_CLK_0_clk_p    ,

    input [0:0]   diff_clock_rtl_0_clk_n,
    input [0:0]   diff_clock_rtl_0_clk_p,
    input [3:0]   pcie_7x_mgt_rtl_0_rxn ,
    input [3:0]   pcie_7x_mgt_rtl_0_rxp ,
    output [3:0]  pcie_7x_mgt_rtl_0_txn ,
    output [3:0]  pcie_7x_mgt_rtl_0_txp ,
    input         reset_rtl_0           ,

    input         pl_clk                ,

    input         cam_pclk              ,  //cmos 数据像素时钟
    input         cam_vsync             ,  //cmos 场同步信�?
    input         cam_href              ,  //cmos 行同步信�?
    input   [7:0] cam_data              ,  //cmos 数据
    output        cam_rst_n             ,  //cmos 复位信号，低电平有效
    output        cam_pwdn              ,  //电源休眠模式选择 0：正常模�? 1：电源休眠模�?
    output        cam_scl               ,  //cmos SCCB_SCL�?
    inout         cam_sda                  //cmos SCCB_SDA�?    

);

localparam REG_BASE_ADDR = 32'h8000_0000;
localparam CAM_DATA_LEN  = 20'd172800   ; //1280*720/16

(*mark_debug = "true"*)reg [11:0] row_cnt;
(*mark_debug = "true"*)reg [11:0] col_cnt;
(*mark_debug = "true"*)reg [11:0] frame_cnt;

(*mark_debug = "true"*)wire                video_vsync ;  
(*mark_debug = "true"*)wire                video_hsync ;  
(*mark_debug = "true"*)wire                video_valid ;  
(*mark_debug = "true"*)wire       [23:0]   video_data  ;  

reg video_vsync_ff;
reg video_hsync_ff;

wire clk_50m;
wire clk_50m_rst_n;
wire video_clk;
wire video_rst;
wire video_rst_n;

wire [1:0]  xdma_ack  ;     
wire        cam_en    ;     
wire [31:0] cam_addr_1;   
wire [31:0] cam_addr_2; 
wire [1:0]  xdma_req  ;  
wire        xdma_clk  ;
wire [1:0]  xdma_irq  ;

wire         s_axi_awvalid           ;
wire         s_axi_awready           ;
wire [31:0]  s_axi_awaddr            ;

wire         s_axi_wvalid            ;
wire         s_axi_wready            ;
wire  [31:0] s_axi_wdata             ;
wire  [ 3:0] s_axi_wstrb             ;

wire         s_axi_bvalid            ;
wire         s_axi_bready            ;
wire  [ 1:0] s_axi_bresp             ;

wire         s_axi_arvalid           ;
wire         s_axi_arready           ;
wire  [31:0] s_axi_araddr            ;

wire         s_axi_rvalid            ;
wire         s_axi_rready            ;
wire  [31:0] s_axi_rdata             ;
wire  [ 1:0] s_axi_rresp             ;

wire [31:0]  cam_cmd_addr    ;    
wire [31:0]  cam_cmd_len     ;
wire         cam_cmd_ready   ;
wire         cam_cmd_valid   ;
wire [127:0] cam_s_data      ;
wire         cam_s_data_ready;
wire         cam_s_data_valid;

assign clk_50m_rst_n = locked;
assign video_rst = !locked;
assign video_rst_n = locked;

clk_wiz_0 clk_wiz_0_inst
(
    // Clock out ports
    .clk_out1(clk_50m ),     // output clk_out1
    .clk_out2(video_clk ),     // output clk_out1
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(pl_clk)
);      // input clk_in1

always @(posedge video_clk or negedge locked) begin
    if(!locked) begin
        video_vsync_ff <= 1'b0;
        video_hsync_ff <= 1'b0;
    end
    else begin
        video_vsync_ff <= video_vsync;
        video_hsync_ff <= video_hsync;
    end
end


always @(posedge video_clk or negedge locked) begin
    if(!locked) begin
        frame_cnt <= 12'd0;
    end
    else begin
        frame_cnt <= frame_cnt + ((~video_vsync_ff) & video_vsync); 
    end
end

always @(posedge video_clk or negedge locked) begin
    if(!locked) begin
        row_cnt <= 12'd0;
    end
    else begin
        if((~video_vsync_ff) & video_vsync)begin
            row_cnt <= 12'd0; 
        end
        else begin
            row_cnt <= row_cnt + ((~video_hsync_ff) & video_hsync);
        end
        
    end
end

always @(posedge video_clk or negedge locked) begin
    if(!locked) begin
        col_cnt <= 12'd0;
    end
    else begin
        if((~video_hsync_ff) & video_hsync)begin
            col_cnt <= 12'd1; 
        end
        else begin
            col_cnt <= col_cnt + video_valid;
        end
        
    end
end


ov5640 ov5640_inst(
    .video_clk          (video_clk    ),
    .clk_50m            (clk_50m      ),    // Clock
    .rst_n              (clk_50m_rst_n),  // Asynchronous reset active low

    .ov_rst_n           (ov_rst_n ),
    .cam_pclk           (cam_pclk ),  //cmos 数据像素时钟
    .cam_vsync          (cam_vsync),  //cmos 场同步信号
    .cam_href           (cam_href ),  //cmos 行同步信号
    .cam_data           (cam_data ),  //cmos 数据
    .cam_rst_n          (cam_rst_n),  //cmos 复位信号，低电平有效
    .cam_pwdn           (cam_pwdn ),  //电源休眠模式选择 0：正常模式 1：电源休眠模式
    .cam_scl            (cam_scl  ),  //cmos SCCB_SCL线
    .cam_sda            (cam_sda  ),  //cmos SCCB_SDA线     

    .video_vsync        (video_vsync),  //帧有效信号    
    .video_hsync        (video_hsync),  //行有效信号
    .video_valid        (video_valid),  //数据有效使能信号
    .video_data         (video_data )   //有效数据   
	
);

ov5640_ddr ov5640_ddr_inst(
    .axi_clk        (video_clk),
    .axi_rst        (video_rst), 

    .axi_cam_en     (cam_en    ),
    .cam_data_addr_1(cam_addr_1),
    .cam_data_addr_2(cam_addr_2),
    .cam_data_len   (CAM_DATA_LEN), //以16字节为单位

    .s_data         (video_data ),
    .s_data_valid   (video_valid),
    .s_hsync        (video_hsync),
    .s_vsync        (video_vsync),

    .axi_data       (cam_s_data      ),
    .axi_data_valid (cam_s_data_valid),
    .axi_data_last  (                ), 
    .axi_data_ready (cam_s_data_ready),

    .axi_cmd_addr   (cam_cmd_addr  ),
    .axi_cmd_len    (cam_cmd_len   ),
    .axi_cmd_valid  (cam_cmd_valid ),
    .axi_cmd_ready  (cam_cmd_ready ),

    .xdma_req       (xdma_req),
    .xdma_ack       (xdma_ack) 
);

reg_ctrl #(
    .BASE_ADDR  (REG_BASE_ADDR)
) reg_ctrl_inst (
    .clk                   (video_clk    ),
    .rst                   (video_rst    ),

    .s_axi_awvalid         (s_axi_awvalid),
    .s_axi_awready         (s_axi_awready),
    .s_axi_awaddr          (s_axi_awaddr ),

    .s_axi_wvalid          (s_axi_wvalid ),
    .s_axi_wready          (s_axi_wready ),
    .s_axi_wdata           (s_axi_wdata  ),
    .s_axi_wstrb           (s_axi_wstrb  ),

    .s_axi_bvalid          (s_axi_bvalid ),
    .s_axi_bready          (s_axi_bready ),
    .s_axi_bresp           (s_axi_bresp  ),

    .s_axi_arvalid         (s_axi_arvalid),
    .s_axi_arready         (s_axi_arready),
    .s_axi_araddr          (s_axi_araddr ),

    .s_axi_rvalid          (s_axi_rvalid ),
    .s_axi_rready          (s_axi_rready ),
    .s_axi_rdata           (s_axi_rdata  ),
    .s_axi_rresp           (s_axi_rresp  ),

    .xdma_ack              (xdma_ack     ),
    .cam_en                (cam_en       ),
    .cam_addr_1            (cam_addr_1   ), 
    .cam_addr_2            (cam_addr_2   )
);


design_1_wrapper design_1_wrapper_inst (
    .C0_DDR4_0_act_n           (C0_DDR4_0_act_n       ),
    .C0_DDR4_0_adr             (C0_DDR4_0_adr         ),
    .C0_DDR4_0_ba              (C0_DDR4_0_ba          ),
    .C0_DDR4_0_bg              (C0_DDR4_0_bg          ),
    .C0_DDR4_0_ck_c            (C0_DDR4_0_ck_c        ),
    .C0_DDR4_0_ck_t            (C0_DDR4_0_ck_t        ),
    .C0_DDR4_0_cke             (C0_DDR4_0_cke         ),
    .C0_DDR4_0_cs_n            (C0_DDR4_0_cs_n        ),
    .C0_DDR4_0_dm_n            (C0_DDR4_0_dm_n        ),
    .C0_DDR4_0_dq              (C0_DDR4_0_dq          ),
    .C0_DDR4_0_dqs_c           (C0_DDR4_0_dqs_c       ),
    .C0_DDR4_0_dqs_t           (C0_DDR4_0_dqs_t       ),
    .C0_DDR4_0_odt             (C0_DDR4_0_odt         ),
    .C0_DDR4_0_reset_n         (C0_DDR4_0_reset_n     ),
    .C0_SYS_CLK_0_clk_n        (C0_SYS_CLK_0_clk_n    ),
    .C0_SYS_CLK_0_clk_p        (C0_SYS_CLK_0_clk_p    ),
    .diff_clock_rtl_0_clk_n    (diff_clock_rtl_0_clk_n),
    .diff_clock_rtl_0_clk_p    (diff_clock_rtl_0_clk_p),
    .pcie_7x_mgt_rtl_0_rxn     (pcie_7x_mgt_rtl_0_rxn ),
    .pcie_7x_mgt_rtl_0_rxp     (pcie_7x_mgt_rtl_0_rxp ),
    .pcie_7x_mgt_rtl_0_txn     (pcie_7x_mgt_rtl_0_txn ),
    .pcie_7x_mgt_rtl_0_txp     (pcie_7x_mgt_rtl_0_txp ),
    .reset_rtl_0               (reset_rtl_0           ),
    .M00_AXI_0_araddr          (s_axi_araddr          ),
    .M00_AXI_0_arprot          (),
    .M00_AXI_0_arready         (s_axi_arready         ),
    .M00_AXI_0_arvalid         (s_axi_arvalid         ),
    .M00_AXI_0_awaddr          (s_axi_awaddr          ),
    .M00_AXI_0_awprot          (),
    .M00_AXI_0_awready         (s_axi_awready         ),
    .M00_AXI_0_awvalid         (s_axi_awvalid         ),
    .M00_AXI_0_bready          (s_axi_bready          ),
    .M00_AXI_0_bresp           (s_axi_bresp           ),
    .M00_AXI_0_bvalid          (s_axi_bvalid          ),
    .M00_AXI_0_rdata           (s_axi_rdata           ),
    .M00_AXI_0_rready          (s_axi_rready          ),
    .M00_AXI_0_rresp           (s_axi_rresp           ),
    .M00_AXI_0_rvalid          (s_axi_rvalid          ),
    .M00_AXI_0_wdata           (s_axi_wdata           ),
    .M00_AXI_0_wready          (s_axi_wready          ),
    .M00_AXI_0_wstrb           (s_axi_wstrb           ),
    .M00_AXI_0_wvalid          (s_axi_wvalid          ),


    .axi_clk                   (video_clk   ),
    .axi_rst                   (video_rst   ),
    .axi_rst_n                 (video_rst_n ),
    .cam_cmd_addr              (cam_cmd_addr),
    .cam_cmd_id                (4'd0),
    .cam_cmd_len               (cam_cmd_len  ),
    .cam_cmd_ready             (cam_cmd_ready),
    .cam_cmd_valid             (cam_cmd_valid),
    .cam_s_data                (cam_s_data),
    .cam_s_data_keep           (16'hffff),
    .cam_s_data_last           (),
    .cam_s_data_ready          (cam_s_data_ready),
    .cam_s_data_valid          (cam_s_data_valid),
    .xdma_clk                  (xdma_clk),
    .xdma_irq                  (xdma_irq)
);

xpm_cdc_single #(
    .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
    .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
    .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
    .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
)
xpm_cdc_single_inst_0 (
  .dest_out(xdma_irq[0]), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                       // registered.
  .dest_clk(xdma_clk), // 1-bit input: Clock signal for the destination clock domain.
  .src_clk(video_clk),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
  .src_in(xdma_req[0])      // 1-bit input: Input signal to be synchronized to dest_clk domain.
);

xpm_cdc_single #(
    .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
    .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
    .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
    .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
)
xpm_cdc_single_inst_1 (
  .dest_out(xdma_irq[1]), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                       // registered.
  .dest_clk(xdma_clk), // 1-bit input: Clock signal for the destination clock domain.
  .src_clk(video_clk),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
  .src_in(xdma_req[1])      // 1-bit input: Input signal to be synchronized to dest_clk domain.
);

endmodule
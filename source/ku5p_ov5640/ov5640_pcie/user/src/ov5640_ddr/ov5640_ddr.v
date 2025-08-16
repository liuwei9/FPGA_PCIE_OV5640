module ov5640_ddr (
    input          axi_clk        ,
    input          axi_rst        , 

    input          axi_cam_en     ,
    input  [31:0]  cam_data_addr_1,
    input  [31:0]  cam_data_addr_2,
    input  [19:0]  cam_data_len   , //以16字节为单位

    (*mark_debug = "true"*)input  [23:0]  s_data         ,
    (*mark_debug = "true"*)input          s_data_valid   ,
    (*mark_debug = "true"*)input          s_hsync        ,
    (*mark_debug = "true"*)input          s_vsync        ,

    (*mark_debug = "true"*)output [127:0] axi_data       ,
    (*mark_debug = "true"*)output         axi_data_valid ,
    (*mark_debug = "true"*)output         axi_data_last  , 
    (*mark_debug = "true"*)input          axi_data_ready ,

    (*mark_debug = "true"*)output [31:0]  axi_cmd_addr   ,
    (*mark_debug = "true"*)output [31:0]  axi_cmd_len    ,
    (*mark_debug = "true"*)output         axi_cmd_valid  ,
    (*mark_debug = "true"*)input          axi_cmd_ready  ,

    (*mark_debug = "true"*)output [1:0]   xdma_req       ,
    (*mark_debug = "true"*)input  [1:0]   xdma_ack        
);

wire [23:0]  m_data      ;
wire         m_data_valid;
wire         m_hsync     ;
wire         m_vsync     ;

ov5640_ddr_w_en ov5640_ddr_w_en_inst(
    .axi_clk       (axi_clk        ),
    .axi_rst       (axi_rst        ),

    .axi_cam_en    (axi_cam_en & (~(&xdma_req))),

    .s_data        (s_data         ),
    .s_data_valid  (s_data_valid   ),
    .s_hsync       (s_hsync        ),
    .s_vsync       (s_vsync        ),

    .m_data        (m_data         ),
    .m_data_valid  (m_data_valid   ),
    .m_hsync       (m_hsync        ),
    .m_vsync       (m_vsync        )
);

ov5640_ddr_w ov5640_ddr_w_inst(
    .axi_clk        (axi_clk        ),
    .axi_rst        (axi_rst        ),

    .data_len       (cam_data_len   ), //以16字节为单位

    .s_data         (m_data         ),
    .s_data_valid   (m_data_valid   ),
    .s_hsync        (m_hsync        ),
    .s_vsync        (m_vsync        ),

    .axi_data       (axi_data       ),
    .axi_data_valid (axi_data_valid ),
    .axi_data_last  (axi_data_last  ), 
    .axi_data_ready (axi_data_ready )
);

ov5640_ddr_w_ctrl ov5640_ddr_w_ctrl_inst(
    .axi_clk        (axi_clk        ),
    .axi_rst        (axi_rst        ),

    .cam_data_addr_1(cam_data_addr_1),
    .cam_data_addr_2(cam_data_addr_2),
    .cam_data_len   (cam_data_len   ), //以16字节为单位
    
    .s_vsync        (m_vsync        ),

    .axi_data_valid (axi_data_valid ),
    .axi_data_last  (axi_data_last  ), 
    .axi_data_ready (axi_data_ready ),

    .axi_cmd_addr   (axi_cmd_addr   ),
    .axi_cmd_len    (axi_cmd_len    ),
    .axi_cmd_valid  (axi_cmd_valid  ),
    .axi_cmd_ready  (axi_cmd_ready  ),

    .xdma_req       (xdma_req       ),
    .xdma_ack       (xdma_ack       )
);


    
endmodule
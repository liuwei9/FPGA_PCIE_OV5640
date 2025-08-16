module ov5640 (
    input              video_clk          ,
	input              clk_50m            ,    // Clock
	input              rst_n              ,  // Asynchronous reset active low

    output             ov_rst_n           ,

	input              cam_pclk           ,  //cmos 数据像素时钟
    input              cam_vsync          ,  //cmos 场同步信号
    input              cam_href           ,  //cmos 行同步信号
    input   [7:0]      cam_data           ,  //cmos 数据
    output             cam_rst_n          ,  //cmos 复位信号，低电平有效
    output             cam_pwdn           ,  //电源休眠模式选择 0：正常模式 1：电源休眠模式
    output             cam_scl            ,  //cmos SCCB_SCL线
    inout              cam_sda            ,  //cmos SCCB_SDA线     

    output             video_vsync        ,  //帧有效信号    
    output             video_hsync        ,  //行有效信号
    output             video_valid        ,  //数据有效使能信号
    output   [23:0]    video_data            //有效数据   
	
);
//parameter define

// parameter  H_CMOS_DISP = 11'd640;                  //CMOS分辨率--行
// parameter  V_CMOS_DISP = 11'd480;                  //CMOS分辨率--列	
// parameter  TOTAL_H_PIXEL = H_CMOS_DISP + 12'd1216; //水平总像素大小
// parameter  TOTAL_V_PIXEL = V_CMOS_DISP + 12'd504;  //垂直总像素大小
parameter  H_CMOS_DISP = 11'd1280;                  //CMOS分辨率--行
parameter  V_CMOS_DISP = 11'd720;                  //CMOS分辨率--列	
parameter  TOTAL_H_PIXEL = 12'd2570; //水平总像素大小
parameter  TOTAL_V_PIXEL = 12'd980;  //垂直总像素大小


parameter SLAVE_ADDR = 7'h3c          ; //OV5640的器件地址7'h3c
parameter BIT_CTRL   = 1'b1           ; //OV5640的字节地址为16位  0:8位 1:16位
parameter CLK_FREQ   = 27'd50_000_000 ; //i2c_dri模块的驱动时钟频率 
parameter I2C_FREQ   = 20'd250_000    ; //I2C的SCL时钟频率,不超过400KHz


wire            rst_n           ; 
wire            i2c_dri_clk     ;   //I2C操作时钟
wire            i2c_done        ;   //I2C读写完成信号
wire   [7:0]    i2c_data_r      ;   //I2C读到的数据
wire            i2c_exec        ;   //I2C触发信号
wire   [23:0]   i2c_data        ;   //I2C写地址+数据
wire            i2c_rh_wl       ;   //I2C读写控制信号
wire            cam_init_done   ;   //摄像头出初始化完成信号 

wire        cmos_frame_vsync;
wire        cmos_frame_href ;
wire        cmos_frame_valid;
wire [15:0] cmos_frame_data ;
wire [23:0] cmos_frame_datas;

assign  cam_pwdn  = 1'b0;
assign  cam_rst_n = 1'b1;

i2c_ov5640_rgb565_cfg u_i2c_cfg(
    .clk           (i2c_dri_clk),
    .rst_n         (rst_n),
    .i2c_done      (i2c_done),
    .i2c_data_r    (i2c_data_r),
    .cmos_h_pixel  (H_CMOS_DISP),
    .cmos_v_pixel  (V_CMOS_DISP),
    .total_h_pixel (TOTAL_H_PIXEL),
    .total_v_pixel (TOTAL_V_PIXEL),    
    .i2c_exec      (i2c_exec),
    .i2c_data      (i2c_data),
    .i2c_rh_wl     (i2c_rh_wl),
    .init_done     (cam_init_done)
    );   

 i2c_dri 
   #(
    .SLAVE_ADDR  (SLAVE_ADDR),               //参数传递
    .CLK_FREQ    (CLK_FREQ  ),              
    .I2C_FREQ    (I2C_FREQ  )                
    ) 
   u_i2c_dri(
    .clk         (clk_50m   ),   
    .rst_n       (rst_n     ),   
    //i2c interface
    .i2c_exec    (i2c_exec  ),   
    .bit_ctrl    (BIT_CTRL  ),   
    .i2c_rh_wl   (i2c_rh_wl ),   
    .i2c_addr    (i2c_data[23:8]),   
    .i2c_data_w  (i2c_data[7:0]),   
    .i2c_data_r  (i2c_data_r),   
    .i2c_done    (i2c_done  ),  
    .i2c_ack     (), 
    .scl         (cam_scl   ),   
    .sda         (cam_sda   ),   
    //user interface
    .dri_clk     (i2c_dri_clk)               //I2C操作时钟
);
assign ov_rst_n = rst_n & cam_init_done;
//摄像头数据采集模块
cmos_capture_data u_cmos_capture_data(

    .rst_n              (rst_n & cam_init_done),
    .cam_pclk           (cam_pclk),   
    .cam_vsync          (cam_vsync),
    .cam_href           (cam_href),
    .cam_data           (cam_data),           
    .cmos_frame_vsync   (cmos_frame_vsync),
    .cmos_frame_href    (cmos_frame_href ),
    .cmos_frame_valid   (cmos_frame_valid),     
    .cmos_frame_data    (cmos_frame_data )             
    );

assign cmos_frame_datas = {cmos_frame_data[15:11], 3'd0, cmos_frame_data[10:5], 2'd0, cmos_frame_data[4:0], 3'd0};

ov5640_cdc ov5640_cdc_inst(
    .cam_clk        (cam_pclk),
    .cam_rst        (rst_n & cam_init_done),

    .video_clk      (video_clk  ),

    .s_data         (cmos_frame_datas),
    .s_valid        (cmos_frame_valid),
    .s_hsync        (cmos_frame_href ),
    .s_vsync        (cmos_frame_vsync),

    .video_data     (video_data ),
    .video_valid    (video_valid),
    .video_hsync    (video_hsync),
    .video_vsync    (video_vsync)
);

endmodule 
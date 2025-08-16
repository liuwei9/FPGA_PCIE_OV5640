module reg_ctrl #(
    parameter BASE_ADDR  = 32'h8000_0000
) (
    input             clk                   ,
    input             rst                   ,

    (*mark_debug = "true"*)input             s_axi_awvalid         ,
    (*mark_debug = "true"*)output            s_axi_awready         ,
    (*mark_debug = "true"*)input  [31:0]     s_axi_awaddr          ,

    (*mark_debug = "true"*)input             s_axi_wvalid          ,
    (*mark_debug = "true"*)output            s_axi_wready          ,
    (*mark_debug = "true"*)input  [31:0]     s_axi_wdata           ,
    (*mark_debug = "true"*)input  [ 3:0]     s_axi_wstrb           ,

    output            s_axi_bvalid          ,
    input             s_axi_bready          ,
    output [ 1:0]     s_axi_bresp           ,

    input             s_axi_arvalid         ,
    output            s_axi_arready         ,
    input  [31:0]     s_axi_araddr          ,

    output            s_axi_rvalid          ,
    input             s_axi_rready          ,
    output [31:0]     s_axi_rdata           ,
    output [ 1:0]     s_axi_rresp           ,

    (*mark_debug = "true"*)output reg [1:0]  xdma_ack              ,
    (*mark_debug = "true"*)output reg        cam_en                ,
    (*mark_debug = "true"*)output reg [31:0] cam_addr_1            ,
    output reg [31:0] cam_addr_2                
);

localparam REG_ACK       = BASE_ADDR + 32'h0;
localparam REG_CAM_EN    = BASE_ADDR + 32'h4;
localparam REG_CAM_ADDR_1= BASE_ADDR + 32'h8;
localparam REG_CAM_ADDR_2= BASE_ADDR + 32'hc;

reg bvalid        ;
reg data_out      ;
reg data_out_valid;

reg rvalid;
reg rdata ;

always @(posedge clk ) begin
    if((s_axi_awvalid & s_axi_awready) && (s_axi_wvalid & s_axi_wready) && (s_axi_awaddr == REG_ACK))begin
        xdma_ack <= s_axi_wdata[1:0];
    end
    else begin
        xdma_ack <= 2'b0;
    end
end

always @(posedge clk ) begin
    if((s_axi_awvalid & s_axi_awready) && (s_axi_wvalid & s_axi_wready) && (s_axi_awaddr == REG_CAM_EN))begin
        cam_en <= s_axi_wdata[0];
    end
end

always @(posedge clk ) begin
    if((s_axi_awvalid & s_axi_awready) && (s_axi_wvalid & s_axi_wready) && (s_axi_awaddr == REG_CAM_ADDR_1))begin
        cam_addr_1 <= s_axi_wdata;
    end
end

always @(posedge clk ) begin
    if((s_axi_awvalid & s_axi_awready) && (s_axi_wvalid & s_axi_wready) && (s_axi_awaddr == REG_CAM_ADDR_2))begin
        cam_addr_2 <= s_axi_wdata;
    end
end

//因为就一个读寄存器，所以这里就没有判断读地址
reg r_state;
always @(posedge clk ) begin
    if(rst)begin
        r_state <= 1'b0;
    end
    else begin
        if(s_axi_arvalid & s_axi_arready)begin
            r_state <= 1'b1;
        end
        else begin
            if(s_axi_rvalid & s_axi_rready)begin
                r_state <= 1'b0;
            end
        end
    end
end
always @(posedge clk ) begin
    if(rst)begin
        data_out_valid <= 1'b0;
    end
    else begin
        if(s_axi_arvalid & s_axi_arready)begin
            data_out_valid <= 1'b1;
        end
        else begin
            data_out_valid <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst)begin
        rvalid <= 1'b0;
        rdata  <= 1'd0;
    end
    else begin
        rdata  <= 1'b0;
        if(data_out_valid)begin
            rvalid <= 1'b1;
        end
        else begin
            if(s_axi_rvalid & s_axi_rready)begin
                rvalid <= 1'b0;
            end
        end
    end
end

always @(posedge clk ) begin
    if(rst)begin
        bvalid <= 1'b0;
    end
    else begin
        if((s_axi_awvalid & s_axi_awready) && (s_axi_wvalid & s_axi_wready))begin
            bvalid <= 1'b1;
        end
        else begin
            if(bvalid & s_axi_bready)begin
                bvalid <= 1'b0;
            end
        end
    end
end

assign s_axi_awready = s_axi_awvalid & s_axi_wvalid;
assign s_axi_wready  = s_axi_awvalid & s_axi_wvalid;

assign s_axi_arready = s_axi_arvalid & (r_state == 1'b0);
assign s_axi_rvalid  = rvalid        ;
assign s_axi_rdata   = rdata         ;
assign s_axi_rresp   = 2'b00         ;

assign s_axi_bvalid = bvalid;
assign s_axi_bresp  = 2'b00 ;


endmodule
module ov5640_ddr_w_ctrl (
    input          axi_clk        ,
    input          axi_rst        ,

    input  [31:0]  cam_data_addr_1,
    input  [31:0]  cam_data_addr_2,
    input  [19:0]  cam_data_len   , //以16字节为单位
    
    input          s_vsync        ,

    input          axi_data_valid ,
    input          axi_data_last  , 
    input          axi_data_ready ,

    output [31:0]  axi_cmd_addr   ,
    output [31:0]  axi_cmd_len    ,
    output reg     axi_cmd_valid  ,
    input          axi_cmd_ready  ,

    output [1:0]   xdma_req       ,
    input  [1:0]   xdma_ack       
);

localparam IDLE = 3'b001;
localparam ADDR = 3'b010;
localparam DATA = 3'b100;

(*mark_debug = "true"*)reg [2:0] curr_state;
reg [2:0] next_state;

(*mark_debug = "true"*)reg [1:0] axi_vsync_ff;
(*mark_debug = "true"*)reg axi_vsync_rise;

(*mark_debug = "true"*)reg [1:0] s_xdma_req;
reg w_ping;
reg [31:0] cmd_addr;

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        curr_state <= IDLE;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        IDLE: begin
            if(axi_vsync_rise)begin
                next_state = ADDR;
            end
            else begin
                next_state = IDLE;
            end
        end 
        ADDR: begin
            if(axi_cmd_ready & axi_cmd_valid)begin
                next_state = DATA;
            end
            else begin
                next_state = ADDR;
            end
        end
        DATA: begin
            if(axi_data_valid & axi_data_ready & axi_data_last)begin
                next_state = IDLE;
            end
            else begin
                next_state = DATA;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end
    

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        axi_vsync_ff <= 2'b0;
    end
    else begin
        axi_vsync_ff <= {axi_vsync_ff[0], s_vsync};
    end
end

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        axi_vsync_rise <= 1'b0;
    end
    else begin
        axi_vsync_rise <= axi_vsync_ff[0] & (~axi_vsync_ff[1]);
    end
end

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        w_ping <= 1'b0;
    end
    else begin
        if(axi_data_valid & axi_data_ready & axi_data_last)begin
            w_ping <= ~w_ping;
        end
    end
end

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        s_xdma_req <= 2'b0;
    end
    else begin
        if(axi_data_valid & axi_data_ready & axi_data_last)begin
            if(w_ping)begin
                s_xdma_req[1] <= 1'b1;
            end
            else begin
                s_xdma_req[0] <= 1'b1;
            end
        end
        else begin
            if(xdma_ack[0]) begin
                s_xdma_req[0] <= 1'b0;
            end
            if(xdma_ack[1]) begin
                s_xdma_req[1] <= 1'b0;
            end
        end
    end
end

assign xdma_req = s_xdma_req;

always @(posedge axi_clk ) begin
    if(w_ping)begin
        cmd_addr <= cam_data_addr_2; 
    end
    else begin
        cmd_addr <= cam_data_addr_1; 
    end
end

assign axi_cmd_addr = cmd_addr;
assign axi_cmd_len  = {8'd0, cam_data_len, 4'b0};

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        axi_cmd_valid <= 1'b0;
    end
    else begin
        if((curr_state == IDLE) && (axi_vsync_rise))begin
            axi_cmd_valid <= 1'b1;
        end
        else if(axi_cmd_valid & axi_cmd_ready)begin
            axi_cmd_valid <= 1'b0;
        end
    end
end



endmodule
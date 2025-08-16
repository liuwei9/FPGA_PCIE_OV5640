module ov5640_ddr_w (
    input          axi_clk        ,
    input          axi_rst        ,

    input  [19:0]  data_len       , //以16字节为单位

    (*mark_debug = "true"*)input  [23:0]  s_data       ,
    (*mark_debug = "true"*)input          s_data_valid ,
    (*mark_debug = "true"*)input          s_vsync      ,
    (*mark_debug = "true"*)input          s_hsync      ,

    (*mark_debug = "true"*)output [127:0] axi_data       ,
    (*mark_debug = "true"*)output         axi_data_valid ,
    (*mark_debug = "true"*)output         axi_data_last  , 
    (*mark_debug = "true"*)input          axi_data_ready   
);

(*mark_debug = "true"*)reg [1:0] cnt;

(*mark_debug = "true"*)reg [23:0] cam_data_temp;

(*mark_debug = "true"*)reg  [31:0]  din  ;
(*mark_debug = "true"*)reg          wr_en;
(*mark_debug = "true"*)wire         rd_en;
(*mark_debug = "true"*)wire [127:0] dout ;
(*mark_debug = "true"*)wire         empty;
(*mark_debug = "true"*)wire         full ;

(*mark_debug = "true"*)reg [19:0] axi_num;
(*mark_debug = "true"*)reg [19:0] axi_cnt;

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        cnt <= 2'd0;
    end
    else begin
        if(s_data_valid)begin
            cnt <= cnt + 2'd1;
        end
    end
end

always @(posedge axi_clk ) begin
    if(s_data_valid)begin
        case (cnt)
            2'b00:begin
                cam_data_temp <= s_data;
            end
            2'b01:begin
                cam_data_temp <= {8'd0, s_data[23:8]};
            end
            2'b10:begin
                cam_data_temp <= {16'd0, s_data[23:16]};
            end
            2'b11:begin
                cam_data_temp <= 24'd0;
            end
        endcase
    end
end

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        wr_en <= 1'b0;
    end
    else begin
        if(s_data_valid & (cnt != 2'b00))begin
            wr_en <= 1'b1;
        end
        else begin
            wr_en <= 1'b0;
        end
    end
end

always @(posedge axi_clk ) begin
    if(s_data_valid)begin
        case (cnt)
            2'b01:begin
                din <= {s_data[7:0], cam_data_temp[23:0]};
            end
            2'b10:begin
                din <= {s_data[15:0], cam_data_temp[15:0]};
            end
            2'b11:begin
                din <= {s_data, cam_data_temp[7:0]};
            end
        endcase
    end
end

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        axi_num <= 20'd0;
    end
    else begin
        axi_num <= data_len - 20'd1;
    end
end

always @(posedge axi_clk ) begin
    if(axi_rst)begin
        axi_cnt <= 20'd0;
    end
    else begin
        if(s_vsync)begin
            axi_cnt <= 20'd0;
        end
        else if(axi_data_valid & axi_data_ready)begin
            if(axi_data_last)begin
                axi_cnt <= 20'd0;
            end
            else begin
                axi_cnt <= axi_cnt + 20'd1;
            end
        end
    end
end

assign axi_data = dout;
assign axi_data_valid = (!empty) && (!rd_rst_busy);
assign rd_en = axi_data_valid & axi_data_ready;
assign axi_data_last = axi_cnt == axi_num;

xpm_fifo_sync #(
      .DOUT_RESET_VALUE("0"),    // String
      .ECC_MODE("no_ecc"),       // String
      .FIFO_MEMORY_TYPE("auto"), // String
      .FIFO_READ_LATENCY(1),     // DECIMAL
      .FIFO_WRITE_DEPTH(4096),   // DECIMAL
      .FULL_RESET_VALUE(0),      // DECIMAL
      .PROG_EMPTY_THRESH(10),    // DECIMAL
      .PROG_FULL_THRESH(10),     // DECIMAL
      .RD_DATA_COUNT_WIDTH(1),   // DECIMAL
      .READ_DATA_WIDTH(128),      // DECIMAL
      .READ_MODE("fwft"),         // String
      .SIM_ASSERT_CHK(0),        // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
      .USE_ADV_FEATURES("0000"), // String
      .WAKEUP_TIME(0),           // DECIMAL
      .WRITE_DATA_WIDTH(32),     // DECIMAL
      .WR_DATA_COUNT_WIDTH(1)    // DECIMAL
   )
   xpm_fifo_sync_inst (
      .almost_empty(),   // 1-bit output: Almost Empty : When asserted, this signal indicates that
                                     // only one more read can be performed before the FIFO goes to empty.

      .almost_full(),     // 1-bit output: Almost Full: When asserted, this signal indicates that
                                     // only one more write can be performed before the FIFO is full.

      .data_valid(),       // 1-bit output: Read Data Valid: When asserted, this signal indicates
                                     // that valid data is available on the output bus (dout).

      .dbiterr(),             // 1-bit output: Double Bit Error: Indicates that the ECC decoder detected
                                     // a double-bit error and data in the FIFO core is corrupted.

      .dout(dout),                   // READ_DATA_WIDTH-bit output: Read Data: The output data bus is driven
                                     // when reading the FIFO.

      .empty(empty),                 // 1-bit output: Empty Flag: When asserted, this signal indicates that the
                                     // FIFO is empty. Read requests are ignored when the FIFO is empty,
                                     // initiating a read while empty is not destructive to the FIFO.

      .full(full),                   // 1-bit output: Full Flag: When asserted, this signal indicates that the
                                     // FIFO is full. Write requests are ignored when the FIFO is full,
                                     // initiating a write when the FIFO is full is not destructive to the
                                     // contents of the FIFO.

      .overflow(),           // 1-bit output: Overflow: This signal indicates that a write request
                                     // (wren) during the prior clock cycle was rejected, because the FIFO is
                                     // full. Overflowing the FIFO is not destructive to the contents of the
                                     // FIFO.

      .prog_empty(),       // 1-bit output: Programmable Empty: This signal is asserted when the
                                     // number of words in the FIFO is less than or equal to the programmable
                                     // empty threshold value. It is de-asserted when the number of words in
                                     // the FIFO exceeds the programmable empty threshold value.

      .prog_full(),         // 1-bit output: Programmable Full: This signal is asserted when the
                                     // number of words in the FIFO is greater than or equal to the
                                     // programmable full threshold value. It is de-asserted when the number of
                                     // words in the FIFO is less than the programmable full threshold value.

      .rd_data_count(), // RD_DATA_COUNT_WIDTH-bit output: Read Data Count: This bus indicates the
                                     // number of words read from the FIFO.

      .rd_rst_busy(rd_rst_busy),     // 1-bit output: Read Reset Busy: Active-High indicator that the FIFO read
                                     // domain is currently in a reset state.

      .sbiterr(),             // 1-bit output: Single Bit Error: Indicates that the ECC decoder detected
                                     // and fixed a single-bit error.

      .underflow(),         // 1-bit output: Underflow: Indicates that the read request (rd_en) during
                                     // the previous clock cycle was rejected because the FIFO is empty. Under
                                     // flowing the FIFO is not destructive to the FIFO.

      .wr_ack(),               // 1-bit output: Write Acknowledge: This signal indicates that a write
                                     // request (wr_en) during the prior clock cycle is succeeded.

      .wr_data_count(), // WR_DATA_COUNT_WIDTH-bit output: Write Data Count: This bus indicates
                                     // the number of words written into the FIFO.

      .wr_rst_busy(wr_rst_busy),     // 1-bit output: Write Reset Busy: Active-High indicator that the FIFO
                                     // write domain is currently in a reset state.

      .din(din),                     // WRITE_DATA_WIDTH-bit input: Write Data: The input data bus used when
                                     // writing the FIFO.

      .injectdbiterr(1'b0), // 1-bit input: Double Bit Error Injection: Injects a double bit error if
                                     // the ECC feature is used on block RAMs or UltraRAM macros.

      .injectsbiterr(1'b0), // 1-bit input: Single Bit Error Injection: Injects a single bit error if
                                     // the ECC feature is used on block RAMs or UltraRAM macros.

      .rd_en(rd_en),                 // 1-bit input: Read Enable: If the FIFO is not empty, asserting this
                                     // signal causes data (on dout) to be read from the FIFO. Must be held
                                     // active-low when rd_rst_busy is active high.

      .rst(axi_rst),                     // 1-bit input: Reset: Must be synchronous to wr_clk. The clock(s) can be
                                     // unstable at the time of applying reset, but reset must be released only
                                     // after the clock(s) is/are stable.

      .sleep(1'b0),                 // 1-bit input: Dynamic power saving- If sleep is High, the memory/fifo
                                     // block is in power saving mode.

      .wr_clk(axi_clk),               // 1-bit input: Write clock: Used for write operation. wr_clk must be a
                                     // free running clock.

      .wr_en(wr_en)                  // 1-bit input: Write Enable: If the FIFO is not full, asserting this
                                     // signal causes data (on din) to be written to the FIFO Must be held
                                     // active-low when rst or wr_rst_busy or rd_rst_busy is active high

   );


    
endmodule
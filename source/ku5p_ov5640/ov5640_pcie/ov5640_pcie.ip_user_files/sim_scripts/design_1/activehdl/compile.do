vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/microblaze_v11_0_4
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/lmb_v10_v3_0_11
vlib activehdl/lmb_bram_if_cntlr_v4_0_19
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/iomodule_v3_1_6
vlib activehdl/gtwizard_ultrascale_v1_7_9
vlib activehdl/xdma_v4_1_8
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_22
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_data_fifo_v2_1_21
vlib activehdl/axi_crossbar_v2_1_23
vlib activehdl/util_vector_logic_v2_0_1
vlib activehdl/xlconstant_v1_1_7
vlib activehdl/axi_clock_converter_v2_1_21
vlib activehdl/axi_protocol_converter_v2_1_22
vlib activehdl/axi_dwidth_converter_v2_1_22
vlib activehdl/axi_mmu_v2_1_20

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap microblaze_v11_0_4 activehdl/microblaze_v11_0_4
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_11 activehdl/lmb_v10_v3_0_11
vmap lmb_bram_if_cntlr_v4_0_19 activehdl/lmb_bram_if_cntlr_v4_0_19
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap iomodule_v3_1_6 activehdl/iomodule_v3_1_6
vmap gtwizard_ultrascale_v1_7_9 activehdl/gtwizard_ultrascale_v1_7_9
vmap xdma_v4_1_8 activehdl/xdma_v4_1_8
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_22 activehdl/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 activehdl/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 activehdl/axi_crossbar_v2_1_23
vmap util_vector_logic_v2_0_1 activehdl/util_vector_logic_v2_0_1
vmap xlconstant_v1_1_7 activehdl/xlconstant_v1_1_7
vmap axi_clock_converter_v2_1_21 activehdl/axi_clock_converter_v2_1_21
vmap axi_protocol_converter_v2_1_22 activehdl/axi_protocol_converter_v2_1_22
vmap axi_dwidth_converter_v2_1_22 activehdl/axi_dwidth_converter_v2_1_22
vmap axi_mmu_v2_1_20 activehdl/axi_mmu_v2_1_20

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Xilinx_2020_2/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx_2020_2/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_4 -93 \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_0/sim/bd_45eb_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_1/sim/bd_45eb_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_11 -93 \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_2/sim/bd_45eb_ilmb_0.vhd" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_3/sim/bd_45eb_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_19 -93 \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_4/sim/bd_45eb_dlmb_cntlr_0.vhd" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_5/sim/bd_45eb_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_6/sim/bd_45eb_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_7/sim/bd_45eb_second_dlmb_cntlr_0.vhd" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_8/sim/bd_45eb_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_9/sim/bd_45eb_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_6 -93 \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/8c53/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/ip/ip_10/sim/bd_45eb_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/bd_0/sim/bd_45eb.v" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_0/sim/design_1_ddr4_0_0_microblaze_mcs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/phy/design_1_ddr4_0_0_phy_ddr4.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/ip_top/design_1_ddr4_0_0_phy.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_ar_channel.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_aw_channel.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_b_channel.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_fifo.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_r_channel.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_w_channel.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_a_upsizer.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_register_slice.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_upsizer.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_axic_register_slice.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_and.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_latch_and.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_latch_or.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_or.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_command_fifo.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_comparator.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_comparator_sel.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_comparator_sel_static.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_r_upsizer.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi/ddr4_v2_2_w_upsizer.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top/design_1_ddr4_0_0_ddr4.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top/design_1_ddr4_0_0_ddr4_mem_intfc.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal/design_1_ddr4_0_0_ddr4_cal_riu.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top/design_1_ddr4_0_0.sv" \
"../../../bd/design_1/ip/design_1_ddr4_0_0/tb/microblaze_mcs_0.sv" \

vlog -work gtwizard_ultrascale_v1_7_9  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_bit_sync.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_reset_sync.v" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_channel.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/sim/design_1_xdma_0_0_pcie4_ip_gt_gtye4_channel_wrapper.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_common.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/sim/design_1_xdma_0_0_pcie4_ip_gt_gtye4_common_wrapper.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/sim/design_1_xdma_0_0_pcie4_ip_gt_gtwizard_gtye4.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/sim/design_1_xdma_0_0_pcie4_ip_gt_gtwizard_top.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/sim/design_1_xdma_0_0_pcie4_ip_gt.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gtwizard_top.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_phy_ff_chain.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_phy_pipeline.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_16k_int.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_16k.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_32k.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_4k_int.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_msix.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_rep_int.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_rep.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram_tph.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_bram.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_gt_channel.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_gt_common.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_phy_clk.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_phy_rst.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_phy_rxeq.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_phy_txeq.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_sync_cell.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_sync.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_cdr_ctrl_on_eidle.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_receiver_detect_rxterm.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_gt_phy_wrapper.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_init_ctrl.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_pl_eq.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_vf_decode.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_pipe.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_phy_top.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_seqnum_fifo.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_sys_clk_gen_ps.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source/design_1_xdma_0_0_pcie4_ip_pcie4_uscale_core_top.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/sim/design_1_xdma_0_0_pcie4_ip.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_1/sim/xdma_v4_1_8_blk_mem_64_reg_be.v" \
"../../../bd/design_1/ip/design_1_xdma_0_0/ip_2/sim/xdma_v4_1_8_blk_mem_64_noreg_be.v" \

vlog -work xdma_v4_1_8  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/xdma_v4_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xdma_0_0/xdma_v4_1/hdl/verilog/design_1_xdma_0_0_dma_bram_wrap.sv" \
"../../../bd/design_1/ip/design_1_xdma_0_0/xdma_v4_1/hdl/verilog/design_1_xdma_0_0_dma_bram_wrap_1024.sv" \
"../../../bd/design_1/ip/design_1_xdma_0_0/xdma_v4_1/hdl/verilog/design_1_xdma_0_0_dma_bram_wrap_2048.sv" \
"../../../bd/design_1/ip/design_1_xdma_0_0/xdma_v4_1/hdl/verilog/design_1_xdma_0_0_core_top.sv" \
"../../../bd/design_1/ip/design_1_xdma_0_0/sim/design_1_xdma_0_0.sv" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_util_ds_buf_0/util_ds_buf.vhd" \
"../../../bd/design_1/ip/design_1_util_ds_buf_0/sim/design_1_util_ds_buf_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
"../../../bd/design_1/ip/design_1_axi_dma_write_0_0/sim/design_1_axi_dma_write_0_0.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/3f90/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_util_vector_logic_0_0/sim/design_1_util_vector_logic_0_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_0_1/sim/design_1_xlconstant_0_1.v" \
"../../../bd/design_1/ip/design_1_s00_data_fifo_0/sim/design_1_s00_data_fifo_0.v" \

vlog -work axi_clock_converter_v2_1_21  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/1304/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_cc_1/sim/design_1_auto_cc_1.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_22  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/2394/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_us_df_0/sim/design_1_auto_us_df_0.v" \
"../../../bd/design_1/ip/design_1_auto_cc_0/sim/design_1_auto_cc_0.v" \

vlog -work axi_mmu_v2_1_20  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/88c9/hdl/axi_mmu_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/cc3e/hdl/verilog" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/ip_top" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_0/rtl/cal" "+incdir+../../../../ov5640_pcie.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source" "+incdir+D:/Xilinx_2020_2/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_s00_mmu_0/sim/design_1_s00_mmu_0.v" \
"../../../bd/design_1/ip/design_1_s01_mmu_0/sim/design_1_s01_mmu_0.v" \
"../../../bd/design_1/ip/design_1_auto_cc_2/sim/design_1_auto_cc_2.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"


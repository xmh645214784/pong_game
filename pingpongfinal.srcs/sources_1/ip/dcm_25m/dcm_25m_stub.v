// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Wed Dec 31 10:40:54 2014
// Host        : LBB-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/LBB/Desktop/pingpongfinal/pingpongfinal.srcs/sources_1/ip/dcm_25m/dcm_25m_stub.v
// Design      : dcm_25m
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module dcm_25m(clk_in1, clk_out1, reset)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,reset" */;
  input clk_in1;
  output clk_out1;
  input reset;
endmodule

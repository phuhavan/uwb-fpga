//----------------------------------------------------------------------------
// System Generator version 12.3 Verilog source file.
//
// Copyright(C) 2010 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2010 Xilinx, Inc.  All rights
// reserved.
//----------------------------------------------------------------------------

(* core_generation_info = "hwcosim_top,hwcosim,{Board=kc705,Interface=jtag,HDLLanguage=verilog,Flow=sysgen,}" *)
module hwcosim_top
  (
    hwcosim_sys_clk_p,
    hwcosim_sys_clk_n
  );

  input hwcosim_sys_clk_p;
  input hwcosim_sys_clk_n;

  wire sys_clk_int;

  wire hwcosim_sys_clk_ibuf;

  wire hwcosim_clkgen_mmcm_clkfb;
  wire hwcosim_clkgen_mmcm_clkout0;
  wire hwcosim_clkgen_mmcm_clkout1;
  wire hwcosim_clkgen_mmcm_clkout2;
  wire hwcosim_clkgen_mmcm_clkout3;
  wire hwcosim_clkgen_mmcm_clkout4;
  wire hwcosim_clkgen_mmcm_clkout5;
  wire hwcosim_clkgen_mmcm_clkout6;
  wire hwcosim_clkgen_mmcm_clkout0_buf;
  wire hwcosim_clkgen_mmcm_clkout1_buf;
  wire hwcosim_clkgen_mmcm_clkout2_buf;
  wire hwcosim_clkgen_mmcm_clkout3_buf;
  wire hwcosim_clkgen_mmcm_clkout4_buf;
  wire hwcosim_clkgen_mmcm_clkout5_buf;
  wire hwcosim_clkgen_mmcm_clkout6_buf;
  wire hwcosim_clkgen_mmcm_locked;

  wire hwcosim_dut_src_clk;
  wire hwcosim_dut_fr_clk;
  wire hwcosim_dut_ss_clk;

  wire hwcosim_sstep_clk_int;
  wire hwcosim_cosim_clk_sel_int;
  wire hwcosim_we_int;
  wire hwcosim_re_int;
  wire [7:0] hwcosim_bank_sel_int;
  wire [23:0] hwcosim_addr_int;
  wire [31:0] hwcosim_data_in_int;
  wire [31:0] hwcosim_data_out_int;

  IBUFGDS ibufgds_hwcosim_sys_clk
    (
      .I (hwcosim_sys_clk_p),
      .IB (hwcosim_sys_clk_n),
      .O (hwcosim_sys_clk_ibuf)
    );

  MMCM_BASE #(
      .CLKIN1_PERIOD (5.0),
      .CLKFBOUT_MULT_F (5.0),
      .DIVCLK_DIVIDE (1),
      .CLKOUT0_DIVIDE_F (20.0),
      .BANDWIDTH ("OPTIMIZED")
    )
    hwcosim_clkgen_mmcm (
      .CLKFBIN (hwcosim_clkgen_mmcm_clkfb),
      .CLKIN1 (hwcosim_sys_clk_ibuf),
      .PWRDWN (1'b0),
      .RST (1'b0),
      .CLKFBOUT (hwcosim_clkgen_mmcm_clkfb),
      .CLKFBOUTB (),
      .CLKOUT0 (hwcosim_clkgen_mmcm_clkout0),
      .CLKOUT0B (),
      .CLKOUT1 (hwcosim_clkgen_mmcm_clkout1),
      .CLKOUT1B (),
      .CLKOUT2 (hwcosim_clkgen_mmcm_clkout2),
      .CLKOUT2B (),
      .CLKOUT3 (hwcosim_clkgen_mmcm_clkout3),
      .CLKOUT3B (),
      .CLKOUT4 (hwcosim_clkgen_mmcm_clkout4),
      .CLKOUT5 (hwcosim_clkgen_mmcm_clkout5),
      .CLKOUT6 (hwcosim_clkgen_mmcm_clkout6),
      .LOCKED (hwcosim_clkgen_mmcm_locked)
    );

  BUFGCE bufgce_hwcosim_clkgen_mmcm_clkout0
    (
      .I (hwcosim_clkgen_mmcm_clkout0),
      .CE (hwcosim_clkgen_mmcm_locked),
      .O (hwcosim_clkgen_mmcm_clkout0_buf)
    );



  BUFGMUX bufgmux_comp1
    (
      .I0 (hwcosim_dut_src_clk),
      .I1 (hwcosim_sstep_clk_int),
      .S (1'b0),
      .O (hwcosim_dut_fr_clk)
    );

  BUFGMUX bufgmux_comp2
    (
      .I0 (hwcosim_sstep_clk_int),
      .I1 (hwcosim_dut_src_clk),
      .S (hwcosim_cosim_clk_sel_int),
      .O (hwcosim_dut_ss_clk)
    );

  assign hwcosim_dut_src_clk = hwcosim_clkgen_mmcm_clkout0_buf;
  assign sys_clk_int = hwcosim_dut_fr_clk;

  hwcosim_interface hwcif
    (
      .hwcosim_sys_clk (hwcosim_sys_clk_ibuf),
      .hwcosim_dut_fr_clk (hwcosim_dut_fr_clk),
      .hwcosim_dut_ss_clk (hwcosim_dut_ss_clk),
      .hwcosim_mm_we (hwcosim_we_int),
      .hwcosim_mm_re (hwcosim_re_int),
      .hwcosim_mm_bank_sel (hwcosim_bank_sel_int),
      .hwcosim_mm_addr (hwcosim_addr_int),
      .hwcosim_mm_data_in (hwcosim_data_in_int),
      .hwcosim_mm_data_out (hwcosim_data_out_int)
    );

  (* box_type="user_black_box" *) jtagcosim_iface_virtex7 cosim_core_inst
    (
      .sys_clk (sys_clk_int),
      .addr (hwcosim_addr_int),
      .bank_sel (hwcosim_bank_sel_int),
      .cosim_clk_sel (hwcosim_cosim_clk_sel_int),
      .data_in (hwcosim_data_in_int),
      .data_out (hwcosim_data_out_int),
      .sstep_clk (hwcosim_sstep_clk_int),
      .we (hwcosim_we_int),
      .re (hwcosim_re_int)
    ) /* synthesis syn_noprune=1 syn_black_box=1 */;


endmodule
 
module jtagcosim_iface_virtex7
  (
    sys_clk,
    addr,
    bank_sel,
    cosim_clk_sel,
    data_in,
    data_out,
    sstep_clk,
    we,
    re
  );
  input sys_clk;
  output [23:0] addr;
  output [7:0] bank_sel;
  output cosim_clk_sel;
  output [31:0] data_in;
  input [31:0] data_out;
  output sstep_clk;
  output we;
  output re;
endmodule

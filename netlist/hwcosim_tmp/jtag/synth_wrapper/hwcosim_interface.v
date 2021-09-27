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

module hwcosim_shared_memory_lock_manager(clk, hw_req, hw_grant, sw_req, sw_grant);
  input clk;
  input hw_req;
  output reg hw_grant;
  output sw_req;
  input sw_grant;

  wire hw_req_int;
  reg hr_reg1;
  wire hr_reg1_en;
  reg hr_reg2;
  reg sw_req_int;

  assign sw_req = sw_req_int;
  assign hr_reg1_en = ~hr_reg2;

  // Increase # pulses for hw_req signal
  always @(posedge clk or negedge hw_req) begin
    if (!hw_req) begin
      hr_reg1 <= 1'b0;
    end else begin
      if (hr_reg1_en) begin
        hr_reg1 <= 1'b1;
      end
    end
  end

  always @(posedge clk) begin
    hr_reg2 <= hr_reg1;
  end

  assign hw_req_int = hw_req & hr_reg1;

  // Generate sw_req signal
  always @(posedge clk or negedge hw_req_int) begin
    if (!hw_req_int) begin
      sw_req_int <= 1'b0;
    end else begin
      if (!sw_grant) begin
        sw_req_int <= 1'b1;
      end
    end
  end

  // Generate hw_grant signal
  always @(posedge clk or negedge hw_req_int) begin
    if (!hw_req_int) begin
      hw_grant <= 1'b0;
    end else begin
      if (sw_req_int && sw_grant) begin
        hw_grant <= 1'b1;
      end
    end
  end

endmodule

//----------------------------------------------------------------------------

module hwcosim_shared_register(clk, ce, clr, i, o);
  parameter WIDTH = 32;
  parameter [WIDTH-1:0] INIT_VALUE = {WIDTH{1'b0}};

  input clk;
  input ce;
  input clr;
  input [WIDTH-1:0] i;
  output [WIDTH-1:0] o;

  genvar index;
  generate
    for (index = 0; index < WIDTH; index = index + 1)
    begin:fd_prim_array
      if (INIT_VALUE[index] == 0)
      begin:rst_comp
        FDRE fdre_comp
        (
          .C (clk),
          .D (i[index]),
          .Q (o[index]),
          .CE (ce),
          .R (clr)
        );
      end
      else
      begin:set_comp
        FDSE fdse_comp
        (
          .C (clk),
          .D (i[index]),
          .Q (o[index]),
          .CE (ce),
          .S (clr)
        );
      end
    end
  endgenerate
endmodule

//----------------------------------------------------------------------------

module hwcosim_memory_map
  (
    mm_o_ddph_i,
    mm_o_in_data,
    mm_o_in_rst,
    mm_o_in_start,
    mm_o_sfd_threshold,
    mm_o_sm_threshold,
    mm_i_coarse_error,
    mm_i_coarse_off,
    mm_i_data_out,
    mm_i_psdu_en,
    hwcosim_mm_clk,
    hwcosim_mm_we,
    hwcosim_mm_re,
    hwcosim_mm_bank_sel,
    hwcosim_mm_addr,
    hwcosim_mm_data_in,
    hwcosim_mm_data_out
  );

  output [2:0] mm_o_ddph_i;
  output [7:0] mm_o_in_data;
  output [0:0] mm_o_in_rst;
  output [0:0] mm_o_in_start;
  output [31:0] mm_o_sfd_threshold;
  output [15:0] mm_o_sm_threshold;
  input [0:0] mm_i_coarse_error;
  input [0:0] mm_i_coarse_off;
  input [0:0] mm_i_data_out;
  input [0:0] mm_i_psdu_en;
  input hwcosim_mm_clk;
  input hwcosim_mm_we;
  input hwcosim_mm_re;
  input [7:0] hwcosim_mm_bank_sel;
  input [23:0] hwcosim_mm_addr;
  input [31:0] hwcosim_mm_data_in;
  output reg [31:0] hwcosim_mm_data_out;

  reg [31:0] hwcosim_mm_data_out_bank0;

  reg [2:0] int_o_ddph_i;
  reg [7:0] int_o_in_data;
  reg [0:0] int_o_in_rst;
  reg [0:0] int_o_in_start;
  reg [31:0] int_o_sfd_threshold;
  reg [15:0] int_o_sm_threshold;
  wire [0:0] int_i_coarse_error;
  wire [0:0] int_i_coarse_off;
  wire [0:0] int_i_data_out;
  wire [0:0] int_i_psdu_en;

  always @(posedge hwcosim_mm_clk)
  begin
    if (hwcosim_mm_we && hwcosim_mm_bank_sel == 0) begin
      case (hwcosim_mm_addr)
        0 : int_o_ddph_i[2:0] <= hwcosim_mm_data_in[2:0];
        1 : int_o_in_data[7:0] <= hwcosim_mm_data_in[7:0];
        2 : int_o_in_rst[0:0] <= hwcosim_mm_data_in[0:0];
        3 : int_o_in_start[0:0] <= hwcosim_mm_data_in[0:0];
        4 : int_o_sfd_threshold[31:0] <= hwcosim_mm_data_in[31:0];
        5 : int_o_sm_threshold[15:0] <= hwcosim_mm_data_in[15:0];
        default : ;
      endcase
    end else begin
      case (hwcosim_mm_addr)
        0 : hwcosim_mm_data_out_bank0 <= int_i_coarse_error[0:0];
        1 : hwcosim_mm_data_out_bank0 <= int_i_coarse_off[0:0];
        2 : hwcosim_mm_data_out_bank0 <= int_i_data_out[0:0];
        3 : hwcosim_mm_data_out_bank0 <= int_i_psdu_en[0:0];
        default : ;
      endcase
    end
  end

  assign int_i_coarse_error = mm_i_coarse_error;
  assign int_i_coarse_off = mm_i_coarse_off;
  assign int_i_data_out = mm_i_data_out;
  assign int_i_psdu_en = mm_i_psdu_en;
  assign mm_o_ddph_i = int_o_ddph_i;
  assign mm_o_in_data = int_o_in_data;
  assign mm_o_in_rst = int_o_in_rst;
  assign mm_o_in_start = int_o_in_start;
  assign mm_o_sfd_threshold = int_o_sfd_threshold;
  assign mm_o_sm_threshold = int_o_sm_threshold;

  always @(hwcosim_mm_bank_sel,
           hwcosim_mm_data_out_bank0)
  begin
    case (hwcosim_mm_bank_sel)
      0 : hwcosim_mm_data_out <= hwcosim_mm_data_out_bank0;
      default : hwcosim_mm_data_out <= 0;
    endcase
  end

endmodule

//----------------------------------------------------------------------------

module hwcosim_interface
  (
    hwcosim_sys_clk,
    hwcosim_dut_fr_clk,
    hwcosim_dut_ss_clk, 
    hwcosim_mm_we,
    hwcosim_mm_re,
    hwcosim_mm_bank_sel,
    hwcosim_mm_addr,
    hwcosim_mm_data_in,
    hwcosim_mm_data_out
  );

  input hwcosim_sys_clk;
  input hwcosim_dut_fr_clk;
  input hwcosim_dut_ss_clk; 
  input hwcosim_mm_we;
  input hwcosim_mm_re;
  input [7:0] hwcosim_mm_bank_sel;
  input [23:0] hwcosim_mm_addr;
  input [31:0] hwcosim_mm_data_in;
  output [31:0] hwcosim_mm_data_out;
   
  wire [2:0] mm_o_ddph_i;
  wire [7:0] mm_o_in_data;
  wire [0:0] mm_o_in_rst;
  wire [0:0] mm_o_in_start;
  wire [31:0] mm_o_sfd_threshold;
  wire [15:0] mm_o_sm_threshold;
  wire [0:0] mm_i_coarse_error;
  wire [0:0] mm_i_coarse_off;
  wire [0:0] mm_i_data_out;
  wire [0:0] mm_i_psdu_en;
  wire dut_o_ce;
  wire dut_o_clk;
  wire [2:0] dut_o_ddph_i;
  wire [7:0] dut_o_in_data;
  wire [0:0] dut_o_in_rst;
  wire [0:0] dut_o_in_start;
  wire [31:0] dut_o_sfd_threshold;
  wire [15:0] dut_o_sm_threshold;
  wire [0:0] dut_i_coarse_error;
  wire [0:0] dut_i_coarse_off;
  wire [0:0] dut_i_data_out;
  wire [0:0] dut_i_psdu_en;

  hwcosim_memory_map hwcosim_memory_map_inst
    (
      .mm_o_ddph_i (mm_o_ddph_i),
      .mm_o_in_data (mm_o_in_data),
      .mm_o_in_rst (mm_o_in_rst),
      .mm_o_in_start (mm_o_in_start),
      .mm_o_sfd_threshold (mm_o_sfd_threshold),
      .mm_o_sm_threshold (mm_o_sm_threshold),
      .mm_i_coarse_error (mm_i_coarse_error),
      .mm_i_coarse_off (mm_i_coarse_off),
      .mm_i_data_out (mm_i_data_out),
      .mm_i_psdu_en (mm_i_psdu_en),
      .hwcosim_mm_clk (hwcosim_dut_fr_clk),
      .hwcosim_mm_we (hwcosim_mm_we),
      .hwcosim_mm_re (hwcosim_mm_re),
      .hwcosim_mm_bank_sel (hwcosim_mm_bank_sel),
      .hwcosim_mm_addr (hwcosim_mm_addr),
      .hwcosim_mm_data_in (hwcosim_mm_data_in),
      .hwcosim_mm_data_out (hwcosim_mm_data_out)
    );
    
  (* box_type="user_black_box" *)   
  subsystem2_cw hwcosim_dut_inst
    (
      .ce (dut_o_ce),
      .clk (hwcosim_dut_ss_clk) ,
      .coarse_error (dut_i_coarse_error),
      .coarse_off (dut_i_coarse_off),
      .data_out (dut_i_data_out),
      .ddph_i (dut_o_ddph_i),
      .in_data (dut_o_in_data),
      .in_rst (dut_o_in_rst),
      .in_start (dut_o_in_start),
      .psdu_en (dut_i_psdu_en),
      .sfd_threshold (dut_o_sfd_threshold),
      .sm_threshold (dut_o_sm_threshold)
    ) /* synthesis syn_black_box=1 */;

  assign dut_o_ce = 1;
  assign dut_o_ddph_i = mm_o_ddph_i;
  assign dut_o_in_data = mm_o_in_data;
  assign dut_o_in_rst = mm_o_in_rst;
  assign dut_o_in_start = mm_o_in_start;
  assign dut_o_sfd_threshold = mm_o_sfd_threshold;
  assign dut_o_sm_threshold = mm_o_sm_threshold;
  assign mm_i_coarse_error = dut_i_coarse_error;
  assign mm_i_coarse_off = dut_i_coarse_off;
  assign mm_i_data_out = dut_i_data_out;
  assign mm_i_psdu_en = dut_i_psdu_en;

endmodule

//----------------------------------------------------------------------------
module subsystem2_cw
  (
    ce,
    clk,
    coarse_error,
    coarse_off,
    data_out,
    ddph_i,
    in_data,
    in_rst,
    in_start,
    psdu_en,
    sfd_threshold,
    sm_threshold
  );
  input  ce;
  input  clk;
  output  [0:0] coarse_error;
  output  [0:0] coarse_off;
  output  [0:0] data_out;
  input  [2:0] ddph_i;
  input  [7:0] in_data;
  input  [0:0] in_rst;
  input  [0:0] in_start;
  output  [0:0] psdu_en;
  input  [31:0] sfd_threshold;
  input  [15:0] sm_threshold;
endmodule


//-----------------------------------------------------------------
// System Generator version 14.6 VERILOG source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
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
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// System Generator version 14.6 VERILOG source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
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
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------
// synopsys translate_off
`ifndef simulating
  `define simulating 1
`endif
// synopsys translate_on
`ifndef simulating
  `define simulating 0
`endif
`ifndef xlUnsigned
 `define xlUnsigned 1
`endif
`ifndef xlSigned
 `define xlSigned 2
`endif
`ifndef xlFloat
 `define xlFloat 3
`endif
`ifndef xlWrap
 `define xlWrap 1
`endif
`ifndef xlSaturate
 `define xlSaturate 2
`endif
`ifndef xlTruncate
 `define xlTruncate 1
`endif
`ifndef xlRound
 `define xlRound 2
`endif
`ifndef xlRoundBanker
 `define xlRoundBanker 3
`endif
`ifndef xlAddMode
 `define xlAddMode 1
`endif
`ifndef xlSubMode
 `define xlSubMode 2
`endif
`ifndef xlConvPkgIncluded
 `define xlConvPkgIncluded 1
`endif

//-----------------------------------------------------------------
// System Generator version 14.6 VERILOG source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
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
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------
`timescale 1 ns / 10 ps
module xlclockdriver (sysclk, sysclr, sysce, clk, clr, ce, ce_logic);
   parameter signed [31:0] log_2_period = 1;
   parameter signed [31:0] period  = 2;
   parameter signed [31:0] use_bufg  = 1'b0;
   parameter signed [31:0] pipeline_regs = 5;

   input sysclk;
   input sysclr;
   input sysce;
   output clk;
   output clr;
   output ce;
   output ce_logic;
   parameter signed [31:0] max_pipeline_regs = 8;
   parameter signed [31:0] num_pipeline_regs = (max_pipeline_regs > pipeline_regs)? pipeline_regs : max_pipeline_regs;
   parameter signed [31:0] factor = num_pipeline_regs/period;
   parameter signed [31:0] rem_pipeline_regs =  num_pipeline_regs - (period * factor) + 1;
   parameter [log_2_period-1:0] trunc_period = ~period + 1;
   parameter signed [31:0] period_floor = (period>2)? period : 2;
   parameter signed [31:0] power_of_2_counter = (trunc_period == period) ? 1 : 0;
   parameter signed [31:0] cnt_width = (power_of_2_counter & (log_2_period>1)) ? (log_2_period - 1) : log_2_period;
   parameter [cnt_width-1:0] clk_for_ce_pulse_minus1 = period_floor-2;
   parameter [cnt_width-1:0] clk_for_ce_pulse_minus2 = (period-3>0)? period-3 : 0;
   parameter [cnt_width-1:0] clk_for_ce_pulse_minus_regs = ((period-rem_pipeline_regs)>0)? (period-rem_pipeline_regs) : 0;
   reg [cnt_width-1:0] clk_num;
   reg temp_ce_vec;
   (* MAX_FANOUT="REDUCE" *)wire [num_pipeline_regs:0] ce_vec /* synthesis MAX_FANOUT="REDUCE" */ ;
   (* MAX_FANOUT="REDUCE" *)wire [num_pipeline_regs:0] ce_vec_logic /* synthesis MAX_FANOUT="REDUCE" */;
   wire internal_ce;
   wire internal_ce_logic;
   reg cnt_clr;
   wire cnt_clr_dly;
   genvar index;
initial
   begin
      clk_num = 'b0;
   end
   assign clk = sysclk ;
   assign clr = sysclr ;
   always @(posedge sysclk)
     begin : cntr_gen
       if (sysce == 1'b1)
         begin:hc
           if ((cnt_clr_dly == 1'b1) || (sysclr == 1'b1))
             begin:u1
               clk_num = {cnt_width{1'b0}};
             end
           else
             begin:u2
               clk_num = clk_num + 1 ;
             end
         end
     end
   generate
      if (power_of_2_counter == 1)
        begin:clr_gen_p2
           always @(sysclr)
             begin:u1
                cnt_clr = sysclr;
             end
       end
   endgenerate
   generate
      if (power_of_2_counter == 0)
        begin:clr_gen
           always @(clk_num or sysclr)
             begin:u1
                if ( (clk_num == clk_for_ce_pulse_minus1) | (sysclr == 1'b1) )
                  begin:u2
                     cnt_clr = 1'b1 ;
                  end
                else
                  begin:u3
                     cnt_clr = 1'b0 ;
                  end
             end
       end
   endgenerate
   synth_reg_w_init #(1, 0, 'b0000, 1)
     clr_reg(.i(cnt_clr),
             .ce(sysce),
             .clr(sysclr),
             .clk(sysclk),
             .o(cnt_clr_dly));

   generate
      if (period > 1)
        begin:pipelined_ce
           always @(clk_num)
             begin:np_ce_gen
                if (clk_num == clk_for_ce_pulse_minus_regs)
                  begin
                     temp_ce_vec = 1'b1 ;
                  end
                else
                  begin
                     temp_ce_vec = 1'b0 ;
                  end
             end

           for(index=0; index<num_pipeline_regs; index=index+1)
             begin:ce_pipeline
                synth_reg_w_init #(1, ((((index+1)%period)>0)?0:1), 1'b0, 1)
                  ce_reg(.i(ce_vec[index+1]),
                         .ce(sysce),
                         .clr(sysclr),
                         .clk(sysclk),
                   .o(ce_vec[index]));
             end
         for(index=0; index<num_pipeline_regs; index=index+1)
             begin:ce_pipeline_logic
                synth_reg_w_init #(1, ((((index+1)%period)>0)?0:1), 1'b0, 1)
                      ce_reg_logic(.i(ce_vec_logic[index+1]),
                         .ce(sysce),
                         .clr(sysclr),
                         .clk(sysclk),
                     .o(ce_vec_logic[index]));
              end
          assign ce_vec_logic[num_pipeline_regs] = temp_ce_vec;
          assign ce_vec[num_pipeline_regs] = temp_ce_vec;
          assign internal_ce = ce_vec[0];
          assign internal_ce_logic = ce_vec_logic[0];
      end
   endgenerate
   generate
      if (period > 1)
        begin:period_greater_than_1
         if (use_bufg == 1'b1)
            begin:use_bufg
             BUFG ce_bufg_inst(.I(internal_ce), .O(ce));
             BUFG ce_logic_bufg_inst(.I(internal_ce_logic), .O(ce_logic));
            end
         else
           begin:no_bufg
            assign ce = internal_ce;
            assign ce_logic = internal_ce_logic;
           end
        end
    endgenerate

    generate
     if (period == 1)
       begin:period_1
         assign ce = sysce;
         assign ce_logic = sysce;
       end
    endgenerate
endmodule
(* syn_noprune = "true" *)
(* optimize_primitives = "false" *)
(* dont_touch = "true" *)
module default_clock_driver_uwb_re_blackbox (
  ce_1,
  clk_1,
  sysclk,
  sysce,
  sysce_clr
);

  input  sysclk;
  input  sysce;
  input  sysce_clr;
  output  ce_1;
  output  clk_1;

  wire  sysce_clr_x0;
  wire  sysce_x0;
  wire  sysclk_x0;
  wire  xlclockdriver_1_ce;
  wire  xlclockdriver_1_clk;

  assign ce_1 = xlclockdriver_1_ce;
  assign clk_1 = xlclockdriver_1_clk;
  assign sysclk_x0 = sysclk;
  assign sysce_x0 = sysce;
  assign sysce_clr_x0 = sysce_clr;


  xlclockdriver #(

    .log_2_period(1),
    .period(1),
    .use_bufg(0))
  xlclockdriver_1 (
    .sysce(sysce_x0),
    .sysclk(sysclk_x0),
    .sysclr(sysce_clr_x0),
    .ce(xlclockdriver_1_ce),
    .clk(xlclockdriver_1_clk)
  );
endmodule
module subsystem2_cw (
  clk,// clock period = 20.0 ns (50.0 Mhz)
  ce,
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

  input  clk;// clock period = 20.0 ns (50.0 Mhz)
  input  ce;
  input [2:0] ddph_i;
  input [7:0] in_data;
  input [0:0] in_rst;
  input [0:0] in_start;
  input [31:0] sfd_threshold;
  input [15:0] sm_threshold;
  output [0:0] coarse_error;
  output [0:0] coarse_off;
  output [0:0] data_out;
  output [0:0] psdu_en;

(* MAX_FANOUT="REDUCE" *)  wire  ce_1_sg_x0/* synthesis MAX_FANOUT="REDUCE" */;
  wire  clkNet;
  wire  clk_1_sg_x0;
  wire [0:0] coarse_error_net;
  wire [0:0] coarse_off_net;
  wire [0:0] data_out_net;
  wire [2:0] ddph_i_net;
  wire [7:0] in_data_net;
  wire [0:0] in_rst_net;
  wire [0:0] in_start_net;
(* syn_keep="true" *)(* keep="true" *)(* preserve_signal="true" *)  wire  persistentdff_inst_q/* synthesis syn_keep=1 keep=1 preserve_signal=1 */;
  wire [0:0] psdu_en_net;
  wire [31:0] sfd_threshold_net;
  wire [15:0] sm_threshold_net;

  assign clkNet = clk;
  assign coarse_error = coarse_error_net;
  assign coarse_off = coarse_off_net;
  assign data_out = data_out_net;
  assign ddph_i_net = ddph_i;
  assign in_data_net = in_data;
  assign in_rst_net = in_rst;
  assign in_start_net = in_start;
  assign psdu_en = psdu_en_net;
  assign sfd_threshold_net = sfd_threshold;
  assign sm_threshold_net = sm_threshold;


  default_clock_driver_uwb_re_blackbox  default_clock_driver_uwb_re_blackbox_x0 (
    .sysce(1'b1),
    .sysce_clr(1'b0),
    .sysclk(clkNet),
    .ce_1(ce_1_sg_x0),
    .clk_1(clk_1_sg_x0)
  );

  subsystem2  subsystem2_x0 (
    .ce_1(ce_1_sg_x0),
    .clk_1(clk_1_sg_x0),
    .ddph_i(ddph_i_net),
    .in_data(in_data_net),
    .in_rst(in_rst_net),
    .in_start(in_start_net),
    .sfd_threshold(sfd_threshold_net),
    .sm_threshold(sm_threshold_net),
    .coarse_error(coarse_error_net),
    .coarse_off(coarse_off_net),
    .data_out(data_out_net),
    .psdu_en(psdu_en_net)
  );

  xlpersistentdff  persistentdff_inst (
    .clk(clkNet),
    .d(persistentdff_inst_q),
    .q(persistentdff_inst_q)
  );
endmodule

module xlpersistentdff (
  clk,
  d,
  q
);

  input  clk;
  input  d;
  output  q;

endmodule

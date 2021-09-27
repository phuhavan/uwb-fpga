
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
module srl17e (clk, ce, d, q);
    parameter width = 16;
    parameter latency = 8;
    input clk, ce;
    input [width-1:0] d;
    output [width-1:0] q;
    parameter signed [5:0] a = latency - 2;
    wire[width - 1:0] #0.2 d_delayed;
    wire[width - 1:0] srl16_out;
    genvar i;
    assign d_delayed = d ;
    generate
      for(i=0; i<width; i=i+1)
      begin:reg_array
            if (latency > 1)
                begin: has_2_latency
                 SRL16E u1 (.CLK(clk), .D(d_delayed[i]), .Q(srl16_out[i]), .CE(ce), .A0(a[0]), .A1(a[1]), .A2(a[2]), .A3(a[3]));
                end
            if (latency <= 1)
                begin: has_1_latency
                 assign srl16_out[i] = d_delayed[i];
                end
            if (latency != 0)
                begin: has_latency
                 FDE u2 (.C(clk), .D(srl16_out[i]), .Q(q[i]), .CE(ce));
                end
            if (latency == 0)
                begin:has_0_latency
                 assign q[i] = srl16_out[i];
                end
        end
    endgenerate
endmodule
module synth_reg (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter latency  = 1;
   input[width - 1:0] i;
   input ce,clr,clk;
   output[width - 1:0] o;
   parameter complete_num_srl17es = latency/17;
   parameter remaining_latency = latency%17;
   parameter temp_num_srl17es = (latency/17) + ((latency%17)?1:0);
   parameter num_srl17es = temp_num_srl17es ? temp_num_srl17es : 1;
   wire [width - 1:0] z [0:num_srl17es-1];
   genvar t;
    generate
      if (latency <= 17)
          begin:has_only_1
              srl17e #(width, latency) srl17e_array0(.clk(clk), .ce(ce), .d(i), .q(o));
          end
     endgenerate
    generate
     if (latency > 17)
        begin:has_1
             assign o = z[num_srl17es-1];
             srl17e #(width, 17) srl17e_array0(.clk(clk), .ce(ce), .d(i), .q(z[0]));
        end
   endgenerate
   generate
      if (latency > 17)
          begin:more_than_1
              for (t=1; t < complete_num_srl17es; t=t+1)
                begin:left_complete_ones
                   srl17e #(width, 17) srl17e_array(.clk(clk), .ce(ce), .d(z[t-1]), .q(z[t]));
                end
          end
   endgenerate
   generate
     if ((remaining_latency > 0) && (latency>17))
          begin:remaining_ones
             srl17e #(width, (latency%17)) last_srl17e (.clk(clk), .ce(ce), .d(z[num_srl17es-2]), .q(z[num_srl17es-1]));
          end
   endgenerate
endmodule
module synth_reg_reg (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter latency  = 1;
   input[width - 1:0] i;
   input ce, clr, clk;
   output[width - 1:0] o;
   wire[width - 1:0] o;
   genvar idx;
   reg[width - 1:0] reg_bank [latency:0];
   integer j;
   initial
     begin
        for (j=0; j < latency+1; j=j+1)
          begin
             reg_bank[j] = {width{1'b0}};
          end
     end

   generate
     if (latency == 0)
        begin:has_0_latency
         assign o = i;
       end
   endgenerate

   always @(i)
        begin
             reg_bank[0] = i;
         end
   generate
     if (latency > 0)
        begin:more_than_1
            assign o = reg_bank[latency];
         for (idx=0; idx < latency; idx=idx+1) begin:sync_loop
            always @(posedge clk)
                begin
                 if(clr)
                    begin
                      for (j=0; j < latency+1; j=j+1)
                        begin
                          reg_bank[j] = {width{1'b0}};
                       end
                    end
                 else if (ce)
                    begin
                        reg_bank[idx+1] <= reg_bank[idx] ;
                    end
               end
        end
      end
   endgenerate
endmodule

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
module synth_reg_w_init (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter init_index  = 0;
   parameter [width-1 : 0] init_value  = 'b0000;
   parameter latency  = 1;

   input[width - 1:0] i;
   input ce, clr, clk;
   output[width - 1:0] o;
   wire[(latency + 1) * width - 1:0] dly_i;
   wire #0.2 dly_clr;
   genvar index;

   generate
     if (latency == 0)
        begin:has_0_latency
         assign o = i;
        end
     else
        begin:has_latency
         assign dly_i[(latency + 1) * width - 1:latency * width] = i ;
         assign dly_clr = clr ;
         for (index=1; index<=latency; index=index+1)
           begin:fd_array
// synopsys translate_off
             defparam reg_comp_1.width = width;
             defparam reg_comp_1.init_index = init_index;
             defparam reg_comp_1.init_value = init_value;
// synopsys translate_on
             single_reg_w_init #(width, init_index, init_value)
               reg_comp_1(.clk(clk),
                          .i(dly_i[(index + 1)*width-1:index*width]),
                          .o(dly_i[index * width - 1:(index - 1) * width]),
                          .ce(ce),
                          .clr(dly_clr));
             end
        assign o = dly_i[width-1:0];
       end
   endgenerate
endmodule
module single_reg_w_init (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter init_index  = 0;
   parameter [width-1 : 0] init_value  = 8'b00000000;
   input[width - 1:0] i;
   input ce;
   input clr;
   input clk;
   output[width - 1:0] o;
   parameter [0:0] init_index_val = (init_index ==  1) ? 1'b1 : 1'b0;
   parameter [width-1:0] result = (width > 1) ? { {(width-1){1'b0}}, init_index_val } : init_index_val;
   parameter [width-1:0] init_const = (init_index > 1) ? init_value : result;
   wire[width - 1:0] o;
   genvar index;

   generate
     for (index=0;index < width; index=index+1) begin:fd_prim_array
          if (init_const[index] == 0)
            begin:rst_comp
              FDRE fdre_comp(.C(clk),
                             .D(i[index]),
                             .Q(o[index]),
                             .CE(ce),
                             .R(clr));
            end
          else
            begin:set_comp
             FDSE fdse_comp(.C(clk),
                            .D(i[index]),
                            .Q(o[index]),
                            .CE(ce),
                            .S(clr));
            end
    end
   endgenerate
endmodule

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
`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif
`ifndef xlConvertType
 `define xlConvertType
 `timescale 1 ns / 10 ps
module cast (inp, res);
    parameter signed [31:0] old_width = 4;
    parameter signed [31:0] old_bin_pt = 1;
    parameter signed [31:0] new_width = 4;
    parameter signed [31:0] new_bin_pt = 1;
    parameter signed [31:0] new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0] right_of_dp = new_bin_pt - old_bin_pt;
    wire [new_width-1:0] result;
   genvar i;
   assign res = result;
   generate
      for (i = 0; i<new_width;  i = i+1)
        begin:cast_loop
           if ((i-right_of_dp) > old_width - 1)
             begin:u0
                if (new_arith == `xlUnsigned)
                  begin:u1
                     assign result[i] = 1'b0;
                  end
                if (new_arith == `xlSigned)
                  begin:u2
                     assign result[i] = inp[old_width-1];
                  end
             end
           else if ((i-right_of_dp) >= 0)
             begin:u3
                assign result[i] = inp[i-right_of_dp];
             end
           else
             begin:u4
                assign result[i] = 1'b0;
             end
        end
      endgenerate

endmodule
module shift_division_result (quotient, fraction, res);
    parameter signed [31:0] q_width = 16;
    parameter signed [31:0] f_width = 16;
    parameter signed [31:0] fraction_width = 8;
    parameter signed [31:0] shift_value = 8;
    parameter signed [31:0] shift_dir = 0;
    parameter signed [31:0] vec_MSB = q_width + f_width - 1;
    parameter signed [31:0] result_MSB = q_width + fraction_width - 1;
    parameter signed [31:0] result_LSB = vec_MSB - result_MSB;
    input [q_width - 1 : 0] quotient;
    input [f_width - 1 : 0] fraction;
    output [result_MSB : 0] res;

    wire [vec_MSB:0] vec;
    wire [vec_MSB:0] temp;
   genvar i;
   assign res = vec[vec_MSB:result_LSB];
   assign temp = { quotient, fraction };
   generate
      if (shift_dir == 1)
      begin:left_shift_loop
         for (i = vec_MSB; i>=0;  i = i-1)
         begin:u0
            if (i < shift_value)
            begin:u1
               assign vec[i] = 1'b0;
            end
            else
            begin:u2
               assign vec[i] = temp[i-shift_value];
             end
         end
      end
      else
      begin:right_shift_loop
         for (i = 0; i <= vec_MSB; i = i+1)
         begin:u3
            if (i > vec_MSB - shift_value)
            begin:u4
               assign vec[i] = temp[vec_MSB];
            end
            else
            begin:u5
               assign vec[i] = temp[i+shift_value];
            end
         end
      end
   endgenerate

endmodule
module shift_op (inp, res);
    parameter signed [31:0] inp_width = 16;
    parameter signed [31:0] result_width = 16;
    parameter signed [31:0] shift_value = 8;
    parameter signed [31:0] shift_dir = 0;
    parameter signed [31:0] vec_MSB = inp_width - 1;
    parameter signed [31:0] result_MSB = result_width - 1;
    parameter signed [31:0] result_LSB = vec_MSB - result_MSB;
    input [vec_MSB : 0] inp;
    output [result_MSB : 0] res;

    wire [vec_MSB:0] vec;
   genvar i;
   assign res = vec[vec_MSB:result_LSB];
   generate
      if (shift_dir == 1)
      begin:left_shift_loop
         for (i = vec_MSB; i>=0;  i = i-1)
         begin:u0
            if (i < shift_value)
            begin:u1
               assign vec[i] = 1'b0;
            end
            else
            begin:u2
               assign vec[i] = inp[i-shift_value];
             end
         end
      end
      else
      begin:right_shift_loop
         for (i = 0; i <= vec_MSB; i = i+1)
         begin:u3
            if (i > vec_MSB - shift_value)
            begin:u4
               assign vec[i] = inp[vec_MSB];
            end
            else
            begin:u5
               assign vec[i] = inp[i+shift_value];
            end
         end
      end
   endgenerate

endmodule
module pad_lsb (inp, res);
   parameter signed [31:0] orig_width = 4;
   parameter signed [31:0] new_width = 2;
   input [orig_width - 1 : 0] inp;
   output [new_width - 1 : 0] res;
   parameter signed [31:0] pad_pos = new_width - orig_width -1;
   wire [new_width-1:0] result;
   genvar i;
   assign  res = result;
   generate
      if (new_width >= orig_width)
        begin:u0
           assign result[new_width-1:new_width-orig_width] = inp[orig_width-1:0];
        end
   endgenerate

   generate
      if (pad_pos >= 0)
        begin:u1
           assign result[pad_pos:0] = {pad_pos{1'b0}};
        end
   endgenerate
endmodule
module zero_ext (inp, res);
   parameter signed [31:0]  old_width = 4;
   parameter signed [31:0]  new_width = 2;
   input [old_width - 1 : 0] inp;
   output [new_width - 1 : 0] res;
   wire [new_width-1:0] result;
   genvar i;
   assign res = result;
   generate
     if (new_width > old_width)
       begin:u0
          assign result = { {(new_width-old_width){1'b0}}, inp};
       end
     else
       begin:u1
          assign result[new_width-1:0] = inp[new_width-1:0];
       end
    endgenerate
endmodule
module sign_ext (inp, res);
   parameter signed [31:0]  old_width = 4;
   parameter signed [31:0]  new_width = 2;
   input [old_width - 1 : 0] inp;
   output [new_width - 1 : 0] res;
   wire [new_width-1:0] result;
   assign res = result;
   generate
     if (new_width > old_width)
       begin:u0
          assign result = { {(new_width-old_width){inp[old_width-1]}}, inp};
       end
     else
       begin:u1
          assign result[new_width-1:0] = inp[new_width-1:0];
       end
   endgenerate

endmodule
module extend_msb (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
    wire [new_width-1:0] result;
   assign res = result;
   generate
      if (new_arith ==`xlUnsigned)
        begin:u0
           zero_ext # (old_width, new_width)
             em_zero_ext (.inp(inp), .res(result));
        end
      else
        begin:u1
           sign_ext # (old_width, new_width)
             em_sign_ext (.inp(inp), .res(result));
        end
    endgenerate
endmodule
module align_input (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  delta = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
    parameter signed [31:0]  abs_delta = (delta >= 0) ? (delta) : (-delta);
    wire [new_width-1:0] result;
    wire [(old_width+abs_delta)-1:0] padded_inp;
   assign res = result;
   generate
      if (delta > 0)
        begin:u0
           pad_lsb # (old_width, old_width+delta)
             ai_pad_lsb (.inp(inp), .res(padded_inp));
           extend_msb # (old_width+delta, new_width, new_arith)
             ai_extend_msb (.inp(padded_inp), .res(result));
        end
      else
        begin:u1
           extend_msb # (old_width, new_width, new_arith)
             ai_extend_msb (.inp(inp), .res(result));
        end
   endgenerate
endmodule
module round_towards_inf (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0]  right_of_dp = old_bin_pt - new_bin_pt;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   parameter signed [31:0]  right_of_dp_2 = (right_of_dp >=2) ? right_of_dp-2 : 0;
   parameter signed [31:0]  right_of_dp_1 = (right_of_dp >=1) ? right_of_dp-1 : 0;
   reg [new_width-1:0] one_or_zero;
   wire [new_width-1:0] truncated_val;
   wire signed [new_width-1:0] result_signed;
   wire [abs_right_of_dp+old_width-1 : 0] padded_val;
   initial
     begin
        one_or_zero = {new_width{1'b0}};
     end
   generate
      if (right_of_dp >= 0)
        begin:u0
           if (new_arith ==`xlUnsigned)
             begin:u1
                zero_ext # (old_width-right_of_dp, new_width)
                  rti_zero_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
           else
             begin:u2
                sign_ext # (old_width-right_of_dp, new_width)
                  rti_sign_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
        end
      else
        begin:u3
           pad_lsb # (old_width, abs_right_of_dp+old_width)
             rti_pad_lsb (.inp(inp), .res(padded_val));
           if (new_arith ==`xlUnsigned)
             begin:u4
                zero_ext # (abs_right_of_dp+old_width, new_width)
                  rti_zero_ext1 (.inp(padded_val), .res(truncated_val));
             end
           else
             begin:u5
                sign_ext # (abs_right_of_dp+old_width, new_width)
                  rti_sign_ext1 (.inp(padded_val), .res(truncated_val));
             end
        end
   endgenerate
   generate
      if (new_arith == `xlSigned)
        begin:u6
           always @(inp)
             begin
                one_or_zero = {new_width{1'b0}};
               if (inp[old_width-1] == 1'b0)
                 begin
                    one_or_zero[0] = 1'b1;
                 end
               if ((right_of_dp >=2) && (right_of_dp <= old_width))
                 begin
                    if(|inp[right_of_dp_2:0] == 1'b1)
                       begin
                          one_or_zero[0] = 1'b1;
                       end
                 end
               if ((right_of_dp >=1) && (right_of_dp <= old_width))
                 begin
                    if(inp[right_of_dp_1] == 1'b0)
                      begin
                         one_or_zero[0] = 1'b0;
                      end
                 end
               else
                 begin
                    one_or_zero[0] = 1'b0;
                 end
             end
             assign result_signed = truncated_val + one_or_zero;
             assign res = result_signed;
        end

      else
        begin:u7
           always @(inp)
             begin
                one_or_zero = {new_width{1'b0}};
               if ((right_of_dp >=1) && (right_of_dp <= old_width))
                 begin
                    one_or_zero[0] = inp[right_of_dp_1];
                 end
             end
             assign res = truncated_val + one_or_zero;
        end
   endgenerate

endmodule
module round_towards_even (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
   parameter signed [31:0]  right_of_dp = old_bin_pt - new_bin_pt;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   parameter signed [31:0]  expected_new_width = old_width - right_of_dp + 1;
   reg [new_width-1:0] one_or_zero;
   wire signed [new_width-1:0] result_signed;
   wire [new_width-1:0] truncated_val;
   wire [abs_right_of_dp+old_width-1 : 0] padded_val;
   initial
     begin
      one_or_zero = { new_width{1'b0}};
     end

   generate
      if (right_of_dp >= 0)
        begin:u0
           if (new_arith == `xlUnsigned)
             begin:u1
                zero_ext # (old_width-right_of_dp, new_width)
                            rte_zero_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
           else
             begin:u2
                sign_ext # (old_width-right_of_dp, new_width)
                            rte_sign_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
        end

      else
        begin:u3
           pad_lsb # (old_width, abs_right_of_dp+old_width)
                            rte_pad_lsb (.inp(inp), .res(padded_val));
           if (new_arith == `xlUnsigned)
             begin:u4
                zero_ext # (abs_right_of_dp+old_width, new_width)
                            rte_zero_ext1 (.inp(padded_val), .res(truncated_val));
             end
           else
             begin:u5
                sign_ext # (abs_right_of_dp+old_width, new_width)
                            rte_sign_ext1 (.inp(padded_val), .res(truncated_val));
             end
        end
   endgenerate

   generate
      if ((right_of_dp ==1) && (right_of_dp <= old_width))
        begin:u6a
           always @(inp)
             begin
                one_or_zero = { new_width{1'b0}};
                if(inp[right_of_dp-1] == 1'b1)
                  begin
                     one_or_zero[0] = inp[right_of_dp];
                  end
                else
                  begin
                     one_or_zero[0] = inp[right_of_dp-1];
                  end
             end
       end
      else if ((right_of_dp >=2) && (right_of_dp <= old_width))
        begin:u6b
           always @(inp)
             begin
                one_or_zero = { new_width{1'b0}};
                if( (inp[right_of_dp-1] == 'b1) && !(|inp[right_of_dp-2:0]) )
                  begin
                     one_or_zero[0] = inp[right_of_dp];
                  end
                else
                  begin
                     one_or_zero[0] = inp[right_of_dp-1];
                  end
             end
       end
      else
        begin:u7
            always @(inp)
             begin
                one_or_zero = { new_width{1'b0}};
             end
        end
   endgenerate

   generate
      if (new_arith == `xlSigned)
        begin:u8
           assign result_signed = truncated_val + one_or_zero;
           assign res = result_signed;
        end
      else
        begin:u9
           assign res = truncated_val + one_or_zero;
        end
   endgenerate

endmodule
module trunc (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0]  right_of_dp = old_bin_pt - new_bin_pt;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   wire [new_width-1:0] result;
   wire [abs_right_of_dp+old_width-1 : 0] padded_val;
   assign res = result;
   generate
      if (new_bin_pt > old_bin_pt)
        begin:tr_u2
           pad_lsb # (old_width, abs_right_of_dp+old_width)
             tr_pad_lsb (.inp(inp), .res(padded_val));
           extend_msb # (old_width+abs_right_of_dp, new_width, new_arith)
             tr_extend_msb (.inp(padded_val), .res(result));
        end
      else
        begin:tr_u1
           extend_msb # (old_width-right_of_dp, new_width, new_arith)
             tr_extend_msb (.inp(inp[old_width-1:right_of_dp]), .res(result));
        end
   endgenerate

endmodule
module saturation_arith (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   parameter signed [31:0]  abs_width = (new_width > old_width) ? (new_width-old_width) : 1;
   parameter signed [31:0]  abs_new_width = (old_width > new_width) ? new_width : 1;
   reg overflow;
   reg [old_width-1:0] vec;
   reg [new_width-1:0] result;
   assign res = result;
   generate
      if (old_width > new_width)
        begin:sa_u0
           always @ (inp)
             begin
                vec = inp;
                overflow = 1;
                if ( (old_arith == `xlSigned) && (new_arith == `xlSigned) )
                  begin
                    if (~|inp[old_width-1:abs_new_width-1] || &inp[old_width-1:abs_new_width-1])
                     begin
                       overflow = 0;
                     end
                 end

                if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned))
                   begin
                    if (~|inp[old_width-1 : abs_new_width])
                    begin
                       overflow = 0;
                    end
                end

                if ((old_arith == `xlUnsigned) &&  (new_arith == `xlUnsigned))
                  begin
                    if (~|inp[old_width-1 : abs_new_width])
                     begin
                       overflow = 0;
                     end
                  end

               if ( (old_arith == `xlUnsigned) && (new_arith == `xlSigned))
                 begin
                  if (~|inp[old_width-1:abs_new_width-1] || &inp[old_width-1:abs_new_width-1])
                    begin
                      overflow = 0;
                    end
                 end
               if (overflow == 1)
                 begin
                   if (new_arith == `xlSigned)
                     begin
                       if (inp[old_width-1] == 'b0)
                         begin
                           result = (new_width ==1) ? 1'b0 : {1'b0, {(new_width-1){1'b1}} };
                         end
                      else
                        begin
                          result = (new_width ==1) ? 1'b1 : {1'b1, {(new_width-1){1'b0}} };
                       end
                     end
                   else
                     begin
                       if ((old_arith == `xlSigned) && (inp[old_width-1] == 'b1))
                         begin
                           result = {new_width{1'b0}};
                         end
                       else
                         begin
                           result = {new_width{1'b1}};
                         end
                     end
                 end
               else
                 begin
                    if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned) && (inp[old_width-1] == 'b1) )
                    begin
                      vec = {old_width{1'b0}};
                    end
                    result = vec[new_width-1:0];
                 end
             end
        end
   endgenerate
   generate
      if (new_width > old_width)
        begin:sa_u1
         always @ (inp)
           begin
            vec = inp;
            if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned) && (inp[old_width-1] == 1'b1) )
              begin
                vec = {old_width{1'b0}};
              end
              if (new_arith == `xlUnsigned)
                begin
                  result = { {abs_width{1'b0}}, vec};
                end
              else
                begin
                  result = { {abs_width{inp[old_width-1]}}, vec};
                end
           end
       end
   endgenerate

   generate
      if (new_width == old_width)
        begin:sa_u2
         always @ (inp)
           begin
             if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned) && (inp[old_width-1] == 'b1) )
               begin
                 result = {old_width{1'b0}};
               end
             else
               begin
                 result = inp;
               end
           end
        end
   endgenerate

endmodule
module wrap_arith (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    parameter signed [31:0]  result_arith = ((old_arith==`xlSigned)&&(new_arith==`xlUnsigned))? `xlSigned : new_arith;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
   wire [new_width-1:0] result;
   cast # (old_width, old_bin_pt, new_width, new_bin_pt, result_arith)
     wrap_cast (.inp(inp), .res(result));
   assign res = result;

endmodule
module convert_type (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    parameter signed [31:0]  quantization = `xlTruncate;
    parameter signed [31:0]  overflow = `xlWrap;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0]  fp_width = old_width + 2;
   parameter signed [31:0]  fp_bin_pt = old_bin_pt;
   parameter signed [31:0]  fp_arith = old_arith;
   parameter signed [31:0]  q_width = fp_width + new_bin_pt - old_bin_pt;
   parameter signed [31:0]  q_bin_pt = new_bin_pt;
   parameter signed [31:0]  q_arith = old_arith;
   wire [fp_width-1:0] full_precision_result;
   wire [new_width-1:0] result;
   wire [q_width-1:0] quantized_result;
   assign res = result;
   cast # (old_width, old_bin_pt, fp_width, fp_bin_pt, fp_arith)
     fp_cast (.inp(inp), .res(full_precision_result));
   generate
      if (quantization == `xlRound)
        begin:ct_u0
           round_towards_inf # (fp_width, fp_bin_pt, fp_arith, q_width, q_bin_pt, q_arith)
             quant_rtf (.inp(full_precision_result), .res(quantized_result));
        end
   endgenerate

   generate
      if (quantization == `xlRoundBanker)
        begin:ct_u1
           round_towards_even # (fp_width, fp_bin_pt, fp_arith, q_width, q_bin_pt, q_arith)
             quant_rte (.inp(full_precision_result), .res(quantized_result));
        end
   endgenerate

   generate
      if (quantization == `xlTruncate)
        begin:ct_u2
           trunc # (fp_width, fp_bin_pt, fp_arith, q_width, q_bin_pt, q_arith)
             quant_tr (.inp(full_precision_result), .res(quantized_result));
        end
   endgenerate

   generate
      if (overflow == `xlSaturate)
        begin:ct_u3
           saturation_arith # (q_width, q_bin_pt, q_arith, new_width, new_bin_pt, new_arith)
            ovflo_sat (.inp(quantized_result), .res(result));
        end
   endgenerate

   generate
      if ((overflow == `xlWrap) || (overflow == 3))
        begin:ct_u4
           wrap_arith # (q_width, q_bin_pt, q_arith, new_width, new_bin_pt, new_arith)
             ovflo_wrap (.inp(quantized_result), .res(result));
        end
   endgenerate

endmodule
`endif
module uwb_re
	(
		clk,
		ce,
		in_start,	
		in_rst,
		in_data,
		ddph_i,
		sfd_threshold,
		sm_threshold,
		data_out,
		psdu_en,
		coarse_off,
		coarse_error
	);
	
	//parameter DATAIN_WIDTH = 8;
	//parameter SUM_WIDTH = 16;
	
	input clk;
	input ce;
	input in_start;
	input in_rst;
	input[7:0] in_data;
	input[2:0] ddph_i;
	input[31:0] sfd_threshold;
	input[15:0] sm_threshold;
	
	output data_out;
	output psdu_en;
	output coarse_off;
	output coarse_error;
	
	wire data_out;
	//wire output_en;
	wire phr_signal;
	
	
	wire data_signal;
	
	wire sync2_start;
	wire sfd_start;
	//wire data_signal;
	wire data_start;
	wire data_end;
	wire[2:0] state;
	
	wire[7:0] countsample; // Bien dem so sample cho 1 sym (248 symbols)
	wire[12:0] countsyncsym; // Bien dem symbol cho truong SYNC
	wire[10:0] countdatasym;
	wire[2:0] count0to7;
	wire[3:0] countgroup;
	
	wire rst_countsample;
	wire rst_sync;
	
	wire coarse_error;
	
	wire phr_check;
	wire[1:0] out_sync_mode;
	wire[6:0] out_psdu_octets;
	
	wire[7:0] count_coarsesample;
	wire[4:0] count_coarsesyncsym;
	wire coarse_off;
	
	wire ddpOuten_o_reg;
	
	uwb_re_syn_fsm SYNC_FSM(
		.clk(clk),
		.ce(ce),
		.in_start(in_start),
		.in_rst(in_rst),
		.sync2_start(sync2_start),
		.sfd_start(sfd_start),
		.data_start(data_start),
		.data_end(data_end),
		.coarse_error(coarse_error),
		.phr_check(phr_check),
		.state(state)
	);
	
	uwb_re_syn_counter SYNC_COUNTER
	(
		.clk(clk),
		.ce(ce),
		.in_start(in_start),
		.in_rst(in_rst),
		.rst_countsample(rst_countsample),
		.rst_countsync(rst_sync),
		.en_countdata(data_signal),
		//.en_count0to7(enSYNC7),
		.state(state),
		.coarse_error(coarse_error),
		.coarse_off(coarse_off),
		.phr_check(phr_check),
		.countsample(countsample),
		.countsyncsym(countsyncsym),
		.count_coarsesample(count_coarsesample),
		.count_coarsesyncsym(count_coarsesyncsym),
		.countdatasym(countdatasym),
		.count0to7(count0to7),
		.countgroup(countgroup)
	);
	
	uwb_re_syn_coarse SYNC_COARSE
	(
		.clk(clk),
		.ce(ce),
		.in_start(in_start),
		.in_rst(in_rst),
		.in_data(in_data),
		.countsample(count_coarsesample),
		.countsyncsym(count_coarsesyncsym),
		.countgroup(countgroup),
		.phr_check(phr_check),
		.coarse_error(coarse_error),
		.coarse_off(coarse_off)
	);
	
	uwb_re_syn_datapath SYNC_DATAPATH
	(
		.clk(clk),
		.ce(ce),
		.in_start(in_start),
		.in_rst(in_rst),
		.in_data(in_data),
		.sfd_threshold(sfd_threshold),
		.sm_threshold(sm_threshold),
		.state(state),
		.sync_mode(out_sync_mode),
		.psdu_octets(out_psdu_octets),
		.countsample(countsample),
		.countsyncsym(countsyncsym),
		.countdatasym(countdatasym),
		.count0to7(count0to7),
		.coarse_error(coarse_error),
		.phr_check(phr_check),
		.sync2_start(sync2_start),
		.sfd_start(sfd_start),
		.data_signal(data_signal),
		.data_start(data_start),
		.data_end(data_end),
		.phr_signal(phr_signal),
		.rst_countsample(rst_countsample),
		.rst_sync(rst_sync),
		.psdu_en(psdu_en)
	);
	
	uwb_re_demo DEMO
	(
		.clk(clk),
		.ce(ce),
		.start(data_signal),
		.ddph_i(ddph_i),
		.data_in(in_data), 
		.count(countsample),
		.data_out(data_out),
		.ddpOuten_o_reg(ddpOuten_o_reg)
	);
	
	uwb_re_phr_top MAC
	(
		.clk(clk),
		.ddpOuten_i_reg(ddpOuten_o_reg),
		.ce(ce),
		.in_start(phr_signal),	
		.in_rst(in_rst),	
		.in_bit(data_out),
		.coarse_error(coarse_error),
		.state(state),
		.countsample(countsample),
		.countdatasym(countdatasym),
		.coarse_off(coarse_off),
		.out_check(phr_check),
		.out_sync_mode(out_sync_mode),
		.out_psdu_octets(out_psdu_octets)
	);

	
endmodule
	
module uwb_re_syn_fsm (
		clk,
		ce,
		in_start,
		in_rst,
		sync2_start,
		sfd_start,
		data_start,
		data_end,
		coarse_error,
		phr_check,
		state
	);
	
	input clk;
	input ce;
	input in_start;
	input in_rst;
	input sync2_start;
	input sfd_start;
	input data_start;
	input data_end;
	input coarse_error; 
	input phr_check;
	
	output[2:0] state;
	
	reg[2:0] state;
	reg[2:0] ns,ps;
	
	localparam sync1_state = 3'd0, sync2_state = 3'd1, sfd_state = 3'd2, data_state = 3'd3, jump_state = 3'd4;
	
	initial begin
		ns = 0;
		ps = sync1_state;
		state = 0;
	end
	
	always@( posedge clk or negedge in_rst ) begin
		if( in_rst == 0 ) begin 
			ps <= sync1_state;
		end else begin
			if(in_start == 1)
				ps <= ns;
			else
				ps <= sync1_state;
		end
	end
	
	always@(*) begin
		ns = ps;
		case(ps)
			sync1_state:	
				begin 
					if( coarse_error ) 							ns = sync1_state;
					else if( sync2_start==1 && !coarse_error ) 	ns = sync2_state;
				end
			sync2_state:	//if( sfd_start==1 ) 	ns = sfd_state;
				begin 
					if( coarse_error ) 							ns = sync1_state;
					else if( sfd_start==1 ) 					ns = sfd_state;
				end
			sfd_state:		//if( data_start==1 ) ns = data_state;
				begin 
					if( coarse_error ) 							ns = sync1_state;
					else if( data_start==1 ) 					ns = data_state;
				end
			data_state:		
				begin 
					if( coarse_error || phr_check ) 			ns = sync1_state;
					else if( data_end==1 ) 						ns = jump_state;
				end
			jump_state:		if( data_start==1 ) 				ns = data_state;
		endcase
	end
	
	always@(ps) begin
		case(ps)
			sync1_state: begin state = 3'd0; end
			sync2_state: begin state = 3'd1; end
			sfd_state: begin state = 3'd2; end	
			data_state: begin state = 3'd3; end
			default: begin state = 3'd4; end
		endcase
	end
endmodule

module uwb_re_syn_datapath
	(
		clk,
		ce,
		in_start,
		in_rst,
		in_data,
		sfd_threshold,
		sm_threshold,
		state,
		sync_mode,
		psdu_octets,
		countsample,
		countsyncsym,
		countdatasym,
		count0to7,
		coarse_error,
		phr_check,
		sync2_start,
		sfd_start,
		data_signal,
		data_start,
		data_end,
		phr_signal,
		rst_countsample,
		rst_sync,
		psdu_en
	);
	
	//parameter DATAIN_WIDTH = 8;
	//parameter SUM_WIDTH = 16;
	
	input clk;
	input ce;
	input in_start;
	input in_rst;
	input[7:0] in_data;
	input[31:0] sfd_threshold;
	input[15:0] sm_threshold;
	input[2:0] state;
	input[1:0] sync_mode; // Bien dem symbol cho truong SYNC
	input[6:0] psdu_octets;
	input[7:0] countsample; // Bien dem so sample cho 1 sym (248 symbols)
	input[12:0] countsyncsym; // Bien dem symbol cho truong SYNC
	input[10:0] countdatasym;
	input[2:0] count0to7;
	input coarse_error;
	input phr_check;
	
	output sync2_start;
	output sfd_start;
	output data_signal;
	output data_start;
	output data_end;
	output phr_signal;
	output rst_countsample;
	output rst_sync;
	output psdu_en;
	
	reg data_signal;
	reg phr_signal;
	
	
	
	reg[8:0] countsample_d1; // Bien dem so sample cho 1 sym (248 symbols)
	
	wire en5SYNC; // Bien bao co su xuat hien cua 5 symbol SYNC dau tien
	reg enSYNC5; // Bien bao co su xuat hien cua symbol SYNC thu 5
	wire enSYNC7; // Bien bao co su xuat hien cua symbol SYNC thu 7
	//wire enSYNC1; // Bien bao co su xuat hien cua symbol SYNC thu 1
	reg[15:0] symAvgSum[0:247];
	reg[15:0] symbolci[0:30];
	reg[15:0] sumTPR[0:7]; // Thanh ghi luu gia tri lon nhat cua cac symbolci de tim m
	reg compare; // Tin hieu bao trang thai so sanh dien ra
	wire neps_compare;
	reg[15:0] reg_comp; // Thanh ghi luu gia tri lon nhat cua cac symbolci de tim m
	reg[15:0] reg_comp1; // Thanh ghi luu gia tri lon nhat cua cac symbolci de tim n
	reg[2:0] out_neps;
	reg[4:0] out_m;
	
	
	reg[8:0] n_next; // Bien dem so sample cho 1 sym (248 symbols)	
	reg[31:0] sfdsum;
	reg sfd0;
	
	reg psdu_en;

	// ROM

	reg[247:0] reg_Ci;
	
	reg[247:0] reg_cm;
	
	reg[12:0] shr_length; // Do dai cua phan SHR
	
	reg[11:0] data_length;
	
	wire en_sm;
	
	wire cm;
	
	wire cm_d1;
	
	reg[15:0] sm[0:7]; // Thanh ghi luu gia tri lon nhat cua cac symbolci de tim m
	
	reg[2:0] n_delta;
	
	wire phr_signal1;
	
	
	
	integer i;
	
	initial begin
		psdu_en = 0;
		countsample_d1 = 0;
		enSYNC5 = 0;
		sfd0 = 0;
		sfdsum = 0;
		n_next = 0;
		reg_cm = 0;
		shr_length = 0;
		data_length = 0;
		reg_Ci = 248'd104902522442846623806478213859251645363935416819139316092418195455;
		
		//clkSymbol = 0;
		for(i = 0; i < 248; i=i+1) begin
			symAvgSum[i] = 0;
		end
		
		for(i = 0; i < 31; i=i+1) begin
				symbolci[i] = 0;
		end
		reg_comp = 0;
		out_m = 0;
		for(i = 0; i < 8; i=i+1) begin
			sumTPR[i] <= 0;
		end
		reg_comp1 = 0;
		out_neps = 0;
		
		data_signal = 0;
		for(i = 0; i < 8; i=i+1) begin
				sm[i] = 0;
		end
		phr_signal = 0;
		n_delta = 0;
	end
	
// Synchronous - Phase 1
	
	//assign psdu_en = phr_check && data_signal;
	
	always@ (posedge clk ) begin
		if(in_start) begin
			if( (state == 3) && (countdatasym == 18) && (countsample == 63) ) begin
				psdu_en <= 1;
			end else if( data_end || coarse_error || phr_check ) begin
				psdu_en <= 0;
			end
		end else begin
			psdu_en <= 0;
		end
	end
	
	always@ (sync_mode) begin
		if( sync_mode == 2'b00 )
			shr_length = 23;
		else if( sync_mode == 2'b01 )
			shr_length = 71;
		else if( sync_mode == 2'b10 )
			shr_length = 1031;
		else 
			shr_length = 4103;
	end

// Counter 
	assign rst_sync = rst_countsample || sfd_start;
	assign rst_countsample = !in_rst || sync2_start || coarse_error || phr_check;
	
	
	
	always@ (posedge clk) begin
		if(in_start == 0 ) begin
			countsample_d1 <= 0;
		end else begin
			countsample_d1 <= countsample;
		end
	end
	
 	always@ (posedge clk) begin
		// Dem 19 symbol cua PHR
		if( in_start )
			phr_signal <= phr_signal1;
	end
	 
/* 	 
	always@ ( state or countdatasym or countsample or coarse_error ) begin
		// Dem 19 symbol cua PHR
		if( (state == 3) && (countdatasym >= 0) && (countdatasym <= 18) ) begin
			phr_signal <= 1;
		end else begin
			phr_signal <= 0;
		end	
	end
	 */
	assign phr_signal1 = (state == 3) && (countdatasym >= 0) && (countdatasym <= 18) ? 1'b1 : 1'b0;
	
// End Counter Code
	
		
	assign sync2_start = (state == 0) && (countsyncsym == 8) && (countsample == n_next);
	
	assign sfd_start = sfd0;
	
	
	
	assign en5SYNC = ( (state == 0) && (countsyncsym >= 0) && (countsyncsym <= 4) );
	
	
	
	always@ (posedge clk) begin
		if(!in_start)
			enSYNC5 <= 0;
		else begin
			if( (state == 0) && (countsyncsym == 4) )
				enSYNC5 <= 1;
			else 
				enSYNC5 <= 0;
		end
	end

	assign data_start = ( ( (state == 2) && (countsyncsym == 6) && (countsample == 247) ) || ( (state == 4) && (countsyncsym == shr_length) && (countsample == 247) ) ) ;
	
	assign data_end = (state == 3) && (countdatasym == data_length) && (countsample == 63) && (!phr_signal1);
	
	//assign phr_end = (state == 3) && (countdatasym == 18) && (countsample == 63);
	
	// Calculate avg sum of 5 first symbols
	always@ (posedge clk) begin
		if(rst_sync) begin
			for(i = 0; i < 248; i=i+1) begin
				symAvgSum[i] <= 0;
			end
		end else begin
			if(in_start && en5SYNC) begin
				symAvgSum[countsample] <= symAvgSum[countsample] + in_data;
			end
		end
	end
	
	
	// Rotate reg_Ci
	always@ (posedge clk) begin
		if(rst_sync) begin
			reg_Ci <= 248'd104902522442846623806478213859251645363935416819139316092418195455;
		end else if(enSYNC5) begin
			reg_Ci <= {reg_Ci[0], reg_Ci[247:1]};
		end
	end
	
	// Calculate for m
	always@ (posedge clk) begin
		if(rst_sync) begin
			for(i = 0; i < 31; i=i+1) begin
				symbolci[i] <= 0;
			end
		end else begin
			if(enSYNC5) begin
				for(i = 0; i < 31; i=i+1) begin
					if(reg_Ci[i*8]) begin
						symbolci[i] <= symbolci[i] + symAvgSum[countsample_d1];
					end
				end
			end
		end
	end
	
	always@ (posedge clk) begin
		if(!in_start)
			compare <= 0;
		else begin
			if( (state == 0) && (countsyncsym==5) && (countsample <= 30) )
				compare <= 1;
			else 
				compare <= 0;
		end	
	end
	
	
	

	
	always@ (posedge clk) begin
		if(rst_sync) begin
			reg_comp <= 0;
			out_m <= 0;
		end else begin
			if(compare) begin
				if(symbolci[countsample_d1] > reg_comp) begin
					reg_comp <= symbolci[countsample_d1];
					out_m <= countsample_d1[4:0];
				end
			end
		end
	end
/* 	
	always@ (in_start or out_m or n_delta) begin
		if(!in_start) begin
			n_next <= 0;
		end else begin
			if(out_m == 0) 
				n_next <= n_delta - 1;
			else
				n_next <= ( (31 - out_m) << 3 ) + n_delta - 1;
		end
	end
	 */

	always@ ( posedge clk ) begin
		if(!in_start) begin
			n_next <= 0;
		end else if( (state == 0) && (countsyncsym==7) && (countsample == 10) ) begin
			if( (out_m == 0) && (n_delta != 0) ) 
				n_next <= n_delta - 1;
			else
				n_next <= ( (31 - out_m) << 3 ) + n_delta - 1;
		end
	end
	 
	// Tim phan data
	always@ (posedge clk) begin
		// Dem 7 symbol tiep theo cua SFD, de nhay sang phan data
		if(in_start) begin
			if( data_start ) begin
				data_signal <= 1;
			// Dem du 399 symbol cua data 
			end else if( data_end || coarse_error || phr_check ) begin
				data_signal <= 0;
			end	
		end else begin
			data_signal <= 0;
		end
	end
/* 	
	always@ (psdu_octets) begin
		if( ( (psdu_octets*8) % 330 ) == 0 )
			data_length = 19 + psdu_octets * 8 + ( (psdu_octets * 8)/330 ) * 48 + 1; // Thuc ra la +2 nhung de do phai tru khi so sanh (countdatasym == data_length) chi + 1
		else 
			data_length = 19 + psdu_octets * 8 + ( (psdu_octets * 8)/330 + 1) * 48 + 1;
			// 19 bit PHR + 330 bit du lieu + 6 bit them cho du octet + 2*48 ma hoa + 2 bit ket thuc frame 00
	end
	 */
	//
	always@ (psdu_octets) begin
		if( psdu_octets == 42 )
			data_length = 398; // Thuc ra la +2 nhung de do phai tru khi so sanh (countdatasym == data_length) chi + 1
		else 
			data_length = 0;
			// 19 bit PHR + 330 bit du lieu + 6 bit them cho du octet + 2*48 ma hoa + 2 bit ket thuc frame 00
	end
	
	always@ (out_m or enSYNC7 or reg_Ci) begin
		if( enSYNC7 )
			reg_cm = ( reg_Ci >> (out_m << 3) ) | ( reg_Ci << ( (31 - out_m) << 3 ) );
		else 
			reg_cm = 0;
	end
	
	assign enSYNC7 = ( (state == 0) && (countsyncsym == 6) );
		
	
		
	always@ (posedge clk) begin
		if(rst_sync) begin
			for(i = 0; i < 8; i=i+1) begin
				sumTPR[i] <= 0;
			end
		end else begin
			if(enSYNC7 && reg_cm[countsample]) begin
				sumTPR[count0to7] <= sumTPR[count0to7] + symAvgSum[countsample];
			end
		end
	end
	
	// Xac dinh chu ki tinh neps
	assign neps_compare = (state == 0) && (countsyncsym==7) && (countsample <= 7) ? 1'b1 : 1'b0;
	
	always@ (posedge clk) begin
		if(rst_sync) begin
			reg_comp1 <= 0;
			out_neps <= 0;
		end else begin
			if(neps_compare ) begin
				if(sumTPR[countsample] > reg_comp1) begin
					reg_comp1 <= sumTPR[countsample];
					out_neps <= countsample[2:0];
				end
			end
		end
	end

// Update 25/4/2013	
	assign cm = reg_cm[countsample];
	 
	assign cm_d1 = enSYNC7 && reg_cm[countsample - 8];
	assign en_sm = ( ( (state == 0) && (countsyncsym == 6) && (countsample >= 8) ) && !cm_d1 && cm ) ? 1'b1 : 1'b0;
	
	always@ (posedge clk) begin
		if(rst_sync) begin
			for(i = 0; i < 8; i=i+1) begin
				sm[i] <= 0;
			end
		end else begin
			if(en_sm) begin
				sm[count0to7] <= sm[count0to7] + symAvgSum[countsample];
			end
		end
	end
	
	always@ ( posedge clk or posedge rst_sync) begin
		if(rst_sync) begin
			n_delta <= 3'd0;
		end else if( (state == 0) && (countsyncsym==7) && (countsample == 8) ) begin
			if(out_neps == 3'd0) begin
				if(sm[4] >= sm_threshold)
					n_delta <= 3'd4;
				else if(sm[5] >= sm_threshold)
					n_delta <= 3'd5;
				else if(sm[6] >= sm_threshold)
					n_delta <= 3'd6;
				else if(sm[7] >= sm_threshold)
					n_delta <= 3'd7;
				else 
					n_delta <= out_neps;
			end if(out_neps == 3'd1) begin
				if(sm[5] >= sm_threshold)
					n_delta <= 3'd5;
				else if(sm[6] >= sm_threshold)
					n_delta <= 3'd6;
				else if(sm[7] >= sm_threshold)
					n_delta <= 3'd7;
				else if(sm[0] >= sm_threshold)
					n_delta <= 3'd0;
				else 
					n_delta <= out_neps;
			end if(out_neps == 3'd2) begin
				if(sm[6] >= sm_threshold)
					n_delta <= 3'd6;
				else if(sm[7] >= sm_threshold)
					n_delta <= 3'd7;
				else if(sm[0] >= sm_threshold)
					n_delta <= 3'd0;
				else if(sm[1] >= sm_threshold)
					n_delta <= 3'd1;
				else 
					n_delta <= out_neps;
			end if(out_neps == 3'd3) begin
				if(sm[7] >= sm_threshold)
					n_delta <= 3'd7;
				else if(sm[0] >= sm_threshold)
					n_delta <= 3'd0;
				else if(sm[1] >= sm_threshold)
					n_delta <= 3'd1;
				else if(sm[2] >= sm_threshold)
					n_delta <= 3'd2;
				else 
					n_delta <= out_neps;
			end if(out_neps == 3'd4) begin
				if(sm[0] >= sm_threshold)
					n_delta <= 3'd0;
				else if(sm[1] >= sm_threshold)
					n_delta <= 3'd1;
				else if(sm[2] >= sm_threshold)
					n_delta <= 3'd2;
				else if(sm[3] >= sm_threshold)
					n_delta <= 3'd3;
				else 
					n_delta <= out_neps;
			end if(out_neps == 3'd5) begin
				if(sm[1] >= sm_threshold)
					n_delta <= 3'd1;
				else if(sm[2] >= sm_threshold)
					n_delta <= 3'd2;
				else if(sm[3] >= sm_threshold)
					n_delta <= 3'd3;
				else if(sm[4] >= sm_threshold)
					n_delta <= 3'd4;
				else 
					n_delta <= out_neps;
			end if(out_neps == 3'd6) begin
				if(sm[2] >= sm_threshold)
					n_delta <= 3'd2;
				else if(sm[3] >= sm_threshold)
					n_delta <= 3'd3;
				else if(sm[4] >= sm_threshold)
					n_delta <= 3'd4;
				else if(sm[5] >= sm_threshold)
					n_delta <= 3'd5;
				else 
					n_delta <= out_neps;
			end else begin
				if(sm[3] >= sm_threshold)
					n_delta <= 3'd3;
				else if(sm[4] >= sm_threshold)
					n_delta <= 3'd4;
				else if(sm[5] >= sm_threshold)
					n_delta <= 3'd5;
				else if(sm[6] >= sm_threshold)
					n_delta <= 3'd6;
				else 
					n_delta <= out_neps;
			end
		end
	end
	
// Tim SFD dau tien
	always@ (posedge clk) begin
		if( (countsample == 247) || rst_sync ) begin
			sfdsum <= 0;
		end else begin
			if( state == 1 ) begin
				sfdsum <= sfdsum + ( (in_data * in_data) >> 2 );
			end else begin
				sfdsum <= 0;
			end
		end
	end
	
		// So sanh voi nguong
	always@ (posedge clk) begin
		if( (state == 1) && (countsample == 247) ) begin
			if( (sfdsum >> 8) <= sfd_threshold)
				sfd0 <= 1;
			else
				sfd0 <= 0;
		end else begin
			sfd0 <= 0;
		end
	end
	
endmodule
	
module uwb_re_syn_counter
	(
		clk,
		ce, 
		in_start,
		in_rst,
		rst_countsample,
		rst_countsync,
		en_countdata,
		//en_count0to7,
		state,
		coarse_error,
		coarse_off,
		phr_check,
		countsample,
		countsyncsym,
		count_coarsesample,
		count_coarsesyncsym,
		countdatasym,
		count0to7,
		countgroup
	);
	
	input clk;
	input ce;
	input in_start;
	input in_rst;
	input rst_countsample;
	input rst_countsync;
	input en_countdata;
	//input en_count0to7;
	input[2:0] state;
	input coarse_error;
	input coarse_off;
	input phr_check;
	
	output[7:0] countsample; // Bien dem so sample cho 1 sym (248 symbols)
	output[12:0] countsyncsym; // Bien dem symbol cho truong SYNC
	output[10:0] countdatasym;
	output[2:0] count0to7;
	output[7:0] count_coarsesample; // Bien dem so sample cho 1 sym (248 symbols)
	output[4:0] count_coarsesyncsym; // Bien dem symbol cho truong SYNC
	output[3:0] countgroup;
	
	reg[7:0] countsample; // Bien dem so sample cho 1 sym (248 symbols)
	reg[12:0] countsyncsym; // Bien dem symbol cho truong SYNC
	reg[10:0] countdatasym;
	reg[2:0] count0to7;
	reg[3:0] countgroup;
	reg[7:0] count_coarsesample; // Bien dem so sample cho 1 sym (248 symbols)
	reg[4:0] count_coarsesyncsym; // Bien dem symbol cho truong SYNC
	
	initial begin
		countsample = 0;
		countsyncsym = 0;
		countdatasym = 0;
		count0to7 = 0;
		countgroup = 0;
		count_coarsesample = 0;
		count_coarsesyncsym = 0;
	end
	
	// Count 0 - 247 for 248 samples
	always@ (posedge clk) begin // or posedge rst_countsample
		if( rst_countsample || coarse_error) begin
			countsample <= 0;
		end else if(in_start) begin
			countsample <= countsample + 1;
			if( (state == 0) || (state == 1) || (state == 2) || (state == 4) ) begin	
				if(countsample == 8'd247)
					countsample <= 0;
			end else begin
				if(countsample == 8'd63)
					countsample <= 0;
			end
		end
	end
	
	// Count 0 - 15 for 16 symbols of SYNC
	always@ (posedge clk) begin
		if( rst_countsync || coarse_error )begin
			countsyncsym <= 0;
		end else if(in_start) begin
			if( (state == 0) || (state == 1) || (state == 2) || (state == 4) ) begin
				if(countsample == 8'd247)
					countsyncsym <= countsyncsym + 1;	
			end else 
				countsyncsym <= 0;
		end
	end 
	
	// Count 0 - 15 for 16 symbols of DATA
	always@ (posedge clk) begin
		if( en_countdata && in_start )begin
			if(countsample == 63)
				countdatasym <= countdatasym + 1;	
		end else begin
			countdatasym <= 0;
		end
	end 
	
	// Count 0 to 7 for counting during 1 symbol sync
	always@ (posedge clk) begin
		if(rst_countsync  || coarse_error) begin
			count0to7 <= 0;
		end else if(in_start) begin
			if(state == 0) begin
				count0to7 <= count0to7 + 1; 
			end
		end
	end
	
	// Count 0 - 247 for 248 samples during coarse sync
	always@ (posedge clk) begin // or posedge rst_countsample
		if( !in_rst || coarse_error || phr_check ) begin
			count_coarsesample <= 0;
		end else if(in_start && !coarse_off ) begin
			count_coarsesample <= count_coarsesample + 1;
			if( (state == 0) || (state == 1) || (state == 2) || (state == 3) ) begin	
				if(count_coarsesample == 8'd247)
					count_coarsesample <= 0;
			end
		end
	end
	
	// Count 0 - 15 for 16 symbols of SYNC
	always@ (posedge clk) begin
		if( !in_rst || coarse_error || phr_check )begin
			count_coarsesyncsym <= 0;
		end else if(in_start && !coarse_off) begin
			if( (state == 0) || (state == 1) || (state == 2) || (state == 3) ) begin
				if(count_coarsesample == 8'd247) begin
					count_coarsesyncsym <= count_coarsesyncsym + 1;	
				end else if( (count_coarsesample == 8'd247) && (count_coarsesyncsym == 29) )
					count_coarsesyncsym <= 0;
			end else 
				count_coarsesyncsym <= 0;
		end
	end 
	
	// Count 0 to 10 for counting group, 24 samples/group 
	always@ (posedge clk) begin
		if(!in_rst || phr_check || coarse_error ) begin
			countgroup <= 0;
		end else if( !coarse_off && in_start) begin
			if( (count_coarsesample == 23) || (count_coarsesample == 47) || (count_coarsesample == 71) || (count_coarsesample == 95) || (count_coarsesample == 119) || (count_coarsesample == 143) || (count_coarsesample == 167) || (count_coarsesample == 191) || (count_coarsesample == 215) || (count_coarsesample == 239) ) begin
				countgroup <= countgroup + 1; 
			end else if( count_coarsesample == 247 ) begin
				countgroup <= 0;
			end
		end
	end
	
endmodule

module uwb_re_syn_coarse
	(
		clk,
		ce,
		in_start,
		in_rst,
		in_data,
		countsample,
		countsyncsym,
		countgroup,
		phr_check,
		coarse_error,
		coarse_off
	);
	
	input clk;
	input ce;
	input in_start;
	input in_rst;
	input[7:0] in_data;
	input[7:0] countsample;
	input[4:0] countsyncsym;
	input[3:0] countgroup;
	input phr_check;
	
	
	output coarse_error;
	output coarse_off;
	
	reg coarse_error;
	
	
	reg[3:0] i_max;
	reg[3:0] count_i;
	reg[3:0] i_temp;
	
	reg[15:0] reg_comp;
	reg[15:0] rsam [0:10];
	
	reg[0:247] reg_Ci;
	
	wire rst_rsam;
	
	wire count_rst;
	
	reg[31:0] a_power;
	reg[31:0] a1_power;
	reg[31:0] a2_power;
	reg[31:0] sympower0;
	reg[31:0] sympower1;

	reg coarse_off;
	
	wire[3:0] count0to10;
	
	integer i;
	
	initial begin
		i_temp = 0;
		reg_Ci = 248'b11110000111100000000000000000000111100000000000000000000111100001111000011110000111100001111000000000000111100001111000011110000000000000000000000000000111100000000000011110000000000001111000011110000000000001111000000000000000000000000000000000000;
		reg_comp = 0;
		i_max = 0;
		for(i = 0; i <= 10; i=i+1) begin
			rsam[i] = 0;
		end
		count_i = 0;
		coarse_error = 0;
		a_power = 0;
		a1_power = 0;
		a2_power = 0;
		sympower0 = 0;
		sympower1 = 0;
		coarse_off = 0;
	end
	
	always@( posedge clk or posedge count_rst) begin
		if(count_rst)
			//reg_Ci = 248'd104902522442846623806478213859251645363935416819139316092418195455;
			reg_Ci = 248'b11110000111100000000000000000000111100000000000000000000111100001111000011110000111100001111000000000000111100001111000011110000000000000000000000000000111100000000000011110000000000001111000011110000000000001111000000000000000000000000000000000000;
	end
	
	assign rst_rsam = ( in_start && (!coarse_off) && (countsample == 247) && ( countsyncsym >= 0 ) && ( countsyncsym <= 9 ) ) || coarse_error || phr_check || !in_rst ? 1'b1 : 1'b0;
	
	always@ (posedge clk or posedge rst_rsam) begin 
		if(rst_rsam) begin
			for(i = 0; i <= 10; i=i+1) begin
				rsam[i] <= 0;
			end
		end else if(in_start && (!coarse_off) ) begin
			if( ( countsyncsym >= 0 ) && ( countsyncsym <= 9 ) && reg_Ci[countsample] )begin
				rsam[countgroup] <= rsam[countgroup] + in_data;
			end
		end else begin
			for(i = 0; i <= 10; i=i+1) begin
				rsam[i] <= 0;
			end
		end
	end
/* 	
	always@ ( posedge clk or posedge count_rst ) begin
		if( count_rst ) begin
			reg_comp = 0;
			i_max = 0;
		end else if( in_start && (!coarse_off) && ( countsyncsym >= 0 ) && ( countsyncsym <= 9 ) && (countsample == 245) ) begin
			for(i = 0; i <= 10; i = i + 1) begin
				if(rsam[i] > reg_comp) begin
					reg_comp = rsam[i];
					i_max = i;
				end	
			end
		end else begin
			reg_comp = 0;
			i_max = 0;
		end
	end */
	
	assign count0to10 = countsample[3:0];
	
	always@ ( posedge clk or posedge count_rst ) begin
		if( count_rst ) begin
			reg_comp <= 0;
			i_max <= 0;
		end else if( in_start && (!coarse_off) && ( countsyncsym >= 0 ) && ( countsyncsym <= 9 ) && (countsample >= 224) && (countsample <= 234) ) begin
			if(rsam[count0to10] >= reg_comp) begin
				reg_comp <= rsam[count0to10];
				i_max <= count0to10;
			end	
		end else begin
			reg_comp <= 0;
		end
	end
	
	assign count_rst = !in_rst || coarse_error || phr_check;
	
	always@ (posedge clk or posedge count_rst) begin
		if( count_rst ) begin
			i_temp <= 0;
		end else if( (!coarse_off) && in_start && ( countsyncsym >= 0 ) && ( countsyncsym <= 9 ) ) begin
			if(countsample == 246) begin
				if(i_temp != i_max) begin
					i_temp <= i_max;
				end
			end
		end 
	end
	
	always@ (posedge clk or posedge count_rst) begin
		if( count_rst ) begin
			count_i <= 0;
		end else if( (!coarse_off) && in_start && ( countsyncsym >= 1 ) && ( countsyncsym <= 9 ) ) begin
			if(countsample == 246) begin
				if(i_temp == i_max) begin
					count_i <= count_i + 1;
				end else begin
					count_i <= 0;
				end
			end
		end 
	end
	
	always@( posedge clk or negedge in_rst ) begin
		if( !in_rst ) begin
			coarse_error <= 0;
		end else if( in_start && (!coarse_off) && (countsyncsym == 30) && (countsample == 1) ) begin
			if( ( count_i == 9 ) && (a_power > a1_power) && (a_power < a2_power) ) begin
				coarse_error <= 0;
			end else begin
				coarse_error <= 1;
			end
		end else begin
			coarse_error <= 0;
		end
	end

	
	// Update phan tinh nang luong ngay 10-05-2013
	always@ ( posedge clk or posedge count_rst ) begin
		if( count_rst ) begin
			coarse_off <= 0;
		end else if (in_start) begin
			if( (countsyncsym == 30) && (countsample == 2) ) begin
				if( coarse_error == 0 ) begin
					coarse_off <= 1;
				end
			end
		end else begin
			coarse_off <= 0;
		end
	end
	
	always@ ( posedge clk or posedge count_rst ) begin
		if(count_rst) begin
			sympower0 <= 0;
			sympower1 <= 0;
		end else if(!coarse_off) begin
				//if( ( countsyncsym >= 0 ) && ( countsyncsym <= 29 ) ) begin
			if(!countsyncsym[0]) begin
				sympower0 <= sympower0 + in_data; // Cong bien do
				sympower1 <= 0;
			end else begin
				sympower1 <= sympower1 + in_data;
				sympower0 <= 0;
			end
		end
	end
	
	always@ (posedge clk or posedge count_rst ) begin
		if(count_rst) begin
			a_power <= 0;
			a1_power <= 0;
			a2_power <= 0;
		end else if( (!coarse_off) && ( countsyncsym >= 1 ) && ( countsyncsym <= 30 ) && (countsample == 0) ) begin
			if( ( countsyncsym >= 1 ) && ( countsyncsym <= 10 ) ) begin
				if(countsyncsym[0]) begin
					a_power <= a_power + sympower0;
				end else begin
					a_power <= a_power + sympower1;
				end
			end else if( ( countsyncsym >= 11 ) && ( countsyncsym <= 20 ) ) begin
				if(countsyncsym[0]) begin
					a1_power <= a1_power + sympower0;
				end else begin
					a1_power <= a1_power + sympower1;
				end
			end else begin
				if(countsyncsym[0]) begin
					a2_power <= a2_power + sympower0;
				end else begin
					a2_power <= a2_power + sympower1;
				end
			end
		end
	end
	
endmodule

module uwb_re_phr_top
	(
		clk,
		ddpOuten_i_reg,
		ce,
		in_start,	
		in_rst,	
		in_bit,
		coarse_error,
		state,
		countsample,
		countdatasym,
		coarse_off,
		out_check,
		out_sync_mode,
		out_psdu_octets
	);
	
	//parameter DATAIN_WIDTH = 8;
	//parameter SUM_WIDTH = 16;
	
	input clk;
	input ddpOuten_i_reg;
	input ce;
	input in_rst;
	input in_start;
	input in_bit;
	input coarse_error;
	input[2:0] state;
	input[7:0] countsample;
	input[10:0] countdatasym;
	input coarse_off;
	
	output out_check;
	output[1:0] out_sync_mode;
	output[6:0] out_psdu_octets;
	
	
	reg out_check;
	
	reg[18:0] phr;
	wire[5:0] c_check;
	
	wire r1, r0;
	wire l6, l5, l4, l3, l2, l1, l0;
	wire rng, ext;
	wire p1, p0;
	wire c5, c4, c3, c2, c1, c0;
	wire[5:0] c_data;
	wire check_rst;
	
	initial begin
		phr = 0;
		out_check = 0;
	end
	
	assign {c0, c1, c2, c3, c4, c5, p0, p1, ext, rng, l0, l1, l2, l3, l4, l5, l6, r0, r1} = phr;
	
	assign c_data = {phr[13], phr[14], phr[15], phr[16], phr[17], phr[18]};
	
	always@ (posedge clk) begin
		if(in_start && ddpOuten_i_reg) begin
			phr <= {in_bit, phr[18:1]};
		end
	end
	
	xor C0 (c_check[0], r0, r1, l0, l2, l4, l5, ext, p1);
	
	xor C1 (c_check[1], r1, l2, l3, l5, l6, rng, ext, p0);
	
	xor C2 (c_check[2], r0, l0, l1, l5, l6, rng, ext);
	
	xor C3 (c_check[3], l0, l1, l2, l3, l4, rng, ext);
	
	xor C4 (c_check[4], p0, p1);
	
	xor C5 (c_check[5], r0, r1, l5, l6, c3, c4);

	assign check_rst = !in_rst || coarse_error;
	
	always@ (posedge clk or posedge check_rst) begin
		if(check_rst) begin
			out_check <= 0;
		end else if(coarse_off) begin
			if( (state == 3) && (countsample >= 1) && (countdatasym >= 19) && (c_check != c_data) ) 
				out_check <= 1;
			else
				out_check <= 0;
		end else begin
			out_check <= 0;
		end
	end
	  
	//assign out_check = (c_check == c_data) ? 1 : 0;
	
	assign out_sync_mode = {p1, p0};
	
	assign out_psdu_octets = {l6, l5, l4, l3, l2, l1, l0};
	
endmodule
	
module uwb_re_demo
	(
		clk,
		ce,
		start,
		ddph_i,
		data_in, 
		count,
		data_out,
		ddpOuten_o_reg
	);
	
	// Parameter
	
	// Input
	input clk;
	input ce;
	input start;
	input[2:0] ddph_i;
	input[7:0] data_in;
	input[7:0] count;
	
	// Output
	output data_out;
	output ddpOuten_o_reg;
	
	reg ddpOuten_o_reg;
	
	// Wire
	wire sum_en;
	
	assign sum_en = ( ( (count >= 8'd0) && (count <= 8'd15) ) || ( (count >= 8'd32) && (count <= 8'd47) ) ) ? 1'b1 : 1'b0;
	
	reg[15:0] sum;
	reg[15:0] part0;
	reg[15:0] part1;
	reg data_out;
	
	initial begin
		sum = 0;
		part0 = 0;
		part1 = 0;
		data_out = 0;
	end
	
	always@ (posedge clk) begin
		if( sum_en == 1'b1 )
			if( (count == ddph_i*2) || (count == (ddph_i*2+1) ) || (count == (ddph_i*2 + 32) ) || (count == (ddph_i*2 + 33) ) )
			//if( (count == 0) && (count == 1 ) && (count == 32 ) && (count == 33) )
				sum <= sum + data_in;
		else 
			sum <= 0;
	end
	
	always@ (posedge clk) begin
		if(start) begin
			if( count == (ddph_i*2+2) )
				part0 <= sum;
			else if(count == (ddph_i*2+34) ) 
				part1 <= sum;	
		end else begin
			part0 <= 0;
			part1 <= 0;
		end
	end
	
	always@ (posedge clk) begin
		if(start) begin
			if(count == 63) begin
				if(part0 >= part1)
					data_out <= 1'b0;
				else 
					data_out <= 1'b1;
			end 
		end else begin
			data_out <= 0;
		end
	end
	
	always@ (posedge clk) begin
		if(start) begin
			if(count == 63)
				ddpOuten_o_reg <= 1'b1;
			else 
				ddpOuten_o_reg <= 1'b0;
		end else begin
			ddpOuten_o_reg <= 1'b0;
		end
	end
	
	//assign output_en = start ? out_en : 1'd0;
	
	//assign data_out = start ? data_out1 : 1'd0;
	
endmodule

/* module uwb_re_demo_controller
	(
		start,
		count,
		//dcOuten_o_reg,
		s_data
	);
	
	// Input
	input start;
	input[5:0] count;
	
	// Output
	//output dcOuten_o_reg;
	output s_data;
	//output out_en;
	
	// Reg
	//reg[5:0] q;
	
	//reg dcOuten_o_reg;
	reg s_data;
	//reg out_en;
	
	// Behavioral
	initial begin
		s_data = 0;
	end
	
	always@ (count or start) begin
		if(start == 0) begin
			
			s_data = 0;
		end else begin
			// Mem
			
			
			// Data
			if( ( (count >= 6'd0) && (count <= 6'd15) ) || ( (count >= 6'd32) && (count <= 6'd47) ) )
				s_data = 1'b1;
			else
				s_data = 1'b0;
		end
	end 
	
endmodule*/

	



	






	

// Generated from Simulink block "Subsystem2"

(* core_generation_info = "uwb_re_blackbox,sysgen_core,{black_box_isim_used=1,clock_period=20.00000000,clocking=Clock_Enables,compilation=KC705_(JTAG),sample_periods=1.00000000000,testbench=0,total_blocks=2620,xilinx_black_box_block=1,xilinx_gateway_in_block=6,xilinx_gateway_out_block=4,xilinx_system_generator_block=1,}" *)
module subsystem2 (
  ce_1,
  clk_1,
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

  input [0:0] ce_1;
  input [0:0] clk_1;
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

  wire [0:0] ce_1_sg_x0;
  wire [0:0] clk_1_sg_x0;
  wire [0:0] coarse_error_net;
  wire [0:0] coarse_off_net;
  wire [0:0] data_out_net;
  wire [2:0] ddph_i_net;
  wire [7:0] in_data_net;
  wire [0:0] in_rst_net;
  wire [0:0] in_start_net;
  wire [0:0] psdu_en_net;
  wire [31:0] sfd_threshold_net;
  wire [15:0] sm_threshold_net;

  assign ce_1_sg_x0 = ce_1;
  assign clk_1_sg_x0 = clk_1;
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


  uwb_re  black_box (
    .ce(ce_1_sg_x0),
    .clk(clk_1_sg_x0),
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
endmodule

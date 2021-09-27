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

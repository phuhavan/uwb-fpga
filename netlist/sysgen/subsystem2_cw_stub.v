`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module subsystem2_cw_stub
(
  ce,
  clk,// clock period = 20.0 ns (50.0 Mhz)
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
  input  clk;// clock period = 20.0 ns (50.0 Mhz)
  output [0:0] coarse_error;
  output [0:0] coarse_off;
  output [0:0] data_out;
  input [2:0] ddph_i;
  input [7:0] in_data;
  input [0:0] in_rst;
  input [0:0] in_start;
  output [0:0] psdu_en;
  input [31:0] sfd_threshold;
  input [15:0] sm_threshold;

subsystem2_cw subsystem2_cw_i (
  .ce(ce),
  .clk(clk),
  .coarse_error(coarse_error),
  .coarse_off(coarse_off),
  .data_out(data_out),
  .ddph_i(ddph_i),
  .in_data(in_data),
  .in_rst(in_rst),
  .in_start(in_start),
  .psdu_en(psdu_en),
  .sfd_threshold(sfd_threshold),
  .sm_threshold(sm_threshold));

endmodule 

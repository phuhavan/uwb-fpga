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
	

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

	



	






	


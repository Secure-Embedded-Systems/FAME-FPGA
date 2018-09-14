	/////////////////////////////////////////////////////////////////////
	////                                                             ////
	////  AES Cipher Top Level                                       ////
	////                                                             ////
	////                                                             ////
	////  Author: Rudolf Usselmann                                   ////
	////          rudi@asics.ws                                      ////
	////                                                             ////
	////                                                             ////
	////  Downloaded from: http://www.opencores.org/cores/aes_core/  ////
	////                                                             ////
	/////////////////////////////////////////////////////////////////////
	////                                                             ////
	//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
	////                         www.asics.ws                        ////
	////                         rudi@asics.ws                       ////
	////                                                             ////
	//// This source file may be used and distributed without        ////
	//// restriction provided that this copyright statement is not   ////
	//// removed from the file and that any derivative work contains ////
	//// the original copyright notice and the associated disclaimer.////
	////                                                             ////
	////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
	//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
	//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
	//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
	//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
	//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
	//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
	//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
	//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
	//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
	//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
	//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
	//// POSSIBILITY OF SUCH DAMAGE.                                 ////
	////                                                             ////
	/////////////////////////////////////////////////////////////////////

	//  CVS Log
	//
	//  $Id: aes_cipher_top.v,v 1.1.1.1 2002-11-09 11:22:48 rudi Exp $
	//
	//  $Date: 2002-11-09 11:22:48 $
	//  $Revision: 1.1.1.1 $
	//  $Author: rudi $
	//  $Locker:  $
	//  $State: Exp $
	//
	// Change History:
	//               $Log: not supported by cvs2svn $
	//
	//
	//
	//
	//


	module aes_cipher_top_em(clk, rst, ld, done, key, text_in, text_out, alarm );
	input		clk, rst;
	input		ld;
	output		done;
	input	[127:0]	key;
	input	[127:0]	text_in;
	output	[127:0]	text_out;
	wire 	[31:0] alarm_key, alarm_rs;
	output [63:0] alarm;

	assign alarm_key[31:16] = 16'b0;
	assign alarm = {alarm_key, alarm_rs};


	////////////////////////////////////////////////////////////////////
	//
	// Local Wires
	//

	wire	[31:0]	w0, w1, w2, w3;
	reg	[127:0]	text_in_r;
	wire	[127:0]	text_out;
	wire 	[127:0] text_out_comb;
	wire 	[15:0]  alarm_text, alarm_sa;
	wire	[7:0]	sa00, sa01, sa02, sa03;
	wire	[7:0]	sa10, sa11, sa12, sa13;
	wire 	[7:0]	sa20, sa21, sa22, sa23;
	wire	[7:0]	sa30, sa31, sa32, sa33;
	wire	[7:0]	sa00_next, sa01_next, sa02_next, sa03_next;
	wire	[7:0]	sa10_next, sa11_next, sa12_next, sa13_next;
	wire	[7:0]	sa20_next, sa21_next, sa22_next, sa23_next;
	wire	[7:0]	sa30_next, sa31_next, sa32_next, sa33_next;
	wire	[7:0]	sa00_sub, sa01_sub, sa02_sub, sa03_sub;
	wire	[7:0]	sa10_sub, sa11_sub, sa12_sub, sa13_sub;
	wire	[7:0]	sa20_sub, sa21_sub, sa22_sub, sa23_sub;
	wire	[7:0]	sa30_sub, sa31_sub, sa32_sub, sa33_sub;
	wire	[7:0]	sa00_sr, sa01_sr, sa02_sr, sa03_sr;
	wire	[7:0]	sa10_sr, sa11_sr, sa12_sr, sa13_sr;
	wire	[7:0]	sa20_sr, sa21_sr, sa22_sr, sa23_sr;
	wire	[7:0]	sa30_sr, sa31_sr, sa32_sr, sa33_sr;
	wire	[7:0]	sa00_mc, sa01_mc, sa02_mc, sa03_mc;
	wire	[7:0]	sa10_mc, sa11_mc, sa12_mc, sa13_mc;
	wire	[7:0]	sa20_mc, sa21_mc, sa22_mc, sa23_mc;
	wire	[7:0]	sa30_mc, sa31_mc, sa32_mc, sa33_mc;
	reg		done, ld_r;
	reg	[3:0]	dcnt;


	wire	[7:0]	sa00_comb, sa01_comb, sa02_comb, sa03_comb;
	wire	[7:0]	sa10_comb, sa11_comb, sa12_comb, sa13_comb;
	wire	[7:0]	sa20_comb, sa21_comb, sa22_comb, sa23_comb;
	wire	[7:0]	sa30_comb, sa31_comb, sa32_comb, sa33_comb;

	wire alarm_sa00, alarm_sa01, alarm_sa02, alarm_sa03;
	wire alarm_sa10, alarm_sa11, alarm_sa12, alarm_sa13;
	wire alarm_sa20, alarm_sa21, alarm_sa22, alarm_sa23;
	wire alarm_sa30, alarm_sa31, alarm_sa32, alarm_sa33;


	///////////////////////////////////////////////////////////////`////
	reg [2:0] cnt;

	always @(posedge clk) begin
		if (done) begin
			cnt <= 3'd3;
		end else if (cnt == 3'd0) begin
			cnt <= 3'd0;
		end else begin
			cnt <= cnt - 1'b1;
		end
	end

	////////////////////////////////////////////////////////////////`////
	//
	// Misc Logic
	//

	always @(posedge clk)
		if(!rst)	dcnt <= #1 4'h0;
		else
		if(ld)		dcnt <= #1 4'hb;
		else
		if(|dcnt)	dcnt <= #1 dcnt - 4'h1;

	always @(posedge clk) done <= !(|dcnt[3:1]) & dcnt[0] & !ld;
	always @(posedge clk) if(ld) text_in_r <= #1 text_in;
	always @(posedge clk) ld_r <= ld;

	////////////////////////////////////////////////////////////////////
	//
	// Initial Permutation (AddRoundKey)
	//
	/*
	always @(posedge clk)	sa33 <= #1 ld_r ? text_in_r[007:000] ^ w3[07:00] : sa33_next;
	always @(posedge clk)	sa23 <= #1 ld_r ? text_in_r[015:008] ^ w3[15:08] : sa23_next;
	always @(posedge clk)	sa13 <= #1 ld_r ? text_in_r[023:016] ^ w3[23:16] : sa13_next;
	always @(posedge clk)	sa03 <= #1 ld_r ? text_in_r[031:024] ^ w3[31:24] : sa03_next;
	always @(posedge clk)	sa32 <= #1 ld_r ? text_in_r[039:032] ^ w2[07:00] : sa32_next;
	always @(posedge clk)	sa22 <= #1 ld_r ? text_in_r[047:040] ^ w2[15:08] : sa22_next;
	always @(posedge clk)	sa12 <= #1 ld_r ? text_in_r[055:048] ^ w2[23:16] : sa12_next;
	always @(posedge clk)	sa02 <= #1 ld_r ? text_in_r[063:056] ^ w2[31:24] : sa02_next;
	always @(posedge clk)	sa31 <= #1 ld_r ? text_in_r[071:064] ^ w1[07:00] : sa31_next;
	always @(posedge clk)	sa21 <= #1 ld_r ? text_in_r[079:072] ^ w1[15:08] : sa21_next;
	always @(posedge clk)	sa11 <= #1 ld_r ? text_in_r[087:080] ^ w1[23:16] : sa11_next;
	always @(posedge clk)	sa01 <= #1 ld_r ? text_in_r[095:088] ^ w1[31:24] : sa01_next;
	always @(posedge clk)	sa30 <= #1 ld_r ? text_in_r[103:096] ^ w0[07:00] : sa30_next;
	always @(posedge clk)	sa20 <= #1 ld_r ? text_in_r[111:104] ^ w0[15:08] : sa20_next;
	always @(posedge clk)	sa10 <= #1 ld_r ? text_in_r[119:112] ^ w0[23:16] : sa10_next;
	always @(posedge clk)	sa00 <= #1 ld_r ? text_in_r[127:120] ^ w0[31:24] : sa00_next;
	*/

	assign	sa33_comb =  ld_r ? text_in_r[007:000] ^ w3[07:00] : sa33_next;
	assign	sa23_comb =  ld_r ? text_in_r[015:008] ^ w3[15:08] : sa23_next;
	assign	sa13_comb =  ld_r ? text_in_r[023:016] ^ w3[23:16] : sa13_next;
	assign	sa03_comb =  ld_r ? text_in_r[031:024] ^ w3[31:24] : sa03_next;
	assign	sa32_comb =  ld_r ? text_in_r[039:032] ^ w2[07:00] : sa32_next;
	assign	sa22_comb =  ld_r ? text_in_r[047:040] ^ w2[15:08] : sa22_next;
	assign	sa12_comb =  ld_r ? text_in_r[055:048] ^ w2[23:16] : sa12_next;
	assign	sa02_comb =  ld_r ? text_in_r[063:056] ^ w2[31:24] : sa02_next;
	assign	sa31_comb =  ld_r ? text_in_r[071:064] ^ w1[07:00] : sa31_next;
	assign	sa21_comb =  ld_r ? text_in_r[079:072] ^ w1[15:08] : sa21_next;
	assign	sa11_comb =  ld_r ? text_in_r[087:080] ^ w1[23:16] : sa11_next;
	assign	sa01_comb =  ld_r ? text_in_r[095:088] ^ w1[31:24] : sa01_next;
	assign	sa30_comb =  ld_r ? text_in_r[103:096] ^ w0[07:00] : sa30_next;
	assign	sa20_comb =  ld_r ? text_in_r[111:104] ^ w0[15:08] : sa20_next;
	assign	sa10_comb =  ld_r ? text_in_r[119:112] ^ w0[23:16] : sa10_next;
	assign	sa00_comb =  ld_r ? text_in_r[127:120] ^ w0[31:24] : sa00_next;

	aes_sensor sas00 (sa00_comb, clk, sa00, alarm_sa00);
	aes_sensor sas10 (sa10_comb, clk, sa10, alarm_sa10);
	aes_sensor sas20 (sa20_comb, clk, sa20, alarm_sa20);
	aes_sensor sas30 (sa30_comb, clk, sa30, alarm_sa30);

	aes_sensor sas01 (sa01_comb, clk, sa01, alarm_sa01);
	aes_sensor sas11 (sa11_comb, clk, sa11, alarm_sa11);
	aes_sensor sas21 (sa21_comb, clk, sa21, alarm_sa21);
	aes_sensor sas31 (sa31_comb, clk, sa31, alarm_sa31);

	aes_sensor sas02 (sa02_comb, clk, sa02, alarm_sa02);
	aes_sensor sas12 (sa12_comb, clk, sa12, alarm_sa12);
	aes_sensor sas22 (sa22_comb, clk, sa22, alarm_sa22);
	aes_sensor sas32 (sa32_comb, clk, sa32, alarm_sa32);

	aes_sensor sas03 (sa03_comb, clk, sa03, alarm_sa03);
	aes_sensor sas13 (sa13_comb, clk, sa13, alarm_sa13);
	aes_sensor sas23 (sa23_comb, clk, sa23, alarm_sa23);
	aes_sensor sas33 (sa33_comb, clk, sa33, alarm_sa33);

	assign alarm_sa[15:0] = {alarm_sa00, alarm_sa10, alarm_sa20, alarm_sa30, 
							 alarm_sa01, alarm_sa11, alarm_sa21, alarm_sa31,
							 alarm_sa02, alarm_sa12, alarm_sa22, alarm_sa32, 
							 alarm_sa03, alarm_sa13, alarm_sa23, alarm_sa33};


	////////////////////////////////////////////////////////////////////
	//
	// Round Permutations
	//

	assign sa00_sr = sa00_sub;
	assign sa01_sr = sa01_sub;
	assign sa02_sr = sa02_sub;
	assign sa03_sr = sa03_sub;
	assign sa10_sr = sa11_sub;
	assign sa11_sr = sa12_sub;
	assign sa12_sr = sa13_sub;
	assign sa13_sr = sa10_sub;
	assign sa20_sr = sa22_sub;
	assign sa21_sr = sa23_sub;
	assign sa22_sr = sa20_sub;
	assign sa23_sr = sa21_sub;
	assign sa30_sr = sa33_sub;
	assign sa31_sr = sa30_sub;
	assign sa32_sr = sa31_sub;
	assign sa33_sr = sa32_sub;
	assign {sa00_mc, sa10_mc, sa20_mc, sa30_mc}  = mix_col(sa00_sr,sa10_sr,sa20_sr,sa30_sr);
	assign {sa01_mc, sa11_mc, sa21_mc, sa31_mc}  = mix_col(sa01_sr,sa11_sr,sa21_sr,sa31_sr);
	assign {sa02_mc, sa12_mc, sa22_mc, sa32_mc}  = mix_col(sa02_sr,sa12_sr,sa22_sr,sa32_sr);
	assign {sa03_mc, sa13_mc, sa23_mc, sa33_mc}  = mix_col(sa03_sr,sa13_sr,sa23_sr,sa33_sr);
	assign sa00_next = sa00_mc ^ w0[31:24];
	assign sa01_next = sa01_mc ^ w1[31:24];
	assign sa02_next = sa02_mc ^ w2[31:24];
	assign sa03_next = sa03_mc ^ w3[31:24];
	assign sa10_next = sa10_mc ^ w0[23:16];
	assign sa11_next = sa11_mc ^ w1[23:16];
	assign sa12_next = sa12_mc ^ w2[23:16];
	assign sa13_next = sa13_mc ^ w3[23:16];
	assign sa20_next = sa20_mc ^ w0[15:08];
	assign sa21_next = sa21_mc ^ w1[15:08];
	assign sa22_next = sa22_mc ^ w2[15:08];
	assign sa23_next = sa23_mc ^ w3[15:08];
	assign sa30_next = sa30_mc ^ w0[07:00];
	assign sa31_next = sa31_mc ^ w1[07:00];
	assign sa32_next = sa32_mc ^ w2[07:00];
	assign sa33_next = sa33_mc ^ w3[07:00];

	////////////////////////////////////////////////////////////////////
	//
	// Final text output
	//

	/*

	always @(posedge clk) text_out[127:120] <= #1 sa00_sr ^ w0[31:24];
	always @(posedge clk) text_out[095:088] <= #1 sa01_sr ^ w1[31:24];
	always @(posedge clk) text_out[063:056] <= #1 sa02_sr ^ w2[31:24];
	always @(posedge clk) text_out[031:024] <= #1 sa03_sr ^ w3[31:24];
	always @(posedge clk) text_out[119:112] <= #1 sa10_sr ^ w0[23:16];
	always @(posedge clk) text_out[087:080] <= #1 sa11_sr ^ w1[23:16];
	always @(posedge clk) text_out[055:048] <= #1 sa12_sr ^ w2[23:16];
	always @(posedge clk) text_out[023:016] <= #1 sa13_sr ^ w3[23:16];
	always @(posedge clk) text_out[111:104] <= #1 sa20_sr ^ w0[15:08];
	always @(posedge clk) text_out[079:072] <= #1 sa21_sr ^ w1[15:08];
	always @(posedge clk) text_out[047:040] <= #1 sa22_sr ^ w2[15:08];
	always @(posedge clk) text_out[015:008] <= #1 sa23_sr ^ w3[15:08];
	always @(posedge clk) text_out[103:096] <= #1 sa30_sr ^ w0[07:00];
	always @(posedge clk) text_out[071:064] <= #1 sa31_sr ^ w1[07:00];
	always @(posedge clk) text_out[039:032] <= #1 sa32_sr ^ w2[07:00];
	always @(posedge clk) text_out[007:000] <= #1 sa33_sr ^ w3[07:00];
	*/

	assign text_out_comb[127:120] = sa00_sr ^ w0[31:24];
	assign text_out_comb[095:088] = sa01_sr ^ w1[31:24];
	assign text_out_comb[063:056] = sa02_sr ^ w2[31:24];
	assign text_out_comb[031:024] = sa03_sr ^ w3[31:24];
	assign text_out_comb[119:112] = sa10_sr ^ w0[23:16];
	assign text_out_comb[087:080] = sa11_sr ^ w1[23:16];
	assign text_out_comb[055:048] = sa12_sr ^ w2[23:16];
	assign text_out_comb[023:016] = sa13_sr ^ w3[23:16];
	assign text_out_comb[111:104] = sa20_sr ^ w0[15:08];
	assign text_out_comb[079:072] = sa21_sr ^ w1[15:08];
	assign text_out_comb[047:040] = sa22_sr ^ w2[15:08];
	assign text_out_comb[015:008] = sa23_sr ^ w3[15:08];
	assign text_out_comb[103:096] = sa30_sr ^ w0[07:00];
	assign text_out_comb[071:064] = sa31_sr ^ w1[07:00];
	assign text_out_comb[039:032] = sa32_sr ^ w2[07:00];
	assign text_out_comb[007:000] = sa33_sr ^ w3[07:00];

	aes_sensor text00 (text_out_comb[007:000], clk, text_out[007:000], alarm_text[0]);
	aes_sensor text01 (text_out_comb[015:008], clk, text_out[015:008], alarm_text[1]);
	aes_sensor text02 (text_out_comb[023:016], clk, text_out[023:016], alarm_text[2]);
	aes_sensor text03 (text_out_comb[031:024], clk, text_out[031:024], alarm_text[3]);

	aes_sensor text10 (text_out_comb[039:032], clk, text_out[039:032], alarm_text[4]);
	aes_sensor text11 (text_out_comb[047:040], clk, text_out[047:040], alarm_text[5]);
	aes_sensor text12 (text_out_comb[055:048], clk, text_out[055:048], alarm_text[6]);
	aes_sensor text13 (text_out_comb[063:056], clk, text_out[063:056], alarm_text[7]);

	aes_sensor text20 (text_out_comb[071:064], clk, text_out[071:064], alarm_text[8]);
	aes_sensor text21 (text_out_comb[079:072], clk, text_out[079:072], alarm_text[9]);
	aes_sensor text22 (text_out_comb[087:080], clk, text_out[087:080], alarm_text[10]);
	aes_sensor text23 (text_out_comb[095:088], clk, text_out[095:088], alarm_text[11]);

	aes_sensor text30 (text_out_comb[103:096], clk, text_out[103:096], alarm_text[12]);
	aes_sensor text31 (text_out_comb[111:104], clk, text_out[111:104], alarm_text[13]);
	aes_sensor text32 (text_out_comb[119:112], clk, text_out[119:112], alarm_text[14]);
	aes_sensor text33 (text_out_comb[127:120], clk, text_out[127:120], alarm_text[15]);

	assign alarm_rs = {alarm_text[15:0], alarm_sa[15:0]};


	////////////////////////////////////////////////////////////////////
	//
	// Generic Functions
	//

	function [31:0] mix_col;
	input	[7:0]	s0,s1,s2,s3;
	reg	[7:0]	s0_o,s1_o,s2_o,s3_o;
	begin
	mix_col[31:24]=xtime(s0)^xtime(s1)^s1^s2^s3;
	mix_col[23:16]=s0^xtime(s1)^xtime(s2)^s2^s3;
	mix_col[15:08]=s0^s1^xtime(s2)^xtime(s3)^s3;
	mix_col[07:00]=xtime(s0)^s0^s1^s2^xtime(s3);
	end
	endfunction

	function [7:0] xtime;
	input [7:0] b; xtime={b[6:0],1'b0}^(8'h1b&{8{b[7]}});
	endfunction

	////////////////////////////////////////////////////////////////////
	//
	// Modules
	//

aes_key_expand_128_em u0(
		.clk(		clk	),
		.kld(		ld	),
		.key(		key	),
		.wo_0(		w0	),
		.wo_1(		w1	),
		.wo_2(		w2	),
		.wo_3(		w3	),
		.alarm_w(alarm_key[15:0])
		);

	aes_sbox_em us00(	.a(	sa00	), .d(	sa00_sub	));
	aes_sbox_em us01(	.a(	sa01	), .d(	sa01_sub	));
	aes_sbox_em us02(	.a(	sa02	), .d(	sa02_sub	));
	aes_sbox_em us03(	.a(	sa03	), .d(	sa03_sub	));
	aes_sbox_em us10(	.a(	sa10	), .d(	sa10_sub	));
	aes_sbox_em us11(	.a(	sa11	), .d(	sa11_sub	));
	aes_sbox_em us12(	.a(	sa12	), .d(	sa12_sub	));
	aes_sbox_em us13(	.a(	sa13	), .d(	sa13_sub	));
	aes_sbox_em us20(	.a(	sa20	), .d(	sa20_sub	));
	aes_sbox_em us21(	.a(	sa21	), .d(	sa21_sub	));
	aes_sbox_em us22(	.a(	sa22	), .d(	sa22_sub	));
	aes_sbox_em us23(	.a(	sa23	), .d(	sa23_sub	));
	aes_sbox_em us30(	.a(	sa30	), .d(	sa30_sub	));
	aes_sbox_em us31(	.a(	sa31	), .d(	sa31_sub	));
	aes_sbox_em us32(	.a(	sa32	), .d(	sa32_sub	));
	aes_sbox_em us33(	.a(	sa33	), .d(	sa33_sub	));

	endmodule



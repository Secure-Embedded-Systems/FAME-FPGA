/////////////////////////////////////////////////////////////////////
////                                                             ////
////  AES Key Expand Block (for 128 bit keys)                    ////
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
//  $Id: aes_key_expand_128.v,v 1.1.1.1 2002-11-09 11:22:38 rudi Exp $
//
//  $Date: 2002-11-09 11:22:38 $
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


module aes_key_expand_128_em(clk, kld, key, wo_0, wo_1, wo_2, wo_3, alarm_w);
input		clk;
input		kld;
input	[127:0]	key;
output	[31:0]	wo_0, wo_1, wo_2, wo_3;
wire	[31:0]	w[3:0];
wire 	[31:0]  w_comb[3:0];
output wire  [15:0]  alarm_w;
wire	[31:0]	tmp_w;
wire	[31:0]	subword;
wire	[31:0]	rcon;

assign wo_0 = w[0];
assign wo_1 = w[1];
assign wo_2 = w[2];
assign wo_3 = w[3];

/*
always @(posedge clk)	w[0] <= #1 kld ? key[127:096] : w[0]^subword^rcon;
always @(posedge clk)	w[1] <= #1 kld ? key[095:064] : w[0]^w[1]^subword^rcon;
always @(posedge clk)	w[2] <= #1 kld ? key[063:032] : w[0]^w[2]^w[1]^subword^rcon;
always @(posedge clk)	w[3] <= #1 kld ? key[031:000] : w[0]^w[3]^w[2]^w[1]^subword^rcon;
*/

assign	w_comb[0] = kld ? key[127:096] : w[0]^subword^rcon;
assign	w_comb[1] = kld ? key[095:064] : w[0]^w[1]^subword^rcon;
assign	w_comb[2] = kld ? key[063:032] : w[0]^w[2]^w[1]^subword^rcon;
assign	w_comb[3] = kld ? key[031:000] : w[0]^w[3]^w[2]^w[1]^subword^rcon;

aes_sensor_32 w0 (w_comb[0], clk, w[0], alarm_w[3:0]);
aes_sensor_32 w1 (w_comb[1], clk, w[1], alarm_w[7:4]);
aes_sensor_32 w2 (w_comb[2], clk, w[2], alarm_w[11:8]);
aes_sensor_32 w3 (w_comb[3], clk, w[3], alarm_w[15:12]);

assign tmp_w = w[3];
aes_sbox_em u0(	.a(tmp_w[23:16]), .d(subword[31:24]));
aes_sbox_em u1(	.a(tmp_w[15:08]), .d(subword[23:16]));
aes_sbox_em u2(	.a(tmp_w[07:00]), .d(subword[15:08]));
aes_sbox_em u3(	.a(tmp_w[31:24]), .d(subword[07:00]));
aes_rcon_em r0(	.clk(clk), .kld(kld), .out(rcon));
endmodule


void gcdtop(unsigned a3,
            unsigned a2,
            unsigned a1,
            unsigned a0,
            unsigned b3,
            unsigned b2,
            unsigned b1,
            unsigned b0,
            unsigned start,
	    unsigned rst,
            unsigned *q3,
            unsigned *q2,
            unsigned *q1,
            unsigned *q0,
            unsigned *done) {
  
  // wires that are not flop outputs
  unsigned
    n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
    n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
    n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
    n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
    n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
    n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
    n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
    n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
    n197, n198, n208;

  // flop outputs
  static unsigned n199, n200, n201, n202, n203, n204, n205, n206, n207;
    
  //  GTECH_NOT U111 ( .A(rst), .Z(n208) );  
  n208 = ~rst;
  
  // GTECH_NOT U199 ( .A(n205), .Z(n154) );
  n154 = ~n205;
  
  // GTECH_AND2 U184 ( .A(n206), .B(n154), .Z(n141) );
  n141 = n206 & n154;
  
  // GTECH_NOT U125 ( .A(n141), .Z(n140) );
  n140 = ~n141;
  
  // GTECH_NOT U201 ( .A(n203), .Z(n198) );
  n198 = ~n203;
  
  // GTECH_OR2 U196 ( .A(n198), .B(n204), .Z(n139) );
  n139 = n198 | n204;
  
  // GTECH_NAND2 U124 ( .A(n139), .B(n140), .Z(n137) );
  n137 = ~(n139 & n140);
  
  // GTECH_NAND2 U200 ( .A(n204), .B(n198), .Z(n138) );
  n138 = ~(n204 & n198);
  
  // GTECH_AND2 U123 ( .A(n137), .B(n138), .Z(n128) );
  n128 = n137 & n138;
  
  // GTECH_NOT U188 ( .A(n207), .Z(n181) );
  n181 = ~n207;
  
  // GTECH_NAND2 U187 ( .A(start), .B(n181), .Z(n153) );
  n153 = ~(n181 & start);
  
  // GTECH_NOT U179 ( .A(n200), .Z(n187) );
  n187 = ~n200;
  
  // GTECH_NAND2 U178 ( .A(n201), .B(n187), .Z(n189) );
  n189 = ~(n201 & n187);
  
  // GTECH_NAND2 U183 ( .A(n141), .B(n138), .Z(n192) );
  n192 = ~(n141 & n138);
  
  // GTECH_NAND2 U182 ( .A(n139), .B(n192), .Z(n191) );
  n191 = ~(n139 & n192);
  
  // GTECH_NOT U194 ( .A(n202), .Z(n196) );
  n196 = ~n202;
  
  // GTECH_NAND2 U191 ( .A(n199), .B(n196), .Z(n129) );
  n129 = ~(n199 & n196);
  
  // GTECH_NAND2 U181 ( .A(n191), .B(n129), .Z(n190) );
  n190 = ~(n191 & n129);
  
  // GTECH_OR2 U193 ( .A(n196), .B(n199), .Z(n127) );
  n127 = n199 | n196;
  
  // GTECH_AND2 U180 ( .A(n190), .B(n127), .Z(n188) );
  n188 = n190 & n127;
  
  // GTECH_AND2 U177 ( .A(n188), .B(n189), .Z(n186) );
  n186 = n188 & n189;
  
  // GTECH_NOR2 U176 ( .A(n187), .B(n201), .Z(n185) );
  n185 = ~(n187 | n201);
  
  // GTECH_NOR2 U175 ( .A(n186), .B(n185), .Z(n156) );
  n156 = ~(n186 | n185);
  
  // GTECH_NAND2 U140 ( .A(n156), .B(n153), .Z(n155) );
  n155 = ~(n153 & n156);
  
  // GTECH_OR2 U198 ( .A(n154), .B(n206), .Z(n169) );
  n169 = n154 | n206;
  
  // GTECH_AND2 U173 ( .A(n169), .B(n138), .Z(n184) );
  n184 = n169 & n138;
  
  // GTECH_AND2 U172 ( .A(n184), .B(n129), .Z(n183) );
  n183 = n184 & n129;
  
  // GTECH_NOR2 U174 ( .A(n156), .B(n185), .Z(n182) );
  n182 = ~(n156 | n185);
  
  // GTECH_AND2 U171 ( .A(n182), .B(n183), .Z(n118) );
  n118 = n182 & n183;
  
  // GTECH_XOR2 U189 ( .A(n200), .B(n201), .Z(n194) );
  n194 = n201 ^ n200;
  
  // GTECH_AND2 U186 ( .A(n194), .B(n153), .Z(n125) );
  n125 = n153 & n194;
  
  // GTECH_OR2 U170 ( .A(n181), .B(n118), .Z(n180) );
  n180 = n118 | n181;
  
  // GTECH_NAND2 U169 ( .A(n153), .B(n180), .Z(n117) );
  n117 = ~(n180 & n153);
  
  // GTECH_AND2 U139 ( .A(n117), .B(n155), .Z(n148) );
  n148 = n117 & n155;
  
  // GTECH_NOT U133 ( .A(n148), .Z(n123) );
  n123 = ~n148;
  
  // GTECH_NAND2 U117 ( .A(n128), .B(n129), .Z(n126) );
  n126 = ~(n129 & n128);
  
  // GTECH_AND2 U116 ( .A(n126), .B(n127), .Z(n124) );
  n124 = n127 & n126;
  
  // GTECH_AND2 U115 ( .A(n124), .B(n125), .Z(n122) );
  n122 = n124 & n125;
  
  // GTECH_MUX2 U114 ( .A(n122), .B(n200), .S(n123), .Z(n119) );
  n119 = (n123 & n200) | (~n123 & n122);
  
  // GTECH_NOT U168 ( .A(n153), .Z(n121) );
  n121 = ~n153;
  
  // GTECH_AND2 U113 ( .A(b[3]), .B(n121), .Z(n120) );
  n120 = b3 & n121;
  
  // GTECH_OR2 U112 ( .A(n119), .B(n120), .Z(n116) );
  n116 = n119 | n120;
  
  // GTECH_NAND2 U126 ( .A(n199), .B(n123), .Z(n132) );
  n132 = ~(n199 & n123);
    
  // GTECH_AND2 U137 ( .A(n148), .B(n153), .Z(n135) );
  n135 = n148 & n153;
  
  // GTECH_NAND2 U161 ( .A(n129), .B(n127), .Z(n136) );
  n136 = ~(n129 & n127);
  
  // GTECH_XOR2 U122 ( .A(n136), .B(n128), .Z(n134) );
  n134 = n136 ^ n128;
  
  // GTECH_NAND2 U121 ( .A(n134), .B(n135), .Z(n133) );
  n133 = ~(n134 & n135);
  
  // GTECH_AND2 U120 ( .A(n132), .B(n133), .Z(n130) );
  n130 = n132 & n133;
  
  // GTECH_NAND2 U119 ( .A(b[2]), .B(n121), .Z(n131) );
  n131 = ~(b2 & n121);
  
  // GTECH_NAND2 U118 ( .A(n130), .B(n131), .Z(n115) );
  n115 = ~(n131 & n130);
  
  // GTECH_NAND2 U132 ( .A(n204), .B(n123), .Z(n144) );
  n144 = ~(n123 & n204);
  
  // GTECH_NAND2 U153 ( .A(n138), .B(n139), .Z(n147) );
  n147 = ~(n138 & n139);
  
  // GTECH_XOR2 U131 ( .A(n147), .B(n141), .Z(n146) );
  n146 = n147 ^ n141;
  
  // GTECH_NAND2 U130 ( .A(n146), .B(n135), .Z(n145) );
  n145 = ~(n146 & n135);
  
  // GTECH_AND2 U129 ( .A(n144), .B(n145), .Z(n142) );
  n142 = n144 & n145;
  
  // GTECH_NAND2 U128 ( .A(b[1]), .B(n121), .Z(n143) );
  n143 = ~(b1 & n121);
  
  // GTECH_NAND2 U127 ( .A(n142), .B(n143), .Z(n114) );
  n114 = ~(n142 & n143);
  
  // GTECH_NOT U152 ( .A(n169), .Z(n157) );
  n157 = ~n169;
  
  // GTECH_MUX2 U141 ( .A(n157), .B(b[0]), .S(n121), .Z(n149) );
  n149 = (n121 & b0) | (~n121 & n157);
  
  // GTECH_OR2 U138 ( .A(n154), .B(n148), .Z(n151) );
  n151 = n154 | n148;
  
  // GTECH_NAND2 U136 ( .A(n135), .B(n141), .Z(n152) );
  n152 = ~(n135 & n141);
  
  // GTECH_NAND2 U135 ( .A(n151), .B(n152), .Z(n150) );
  n150 = ~(n151 & n152);
  
  // GTECH_OR2 U134 ( .A(n149), .B(n150), .Z(n113) );
  n113 = n149 | n150;
  
  // GTECH_OR2 U167 ( .A(n156), .B(n121), .Z(n179) );
  n179 = n156 | n121;
  
  // GTECH_NAND2 U166 ( .A(n117), .B(n179), .Z(n163) );
  n163 = ~(n117 & n179);
  
  // GTECH_NOR2 U159 ( .A(n163), .B(n121), .Z(n162) );
  n162 = ~(n163 | n121);
  
  // GTECH_MUX2 U146 ( .A(n141), .B(a[0]), .S(n121), .Z(n158) );
  n158 = (n121 & a0) | (~n121 & n141);
  
  // GTECH_NAND2 U144 ( .A(n162), .B(n157), .Z(n161) );
  n161 = ~(n162 & n157);
  
  // GTECH_NAND2 U145 ( .A(n206), .B(n163), .Z(n160) );
  n160 = ~(n206 & n163);
  
  // GTECH_NAND2 U143 ( .A(n160), .B(n161), .Z(n159) );
  n159 = ~(n160 & n161);
  
  // GTECH_OR2 U142 ( .A(n158), .B(n159), .Z(n112) );
  n112 = n158 | n159;
  
  // GTECH_NAND2 U154 ( .A(n203), .B(n163), .Z(n166) );
  n166 = ~(n203 & n163);
  
  // GTECH_XOR2 U151 ( .A(n147), .B(n157), .Z(n168) );
  n168 = (n147 ^ n157);
  
  // GTECH_NAND2 U150 ( .A(n168), .B(n162), .Z(n167) );
  n167 = ~(n168 & n162);
  
  // GTECH_AND2 U149 ( .A(n166), .B(n167), .Z(n164) );
  n164 = n166 & n167;
  
  // GTECH_NAND2 U148 ( .A(a[1]), .B(n121), .Z(n165) );
  n165 = ~(a1 & n121);
  
  // GTECH_NAND2 U147 ( .A(n164), .B(n165), .Z(n111) );
  n111 = ~(n164 & n165);
  
  // GTECH_NAND2 U156 ( .A(a[2]), .B(n121), .Z(n171) );
  n171 = ~(a2 & n121);
  
  // GTECH_NAND2 U197 ( .A(n138), .B(n169), .Z(n197) );
  n197 = ~(n138 & n169);
  
  // GTECH_AND2 U195 ( .A(n197), .B(n139), .Z(n175) );
  n175 = n197 & n139;
  
  // GTECH_XOR2 U160 ( .A(n136), .B(n175), .Z(n174) );
  n174 = n136 ^ n175;
  
  // GTECH_NAND2 U158 ( .A(n174), .B(n162), .Z(n173) );
  n173 = ~(n174 & n162);
  
  // GTECH_NAND2 U162 ( .A(n202), .B(n163), .Z(n172) );
  n172 = ~(n202 & n163);
  
  // GTECH_AND2 U157 ( .A(n172), .B(n173), .Z(n170) );
  n170 = n172 & n173;
  
  // GTECH_NAND2 U155 ( .A(n170), .B(n171), .Z(n110) );
  n110 = ~(n170 & n171);
  
  // GTECH_AND2 U164 ( .A(a[3]), .B(n121), .Z(n177) );
  n177 = a3 & n121;
  
  // GTECH_NAND2 U192 ( .A(n175), .B(n127), .Z(n195) );
  n195 = ~(n175 & n127);
  
  // GTECH_AND2 U190 ( .A(n195), .B(n129), .Z(n193) );
  n193 = n195 & n129;
  
  // GTECH_AND2 U185 ( .A(n193), .B(n125), .Z(n178) );
  n178 = n193 & n125;
  
  // GTECH_MUX2 U165 ( .A(n178), .B(n201), .S(n163), .Z(n176) );
  n176 = (n163 & n201) | (~n163 & n178);
  
  // GTECH_OR2 U163 ( .A(n176), .B(n177), .Z(n109) );
  n109 = n176 | n177;
  
  // GTECH_NOR2 U202 ( .A(n207), .B(start), .Z(done) );
  *done = ~(n207 | start);
  
  // GTECH_AND2 U107 ( .A(n118), .B(n201), .Z(q[3]) );
  *q3 = n118 & n201;
  
  // GTECH_AND2 U108 ( .A(n118), .B(n202), .Z(q[2]) );
  *q2 = n118 & n202;
  
  // GTECH_AND2 U109 ( .A(n118), .B(n203), .Z(q[1]) );
  *q1 = n118 & n203;
  
  // GTECH_AND2 U110 ( .A(n118), .B(n206), .Z(q[0]) );
  *q0 = n118 & n206;

  static unsigned cycle = 0;
  
/*
  printf("C CYCLE %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x\n", 
	 cycle++, n109&1, n110&1, n111&1, n112&1, n113&1, n114&1, n115&1, n116&1, n117&1, n118&1, n119&1,
	 n120&1, n121&1, n122&1, n123&1, n124&1, n125&1, n126&1, n127&1, n128&1, n129&1, n130&1,
	 n131&1, n132&1, n133&1, n134&1, n135&1, n136&1, n137&1, n138&1, n139&1, n140&1, n141&1,
	 n142&1, n143&1, n144&1, n145&1, n146&1, n147&1, n148&1, n149&1, n150&1, n151&1, n152&1,
	 n153&1, n154&1, n155&1, n156&1, n157&1, n158&1, n159&1, n160&1, n161&1, n162&1, n163&1,
	 n164&1, n165&1, n166&1, n167&1, n168&1, n169&1, n170&1, n171&1, n172&1, n173&1, n174&1,
	 n175&1, n176&1, n177&1, n178&1, n179&1, n180&1, n181&1, n182&1, n183&1, n184&1, n185&1,
	 n186&1, n187&1, n188&1, n189&1, n190&1, n191&1, n192&1, n193&1, n194&1, n195&1, n196&1,
	 n197&1, n198&1, n208&1);
*/

  // GTECH_FD2 \CTL/state_reg  ( .D(n117), .CP(clk), .CD(n208), .Q(n207) );
  n207 = (n208 & n117);
  
  // GTECH_FD2 \DP/rb_reg[3]  ( .D(n116), .CP(clk), .CD(n208), .Q(n200) );
  n200 = (n208 & n116);
  
  // GTECH_FD2 \DP/ra_reg[0]  ( .D(n112), .CP(clk), .CD(n208), .Q(n206) );
  n206 = (n208 & n112);
  
  // GTECH_FD2 \DP/rb_reg[0]  ( .D(n113), .CP(clk), .CD(n208), .Q(n205) );
  n205 = (n208 & n113);
  
  // GTECH_FD2 \DP/rb_reg[1]  ( .D(n114), .CP(clk), .CD(n208), .Q(n204) );
  n204 = (n208 & n114);
  
  // GTECH_FD2 \DP/ra_reg[1]  ( .D(n111), .CP(clk), .CD(n208), .Q(n203) );
  n203 = (n208 & n111);
  
  // GTECH_FD2 \DP/ra_reg[2]  ( .D(n110), .CP(clk), .CD(n208), .Q(n202) );
  n202 = (n208 & n110);
  
  // GTECH_FD2 \DP/rb_reg[2]  ( .D(n115), .CP(clk), .CD(n208), .Q(n199) );
  n199 = (n208 & n115);
  
  // GTECH_FD2 \DP/ra_reg[3]  ( .D(n109), .CP(clk), .CD(n208), .Q(n201) );
  n201 = (n208 & n109);

/*  
  printf("Flop %x %x %x %x %x %x %x %x %x\n",
	 n201&1, n202&1, n203&1, n206&1,
	 n200&1, n199&1, n204&1, n205&1,
	 n207&1);
	 */
}
  
 
  
  

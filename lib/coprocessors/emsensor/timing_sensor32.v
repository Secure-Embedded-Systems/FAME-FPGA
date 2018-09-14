module timing_sensor32(
   input wire clk,
   input wire rst,
   input wire [31:0] s,
   output wire [31:0] alarm
   );

   tsensor tsensor0(clk, rst, s, alarm[0]);
   tsensor tsensor1(clk, rst, s, alarm[1]);
   tsensor tsensor2(clk, rst, s, alarm[2]);
   tsensor tsensor3(clk, rst, s, alarm[3]);
   tsensor tsensor4(clk, rst, s, alarm[4]);
   tsensor tsensor5(clk, rst, s, alarm[5]);
   tsensor tsensor6(clk, rst, s, alarm[6]);
   tsensor tsensor7(clk, rst, s, alarm[7]);
   tsensor tsensor8(clk, rst, s, alarm[8]);
   tsensor tsensor9(clk, rst, s, alarm[9]);
   tsensor tsensor10(clk, rst, s, alarm[10]);
   tsensor tsensor11(clk, rst, s, alarm[11]);
   tsensor tsensor12(clk, rst, s, alarm[12]);
   tsensor tsensor13(clk, rst, s, alarm[13]);
   tsensor tsensor14(clk, rst, s, alarm[14]);
   tsensor tsensor15(clk, rst, s, alarm[15]);
   tsensor_inv tsensor16(clk, rst, s, alarm[16]);
   tsensor_inv tsensor17(clk, rst, s, alarm[17]);
   tsensor_inv tsensor18(clk, rst, s, alarm[18]);
   tsensor_inv tsensor19(clk, rst, s, alarm[19]);
   tsensor_inv tsensor20(clk, rst, s, alarm[20]);
   tsensor_inv tsensor21(clk, rst, s, alarm[21]);
   tsensor_inv tsensor22(clk, rst, s, alarm[22]);
   tsensor_inv tsensor23(clk, rst, s, alarm[23]);
   tsensor_inv tsensor24(clk, rst, s, alarm[24]);
   tsensor_inv tsensor25(clk, rst, s, alarm[25]);
   tsensor_inv tsensor26(clk, rst, s, alarm[26]);
   tsensor_inv tsensor27(clk, rst, s, alarm[27]);
   tsensor_inv tsensor28(clk, rst, s, alarm[28]);
   tsensor_inv tsensor29(clk, rst, s, alarm[29]);
   tsensor_inv tsensor30(clk, rst, s, alarm[30]);
   tsensor_inv tsensor31(clk, rst, s, alarm[31]);

endmodule 

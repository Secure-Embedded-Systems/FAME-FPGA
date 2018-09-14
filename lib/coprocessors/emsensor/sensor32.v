module sensor32(
   input wire clk,
   input wire rst,
   //input wire [31:0] d,
   output wire [31:0] q,
   output wire [31:0] qs,
   output wire [31:0] alarm
   );

   sensor_cell mysensor0(clk, rst, q[0], qs[0], alarm[0]);
   sensor_cell mysensor1(clk, rst, q[1], qs[1], alarm[1]);
   sensor_cell mysensor2(clk, rst, q[2], qs[2], alarm[2]);
   sensor_cell mysensor3(clk, rst, q[3], qs[3], alarm[3]);
   sensor_cell mysensor4(clk, rst, q[4], qs[4], alarm[4]);
   sensor_cell mysensor5(clk, rst, q[5], qs[5], alarm[5]);
   sensor_cell mysensor6(clk, rst, q[6], qs[6], alarm[6]);
   sensor_cell mysensor7(clk, rst, q[7], qs[7], alarm[7]);
   sensor_cell mysensor8(clk, rst, q[8], qs[8], alarm[8]);
   sensor_cell mysensor9(clk, rst, q[9], qs[9], alarm[9]);

   sensor_cell mysensor10(clk, rst, q[10], qs[10], alarm[10]);
   sensor_cell mysensor11(clk, rst, q[11], qs[11], alarm[11]);
   sensor_cell mysensor12(clk, rst, q[12], qs[12], alarm[12]);
   sensor_cell mysensor13(clk, rst, q[13], qs[13], alarm[13]);
   sensor_cell mysensor14(clk, rst, q[14], qs[14], alarm[14]);
   sensor_cell mysensor15(clk, rst, q[15], qs[15], alarm[15]);
   sensor_cell mysensor16(clk, rst, q[16], qs[16], alarm[16]);
   sensor_cell mysensor17(clk, rst, q[17], qs[17], alarm[17]);
   sensor_cell mysensor18(clk, rst, q[18], qs[18], alarm[18]);
   sensor_cell mysensor19(clk, rst, q[19], qs[19], alarm[19]);

   sensor_cell mysensor20(clk, rst, q[20], qs[20], alarm[20]);
   sensor_cell mysensor21(clk, rst, q[21], qs[21], alarm[21]);
   sensor_cell mysensor22(clk, rst, q[22], qs[22], alarm[22]);
   sensor_cell mysensor23(clk, rst, q[23], qs[23], alarm[23]);
   sensor_cell mysensor24(clk, rst, q[24], qs[24], alarm[24]);
   sensor_cell mysensor25(clk, rst, q[25], qs[25], alarm[25]);
   sensor_cell mysensor26(clk, rst, q[26], qs[26], alarm[26]);
   sensor_cell mysensor27(clk, rst, q[27], qs[27], alarm[27]);
   sensor_cell mysensor28(clk, rst, q[28], qs[28], alarm[28]);
   sensor_cell mysensor29(clk, rst, q[29], qs[29], alarm[29]);

   sensor_cell mysensor30(clk, rst, q[30], qs[30], alarm[30]);
   sensor_cell mysensor31(clk, rst, q[31], qs[31], alarm[31]);

endmodule 

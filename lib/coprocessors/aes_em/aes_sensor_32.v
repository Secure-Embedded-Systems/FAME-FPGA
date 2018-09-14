module aes_sensor_32(data, clk, q, alarm);
	input wire [31:0] data;
	input wire clk;
    output wire [31:0] q;
	output wire [3:0] alarm;

	aes_sensor a0 (data[7:0],   clk, q[7:0],   alarm[0]);
	aes_sensor a1 (data[15:8],  clk, q[15:8],  alarm[1]);
	aes_sensor a2 (data[23:16], clk, q[23:16], alarm[2]);
	aes_sensor a3 (data[31:24], clk, q[31:24], alarm[3]);

endmodule

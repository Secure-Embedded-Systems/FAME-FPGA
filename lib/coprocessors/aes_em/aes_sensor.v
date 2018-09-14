module aes_sensor(data, clk, q, alarm);
	input [7:0] data;
	input clk;
    output [7:0] q;
	output reg alarm;

 	reg [7:0] q_main;
    wire [7:0] data_b;
    reg [7:0] q_shadow ;
 	wire [7:0] alert;
 	wire alarm_comb;

 	assign data_b = ~data;

 	always @(posedge clk) begin
 		q_main <= data;
 		q_shadow <= data_b;
 	end

    assign alert = ~(q_main ^ q_shadow);

 	assign alarm_comb = |alert;
 	assign q = q_main;

 	always @(posedge clk) alarm <= alarm_comb;

endmodule


module vlog_module		
	(
	vrst,
	vclk,
	
	// apb slave input
	vpsel   ,    // slave select
	vpenable,    // strobe
	vpaddr  ,    // address bus (byte)
	vpwrite ,    // write
	vpwdata ,    // write data bus
	
	// apb slave output
	vprdata,    // read data bus
	alarm_emsensor // sensor alarm	
	// Add core-specific ports
	);
	
	parameter vpindex = 8;
	parameter vpaddress = 8;
	parameter vpmask = 8;
	parameter vnapbslv = 8;
	
	input vrst;
	input vclk;
	
	// apb slave input
	input [0:vnapbslv-1] vpsel;     // slave select
	input vpenable;                 // strobe
	input [31:0] vpaddr;            // address bus (byte)
	input vpwrite;                  // write
	input [31:0] vpwdata;           // write data bus
	
	// apb slave output
	output [31:0] vprdata;          // read data bus
	output alarm_emsensor; // Add core-specific ports 
	wire alarm_sensor; // Add core-specific ports 
	
	// Internal signal definitions
	wire [63:0] q, qs, alarm;
	wire [63:0] q_a, qs_a, alarm_a;
	wire [31:0] q_b, qs_b, alarm_b;
	wire [191:0] alert;
	wire [31:0] talert;
	wire [63:0] emalert;
	wire [63:0] emalert_a;
	wire [31:0] emalert_b;
	reg [31:0] r, rin;
	reg [63:0] alarm_r, control_r, select_r;
	reg [63:0] alarm_a_r, control_a_r, select_a_r;
	reg [31:0] alarm_b_r, control_b_r, select_b_r;
	reg [63:0] alarm_rcomb, control_rcomb, select_rcomb;
	reg [63:0] alarm_a_rcomb, control_a_rcomb, select_a_rcomb;
	reg [31:0] alarm_b_rcomb, control_b_rcomb, select_b_rcomb;
	reg [31:0] readdata;
	reg [31:0] writedata;
	wire [31:0] sensitivity, talarm;
	reg [31:0] talarm_r, sensitivity_r, tselect_r, tcontrol_r;
	reg [31:0] talarm_rcomb, sensitivity_rcomb, tselect_rcomb, tcontrol_rcomb;
	reg [31:0] enable_r, enable_rcomb;
	reg [31:0] soft_rst_r, soft_rst_rcomb;
	wire sensor_rst;

	sensor32 sensormm1(vclk, sensor_rst, q[31:0] , qs[31:0] , alarm[31:0] );
	sensor32 sensormm2(vclk, sensor_rst, q[63:32], qs[63:32], alarm[63:32]);
	sensor32 sensormm3(vclk, sensor_rst, q_a[31:0] , qs_a[31:0] , alarm_a[31:0] );
	sensor32 sensormm4(vclk, sensor_rst, q_a[63:32], qs_a[63:32], alarm_a[63:32]);
	sensor32 sensormm5(vclk, sensor_rst, q_b[31:0] , qs_b[31:0] , alarm_b[31:0] );
	timing_sensor32 tsensormm(vclk, vrst, sensitivity, talarm); 
	
	always @(*) begin
		// default value assignments
		control_rcomb = control_r;
		enable_rcomb = enable_r;
		control_a_rcomb = control_a_r;
		control_b_rcomb = control_b_r;
		tcontrol_rcomb = tcontrol_r;
		select_rcomb = select_r;
		select_a_rcomb = select_a_r;
		select_b_rcomb = select_b_r;
		tselect_rcomb = tselect_r;
		sensitivity_rcomb = sensitivity_r;
		soft_rst_rcomb = soft_rst_r;

		
		// register-read logic
		case (vpaddr[11:2])
			10'd0: readdata = control_r[31:0];
			10'd1: readdata = control_r[63:32];
			10'd2: readdata = select_r[31:0];
			10'd3: readdata = select_r[63:32];
			10'd4: readdata = alarm_r[31:0];
			10'd5: readdata = alarm_r[63:32];
			10'd6: readdata = tcontrol_r;
			10'd7: readdata = sensitivity_r;
			10'd8: readdata = tselect_r;
			10'd9: readdata = talarm_r;
			10'd10: readdata = control_a_r[31:0];
			10'd11: readdata = control_a_r[63:32];
			10'd12: readdata = select_a_r[31:0];
			10'd13: readdata = select_a_r[63:32];
			10'd14: readdata = alarm_a_r[31:0];
			10'd15: readdata = alarm_a_r[63:32];
			10'd16: readdata = control_b_r[31:0];
			10'd17: readdata = select_b_r[31:0];
			10'd18: readdata = alarm_b_r[31:0];
			10'd19: readdata = enable_r[31:0];
			10'd20: readdata = soft_rst_r[31:0];
			default: readdata = 5;
		endcase
		
		// register-write logic
		if ((vpsel[vpindex] & vpwrite & vpenable) == 1'b1) begin
			case (vpaddr[11:2])
				10'd0: control_rcomb[31:0] = vpwdata;
				10'd1: control_rcomb[63:32] = vpwdata;
				10'd2: select_rcomb[31:0] = vpwdata;
				10'd3: select_rcomb[63:32]  = vpwdata;
				10'd6: tcontrol_rcomb = vpwdata;
				10'd7: sensitivity_rcomb = vpwdata;
				10'd8: tselect_rcomb = vpwdata;
				10'd10: control_a_rcomb[31:0] = vpwdata;
				10'd11: control_a_rcomb[63:32] = vpwdata;
				10'd12: select_a_rcomb[31:0] = vpwdata;
				10'd13: select_a_rcomb[63:32]  = vpwdata;
				10'd16: control_b_rcomb[31:0] = vpwdata;
				10'd17: select_b_rcomb[31:0] = vpwdata;
				10'd19: enable_rcomb[31:0]  = vpwdata;
				10'd20: soft_rst_rcomb[31:0]  = vpwdata;
				default: control_rcomb = control_r;
			endcase
		end
		
		// update register input
		if (control_r[31:0] == 32'h1) begin
			alarm_rcomb[31:0] = 0;
		end else begin
			alarm_rcomb[31:0] = alarm[31:0] | alarm_r[31:0];
		end

		if (control_r[63:32] == 32'h1) begin
			alarm_rcomb[63:32] = 0;
		end else begin
			alarm_rcomb[63:32] = alarm[63:32] | alarm_r[63:32];
		end

		if (control_a_r[31:0] == 32'h1) begin
			alarm_a_rcomb[31:0] = 0;
		end else begin
			alarm_a_rcomb[31:0] = alarm_a[31:0] | alarm_a_r[31:0];
		end

		if (control_b_r[31:0] == 32'h1) begin
			alarm_b_rcomb[31:0] = 0;
		end else begin
			alarm_b_rcomb[31:0] = alarm_b[31:0] | alarm_b_r[31:0];
		end

		if (control_a_r[63:32] == 32'h1) begin
			alarm_a_rcomb[63:32] = 0;
		end else begin
			alarm_a_rcomb[63:32] = alarm_a[63:32] | alarm_a_r[63:32];
		end


		if (tcontrol_r == 32'h1) begin
			talarm_rcomb = 0;
		end else begin
			talarm_rcomb = talarm | talarm_r;
		end


	end
	
	assign vprdata = readdata;
	assign sensitivity = sensitivity_r;
	assign emalert = select_r && alarm;
	assign emalert_a = select_a_r && alarm_a;
	assign emalert_b = select_b_r && alarm_b;
	assign talert = tselect_r && talarm; 
	assign alert = {talert, emalert, emalert_a, emalert_b};
	assign alarm_sensor = |alert;
	assign alarm_emsensor = enable_r[0] & alarm_sensor;
	assign sensor_rst = soft_rst_r[0] && vrst;
	
	always @(posedge vclk) begin
		if (!vrst) begin
			alarm_r 		<= 0;
			alarm_a_r 		<= 0;
			alarm_b_r 		<= 0;
			talarm_r 		<= 0;
			control_r 		<= 0;
			control_a_r		<= 0;
			control_b_r		<= 0;
			tcontrol_r 		<= 0;
			sensitivity_r 	<= 0;
			select_r  		<= 64'hffffffffffffffff;
			select_a_r 		<= 64'hffffffffffffffff;
			select_b_r 		<= 32'hffffffff;
			tselect_r 		<= 32'hffffffff;
			enable_r		<= 0;
			soft_rst_r		<= 32'h1;
		end
		else begin
			alarm_r 		<= alarm_rcomb;
			alarm_a_r 		<= alarm_a_rcomb;
			alarm_b_r 		<= alarm_b_rcomb;
			talarm_r 		<= talarm_rcomb;
			control_r 		<= control_rcomb;
			control_a_r 	<= control_a_rcomb;
			control_b_r 	<= control_b_rcomb;
			tcontrol_r 		<= tcontrol_rcomb;
			sensitivity_r 	<= sensitivity_rcomb;
			select_r 		<= select_rcomb;
			select_a_r 		<= select_a_rcomb;
			select_b_r 		<= select_b_rcomb;
			tselect_r 		<= tselect_rcomb;
			enable_r		<= enable_rcomb;
			soft_rst_r		<= soft_rst_rcomb;
		end
	end

endmodule

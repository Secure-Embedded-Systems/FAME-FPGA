module sensor_test();
	reg vclk, vrst, vpenable, vpwrite;
	reg [7:0] vpsel;
	reg [31:0] vpaddr, vpwdata;
	wire [31:0] vprdata;

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(1);
	end

	vlog_module dut(vrst, vclk, vpsel, vpenable, vpaddr, vpwrite, vpwdata, vprdata);	
	
	always #5 vclk = ~vclk;

	initial begin
		vrst = 0;
		vclk = 0;
		vpaddr = 32'b0;
		vpaddr[11:2] = 10'b0;
		vpwrite = 1'b0;
		vpenable = 1'b1;
		vpwdata = 32'h0;

		#23;
		vrst = 1;

		#10;
		vpaddr[11:2] = 10'b1;
		#10;
		$display ("Initial alarm %x", vprdata);
		
		#10;
		$display ("Now forcing EM attack");

		#30;
		$display ("New alarm %x", vprdata);

		#20;
		vpwrite = 1'b1;
		vpaddr[11:2] = 10'b0;
		$display ("Refreshing alarm");
		vpwdata = 32'h1;

		#10;
		vpwrite = 1'b1;
		vpwdata = 32'h0;

		#10;
		vpwrite = 1'b0;
		vpaddr[11:2] = 10'b1;

		#10;
		$display ("Final alarm %x", vprdata);
		

		#100;
		#20;

		$display ("Next alarm %x", vprdata);
		#40;

		$finish;

	end

endmodule

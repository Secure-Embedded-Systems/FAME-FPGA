`timescale 1ns / 1ps

module vlog_keymill_tb;

	reg vclk;
	reg vrst;
  
	// apb slave input
	reg [7:0] vpsel;     // slave select
	reg vpenable;                 // strobe
	reg [31:0] vpaddr;            // address bus (byte)
	reg vpwrite;                  // write
	reg [31:0] vpwdata;           // write data bus
	
	// apb slave output
	wire [31:0] vprdata;          // read data bus

	// Instantiate the Unit Under Test (UUT)
	vlog_keymill uut (
		.vrst(vrst), 
		.vclk(vclk), 
		.vpsel(vpsel), 
		.vpenable(vpenable), 
		.vpaddr(vpaddr), 
		.vpwrite(vpwrite), 
		.vpwdata(vpwdata), 
		.vprdata(vprdata)
	);

	initial begin
    $dumpfile("dump.vcd");
    $monitor("output data monitor: %x", vprdata);
    $dumpvars(1);
  end
    
    
    
    initial
   begin
	$display("\n\n");
	$display("*****************************************************");
	$display("* Keymill Test bench ...");
	$display("*****************************************************");
	$display("\n");
    vpsel =1;
    vclk = 0;
    vrst = 1;
	 #20
	 vrst = 0;
	 #20
	 vrst = 1;
    vpaddr = 32'h0;
    vpwrite = 1'b0;
     
    vpenable = 1'b1;     
    vpaddr[7:2] = 6'b100001;
	 #20
    $display("%x",vprdata);
   #20
	//key    
    vpwrite = 1'b1;
    vpaddr[7:2] = 6'b000001;
    vpwdata = 32'h89ABCDEF;
	 #20
    vpaddr[7:2] = 6'b000010;
    vpwdata = 32'hF01234567;
	 #20
    vpaddr[7:2] = 6'b000011;
    vpwdata = 32'h89ABCDEF;
	 #20
    vpaddr[7:2] = 6'b000100;
    vpwdata = 32'h01234567;
	 #20
    
     //iv_in
    vpaddr[7:2] = 6'b000101;
    vpwdata = 32'h89ABCDEF;
	 #20
    vpaddr[7:2] = 6'b000110;
    vpwdata = 32'h01234567;
	 #20
    vpaddr[7:2] = 6'b000111;
    vpwdata = 32'h89ABCDEF;
	 #20
    vpaddr[7:2] = 6'b001000;
    vpwdata = 32'h01234567;
	 #20
         
     //control reg
     vpaddr[7:2] = 6'b000000;
     vpwdata = 32'h00000001;
	  #20 //Data_in_ready start the Keymill
     
		vpenable = 1'b1;
		vpwrite = 1'b0;
		vpaddr[7:2] = 6'b000000;		//read the status register
		while (!(vprdata[31:30] == 2'b00)) //Loop until the core is ready (BUSY == Buf_empy ==0)
			#20;
		#20	//if ready, read two buyes
		vpaddr[7:2] = 6'b000001;		//change the address to the buffer_out
		#20	//two clk cycles
		#20
		#20 vpenable = 1'b0;
		
		#20 
		vpenable = 1'b1;
		vpwrite = 1'b1;
		vpaddr[7:2] = 6'b000000;
		vpwdata = 32'h00000002; //software reset
		#20
		//control reg
		vpenable = 1'b1;
		vpwrite = 1'b1;
	  vpaddr[7:2] = 6'b000000;
	  vpwdata = 32'h00000001;
	  #20 //Data_in_ready start the Keymill
		#20
		#20
		vpenable = 1'b1;
		vpwrite = 1'b0;
		vpaddr[7:2] = 6'b000000;
		while (!(vprdata[31:30] == 2'b00)) //Loop until the core is ready (BUSY == Buf_empy ==0)
			#20;
		#20
		#20
		vpaddr[7:2] = 6'b000001;		//change the address to the buffer_out
		#20	//two clk cycles
		#20
		#20 vpenable = 1'b0;
		#900


	  #200 //read status register for BUSY
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
     $display("%x",vprdata);
     #200
		vpenable = 1'b0;
     vpwrite = 1'b0;
	 #100//*/
    //$finish;
         
     //read status
     //vpaddr[7:2] = 6'b100001;#20
     //while (done == 1'b0)
     //  begin
     //  end
     
     vpenable = 1'b1;
     vpwrite = 1'b0;
     vpaddr[7:2] = 6'b000001;
	  #20
     $display("Stream_out: %x", vprdata);
	 #20
     $display("Stream_out: %x", vprdata);
	  #20
     $display("Stream_out: %x", vprdata);
	  #20
     $display("Stream_out: %x", vprdata);
	  #20
     $display("Stream_out: %x", vprdata); 
	     vpenable = 1'b0;
     //$finish;
     
   end
    
always #10 vclk = ~vclk;

      
endmodule 
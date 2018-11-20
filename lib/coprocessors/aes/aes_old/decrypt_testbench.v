// Code your testbench here
// or browse Examples

`include "timescale.v"

module aes_test;
  
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
  
  reg[127:0] output_encrypt;
  reg done;
  wire [127:0] text_out_decrypt;
  
  initial begin
    $dumpfile("dump.vcd");
    $monitor("output data monitor: %x", text_out_decrypt);
    $dumpvars(1);
  end
    
    
    
    initial
   begin
	$display("\n\n");
	$display("*****************************************************");
	$display("* AES Test bench ...");
	$display("*****************************************************");
	$display("\n");
     
    vclk = 0;
    vrst = 0;#20
	vrst = 1;#20
	vrst = 0;
     done = 0;
     vpaddr = 32'h0;
     vpwrite = 1'b0;
     
     vpenable = 1'b1;     
     vpaddr[7:2] = 6'b100001;#20
     $display("%x",vprdata);
     
     
     
     vpwrite = 1'b1;
     
     //key
     vpaddr[7:2] = 6'b000100;
     vpwdata = 32'h00000000;#20
     vpaddr[7:2] = 6'b000101;
     vpwdata = 32'h00000000;#20
     vpaddr[7:2] = 6'b000110;
     vpwdata = 32'h00000000;#20
     vpaddr[7:2] = 6'b000111;
     vpwdata = 32'h00000000;#20
     
     
     //data_in
     vpaddr[7:2] = 6'b001100;
     vpwdata = 32'hffffffff;#20
     vpaddr[7:2] = 6'b001101;
     vpwdata = 32'hffffffff;#20
     vpaddr[7:2] = 6'b001110;
     vpwdata = 32'hffffffff;#20
     vpaddr[7:2] = 6'b001111;
     vpwdata = 32'hffffffff;#20
     
     
     //init vector
     vpaddr[7:2] = 6'b010100;
     vpwdata = 32'h00000000;#20
     vpaddr[7:2] = 6'b010101;
     vpwdata = 32'h00000000;#20
     vpaddr[7:2] = 6'b010110;
     vpwdata = 32'h00000000;#20
     vpaddr[7:2] = 6'b010111;
     vpwdata = 32'h00000000;#20
     
     
     //control reg
     vpaddr[7:2] = 6'b100000;
     vpwdata = 32'h00000002;#20
     
     vpwdata = 32'h00000000;#20
     
     vpwrite = 1'b0;
     
     vpaddr[7:2] = 6'b100001;#20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
	 
	 #900
    
     
     
     
     //read status
     //vpaddr[7:2] = 6'b100001;#20
     //while (done == 1'b0)
     //  begin
     //  end
     
     
     vpaddr[7:2] = 6'b011100;#20
     output_encrypt[127:96] = vprdata[31:0];
     vpaddr[7:2] = 6'b011101;#20
     output_encrypt[95:64] = vprdata[31:0];
     vpaddr[7:2] = 6'b011110;#20
     output_encrypt[63:32] = vprdata[31:0];
     vpaddr[7:2] = 6'b011111;#20
     output_encrypt[31:0] = vprdata[31:0];
     
     $display("OUTPUT: %x", output_encrypt);
	     
     
	 vpwrite = 1'b1;
	 
     //data_in
     vpaddr[7:2] = 6'b001100;
     vpwdata = 32'hffffffff;#20
     vpaddr[7:2] = 6'b001101;
     vpwdata = 32'hffffffff;#20
     vpaddr[7:2] = 6'b001110;
     vpwdata = 32'hffffffff;#20
     vpaddr[7:2] = 6'b001111;
     vpwdata = 32'hffffffff;#20
      
     
     //control reg
     vpaddr[7:2] = 6'b100000;
     vpwdata = 32'h00000002;#20
     
     vpwdata = 32'h00000000;#20
     
     vpwrite = 1'b0;
     
     vpaddr[7:2] = 6'b100001;#20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
     $display("%x",vprdata);
     #20
	 
	 #900
    
     
     
     
     //read status
     //vpaddr[7:2] = 6'b100001;#20
     //while (done == 1'b0)
     //  begin
     //  end
     
     
     vpaddr[7:2] = 6'b011100;#20
     output_encrypt[127:96] = vprdata[31:0];
     vpaddr[7:2] = 6'b011101;#20
     output_encrypt[95:64] = vprdata[31:0];
     vpaddr[7:2] = 6'b011110;#20
     output_encrypt[63:32] = vprdata[31:0];
     vpaddr[7:2] = 6'b011111;#20
     output_encrypt[31:0] = vprdata[31:0];
     
     $display("OUTPUT: %x", output_encrypt);
	 
	 
	 #200;
     $finish;
     
   end
    
  
  always@ (posedge vclk) begin
    done <= vprdata[0];
  end
  
    
always #10 vclk = ~vclk;
    
    vlog_module u0(
      .vrst (vrst),
      .vclk (vclk),
      .vpsel (vpsel),
      .vpenable (vpenable),
      .vpaddr (vpaddr),
      .vpwrite (vpwrite),
      .vpwdata (vpwdata),
      .vprdata (vprdata),
      .text_out_decrypt (text_out_decrypt)   
    );
    
    endmodule
    
    

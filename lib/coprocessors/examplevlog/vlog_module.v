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
	vprdata    // read data bus
	
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
	
	// Add core-specific ports
	
	
	// Internal signal definitions
	reg [31:0] r, rin;
	reg [31:0] readdata;
	reg [31:0] writedata;
	
	always @(*) begin
		// default value assignments
		rin = r;
		
		// register-read logic
		case (vpaddr[11:2])
			10'b0: readdata = r;
			default: readdata = 5;
		endcase
		
		// register-write logic
		if ((vpsel[vpindex] & vpwrite & vpwrite) == 1'b1) begin
			case (vpaddr[11:2])
				10'b0: writedata = vpwdata;
				default: writedata = r;
			endcase
		end
		
		// update register input
		rin = writedata;
	end
	
	assign vprdata = readdata;
	
	always @(posedge vclk) begin
		if (!vrst)
			r  <= 0;
		else
			r <= rin;
	end

endmodule

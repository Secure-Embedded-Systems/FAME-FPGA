module vlog_keymill		
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
	input [0:vnapbslv-1] vpsel;     // slave select //Taha change from vnapbslv-1 to vnapbslv
	input vpenable;                 // strobe
	input [31:0] vpaddr;            // address bus (byte)
	input vpwrite;                  // write
	input [31:0] vpwdata;           // write data bus
	
	// apb slave output
	output [31:0] vprdata;          // read data bus
	
	// Add core-specific ports
	
	
	// Internal signal definitions
	reg [31:0] vprdata;				// Output to APB
	reg [1:0] data_in_ctr_w;  		//
	reg [4:0] data_in_ctr_b;  		// These three counters to control 8-bit in/out to 32-bit in/out
	reg [4:0] data_out_ctr;   		//
	reg [31:0] Key_input [0:3]; 	// Internal Key memory written by Processor, read by the Keymill
	reg [31:0] IV_input [0:3];	 	// Internal IV memory written by Processor, read by the Keymill
	reg [31:0] status_reg; 			//[31] BUSY, [30] Buf_empty, [29] Buf_full
	reg [1:0] cont_reg;				//[1] soft_reset (software_reset), [0] Data_in_ready (start command)
	reg rst_reg, data_in_ready, soft_reset;		
	reg [2:0] state;					// Internal State Machine
	parameter State_RST = 3'b000, State_Load_Key = 3'b001, State_Load_IV = 3'b010, State_Warm_Up = 3'b011, State_Gen_Output=3'b100, State_Halt=3'b101;

	//Ports of the Keymill
	//inputs
	reg load_key, load_iv, run;
	reg [7:0] key, iv;
	//outputs
	wire [7:0] stream_out;
	wire output_ready;
	
	//Ports of the FIFO
	//inputs
	reg wr_en, rd_en;
	reg [31:0] buf_in;
	//outputs
	wire buf_full, buf_empty;
	wire [31:0] buf_out;
	
	
	
	// Instantiate the Unit Under Test (UUT)
	LR_Keymill uut (
		.clk(vclk), 
		.rst(rst_reg), 
		.key(key), 
		.load_key(load_key), 
		.iv(iv), 
		.load_iv(load_iv),
		.run(run),
		.stream_out(stream_out), 
		.output_ready(output_ready)
	);
	
	fifo fifo1( 
		.clk(vclk), 
		.rst(rst_reg), 
		.buf_in(buf_in), 
		.buf_out(buf_out), 
		.wr_en(wr_en), 
		.rd_en(rd_en), 
		.buf_empty(buf_empty), 
		.buf_full(buf_full)
		);

	always @(posedge vclk or negedge vrst)
		if (~vrst)
			state <= State_RST;
		else
			case (state)
			State_RST: begin			
				load_key <= 1'b0;
				load_iv <= 1'b0;
				run <= 1'b0;
				data_in_ctr_w <= 2'b00;   	
				data_in_ctr_b <= 5'b11111;  
				data_out_ctr <= 5'b11111;  
				buf_in <= 32'h0;
				wr_en <= 0;
				
				if (data_in_ready) begin		//Condition for the next state
					rst_reg <= 1'b1;
					data_in_ready <= 0;
					status_reg[31] <= 1'b1;  //BUSY Signal
					load_key <= 1;					//Assert the load_key one clock cycle before the actual data to prepare the internal machine of the Keymill
					state <= State_Load_Key;
					end
				else begin
					rst_reg <= 1'b0;
					data_in_ready <= cont_reg[0];
					status_reg[31] <= 1'b0; //BUSY Signal
					load_key <= 0;
					state <= State_RST;
					end
					
				end
			
			State_Load_Key: begin
				key <= Key_input[data_in_ctr_w][data_in_ctr_b -: 8]; //Start from MSBs
				
				if ((data_in_ctr_w == 2'b11)&(data_in_ctr_b == 5'b00111))begin //Condition for the next state (State_Load_IV)
					data_in_ctr_w <= 2'b11;
					data_in_ctr_b <= 5'b00000;
					load_key <= 0;
					load_iv <= 1;
					state <= State_Load_IV;
					end
				else if (data_in_ctr_b == 5'b00111) begin 		//One word is complete
					data_in_ctr_b <= 5'b11111;
					data_in_ctr_w <= data_in_ctr_w + 2'b01;
					load_key <= 1;
					load_iv <= 0;
					state <= State_Load_Key;
					end
				else begin													//Loop within a single word
					data_in_ctr_b <= data_in_ctr_b - 5'b1000;
					data_in_ctr_w <= data_in_ctr_w;
					load_key <= 1;
					load_iv <= 0;
					state <= State_Load_Key;
					end
					
				end	

			State_Load_IV: begin
				iv <= IV_input[data_in_ctr_w][data_in_ctr_b +: 8];		//Start from the LSBs
				
				if ((data_in_ctr_w == 2'b00)&(data_in_ctr_b == 5'b11000))begin //Condition for the next state (State_Warm_Up)
					data_in_ctr_b <= 5'b11111;
					data_in_ctr_w <= 2'b00;
					load_iv <= 0;
					run <= 1'b1;
					state <= State_Warm_Up;
					end
				else if (data_in_ctr_b == 5'b11000) begin  //One word is complete
					data_in_ctr_b <= 5'b00000;
					data_in_ctr_w <= data_in_ctr_w - 2'b01;
					load_iv <= 1;
					run <= 1'b0;
					state <= State_Load_IV;
					end
				else begin											//Loop within a single word
					data_in_ctr_b <= data_in_ctr_b + 5'b01000;
					data_in_ctr_w <= data_in_ctr_w;
					load_iv <= 1;
					run <= 1'b0;
					state <= State_Load_IV;
					end
				
				end
			
			State_Warm_Up:
				if (output_ready == 1'b1) begin			//Condition for the next state (State_Gen_Output)
					status_reg[31] <= 1'b0; //!BUSY
					buf_in[data_out_ctr -: 8] <= stream_out;
					data_out_ctr <= data_out_ctr - 5'b01000;
					state <= State_Gen_Output;
					end
				else begin										//Wait in Warm_Up while asserting the Busy Signal
					status_reg[31] <= 1'b1; //BUSY
					buf_in[data_out_ctr -: 8] <= 8'b0;
					data_out_ctr <= data_out_ctr;
					state <= State_Warm_Up;
					end
				
			State_Gen_Output:begin
				buf_in[data_out_ctr -: 8] <= stream_out;
				
				if (soft_reset) begin							// Soft Reset
					soft_reset <= 1'b0;
					state <= State_RST;
					end
				else begin
					soft_reset <= cont_reg[1];
					if( buf_full ) begin				//Halt the core on Buffer_full(STate_Halt)
						wr_en <= 1'b0;
						run <= 1'b0;
						data_out_ctr <= 5'b11111;				
						state <= State_Halt;
						end
					else 
						if (data_out_ctr == 5'b00111) begin		//One word is complete, 
							wr_en <= 1'b1;		// send to buffer		
							data_out_ctr <= 5'b11111;
							state <= State_Gen_Output;
						end
						else begin										//Loop within a single word
							wr_en <= 1'b0;
							data_out_ctr <= data_out_ctr - 5'b01000;
							state <= State_Gen_Output;
						end 
					end
			
			end
			
			State_Halt:
				if (soft_reset) begin						// Soft Reset
					soft_reset <= 1'b0;
					state <= State_RST; 	
					run <= 1'b0;
					end
				else if( !buf_full )begin			//On reading data, return to State_Gen_Output
					soft_reset <= cont_reg[1];
					state <= State_Gen_Output;
					run <= 1'b1;
					end
				else begin										//Otherwise, loop in State_Halt
					soft_reset <= cont_reg[1];
					state <= State_Halt;
					run <= 1'b0;
					end
			
			default state <= State_RST;
			endcase


//----------------------------
// Bus Interface Logic
//----------------------------
//always@(*)
//status_reg[28:0] <= 29'b0;

	always @(posedge vclk or negedge vrst)
		if (~vrst) begin
//			vprdata <= 32'b0;
			cont_reg <= 2'b0;
			status_reg[30:0] <= 32'b0;
			//status_reg[30] <= 1'b0;
			Key_input[0] <= 32'b0;
			Key_input[1] <= 32'b0;
			Key_input[2] <= 32'b0;
			Key_input[3] <= 32'b0;
			IV_input[0] <= 32'b0;
			IV_input[1] <= 32'b0;
			IV_input[2] <= 32'b0;
			IV_input[3] <= 32'b0;
			end
		
		else begin
			status_reg[29] <= buf_full;
			status_reg[30] <= buf_empty; //status_reg[31] is BUSY, and managed in the FSM					
			status_reg[28:0] <= 29'b0;

/*			if (vpsel[vpindex] && vpaddr[7:2] == 6'b001010 && vpenable && !vpwrite)  // Control fifo rd_en
					rd_en <= 1;			// rd_en signals the FIFO to increment the read pointer
				else
					rd_en <= 0;
*/
/*			if(vpsel[vpindex] && vpenable && !vpwrite) // Register-read logic from Keymill to Processor
				case (vpaddr[7:2])
					6'b000000: vprdata <= status_reg;
					6'b000001: vprdata <= buf_out;
					default: vprdata <= 32'hAAAAAAAA;	 //debug
				endcase
*/			if (vpsel[vpindex] && vpenable && vpwrite) //Register-write logic from Processor to Keymill
				case (vpaddr[7:2])
					6'b000000: cont_reg <= vpwdata[1:0];
					6'b000001: Key_input[0] <= vpwdata;
					6'b000010: Key_input[1] <= vpwdata;
					6'b000011: Key_input[2] <= vpwdata;
					6'b000100: Key_input[3] <= vpwdata;
					6'b000101: IV_input[0] <= vpwdata;
					6'b000110: IV_input[1] <= vpwdata;
					6'b000111: IV_input[2] <= vpwdata;
					6'b001000: IV_input[3] <= vpwdata;
					default: ;
				endcase
			end


always @(*) begin

			if (vpsel[vpindex] && vpaddr[7:2] == 6'b001010 && vpenable && !vpwrite)  // Control fifo rd_en
					rd_en = 1;			// rd_en signals the FIFO to increment the read pointer
				else
					rd_en = 0;

			if(vpsel[vpindex] && vpenable && !vpwrite) // Register-read logic from Keymill to Processor
				case (vpaddr[7:2])
					6'b001001: vprdata = status_reg;
					6'b001010: vprdata = buf_out;
					6'b000000: vprdata=  cont_reg;
					6'b000001: vprdata = Key_input[0];
					6'b000010: vprdata = Key_input[1];
					6'b000011: vprdata = Key_input[2];
					6'b000100: vprdata = Key_input[3];
					6'b000101: vprdata = IV_input[0];
					6'b000110: vprdata = IV_input[1];
					6'b000111: vprdata = IV_input[2];
					6'b001000: vprdata = IV_input[3];
					default: vprdata = 32'hAAAAAAAA;	 //debug
				endcase
end
endmodule 

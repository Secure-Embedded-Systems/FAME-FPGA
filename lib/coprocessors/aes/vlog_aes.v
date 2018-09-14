module vlog_aes		
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
	vprdata
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
	//	reg [31:0] r, rin;
	//	reg [31:0] readdata;
	//	reg [31:0] writedata;
		
	reg [31:0] control_reg, status_reg, next_status_reg;
	
	reg [31:0] data_input_encrypt[0:3];
	reg [31:0] data_input_decrypt[0:3];
		
	
	reg [31:0] key_encrypt[0:3];
	reg [31:0] key_decrypt[0:3];	
	
	reg [31:0] data_output_encrypt[0:3];
	reg [31:0] data_output_decrypt[0:3];
	
	reg [31:0] init_vector_encrypt[0:3];
	reg [31:0] init_vector_decrypt[0:3];

	reg [1:0] state_e, next_state_e;
	reg [1:0] state_d, next_state_d;
	
	wire [127:0]  text_out_decrypt;
	wire [127:0] text_out_encrypt;	
 
 
	reg [31:0] next_key_encrypt[0:3];
	reg [31:0] next_key_decrypt[0:3];
	reg [31:0] next_data_input_encrypt[0:3];
	reg [31:0] next_data_input_decrypt[0:3];
	reg [31:0] next_init_vector_encrypt[0:3];
	reg [31:0] next_init_vector_decrypt[0:3];
	reg [31:0] next_control_reg;
 
 
  
	reg kld, next_kld, ld_encrypt, next_ld_encrypt;

	wire rst;
	assign rst = 1'b1;
		
	wire done_decrypt, done_encrypt;
	reg done_decrypt_q, done_encrypt_q;
	
	reg [31:0] readdata;
	
	wire kdone, ld_decrypt;
	assign ld_decrypt = kdone;

	reg latch_encrypt, latch_encrypt_q, latch_decrypt, latch_decrypt_q;
  
	wire[127:0] key_encrypt_128, key_decrypt_128;
	assign key_encrypt_128 = {key_encrypt[0], key_encrypt[1], key_encrypt[2], key_encrypt[3]};
	assign key_decrypt_128 = {key_decrypt[0], key_decrypt[1], key_decrypt[2], key_decrypt[3]};
	
	
	wire [127:0] text_in_encrypt, text_in_decrypt;
	assign text_in_encrypt = {init_vector_encrypt[0], init_vector_encrypt[1], init_vector_encrypt[2], init_vector_encrypt[3]} ^ {data_input_encrypt[0], data_input_encrypt[1], data_input_encrypt[2], data_input_encrypt[3]};	
	assign text_in_decrypt = {data_input_decrypt[0], data_input_decrypt[1], data_input_decrypt[2], data_input_decrypt[3]};
	
	wire done_encrypt_wire, done_decrypt_wire;
	
	localparam START_E = 2'd0, LOAD_E = 2'd1, WAIT_E = 2'd2, IV_E = 2'd3;
	localparam START_D = 2'd0, LOAD_D = 2'd1, WAIT_D = 2'd2, IV_D = 2'd3;


	aes_cipher_top aes_encrypt_core(vclk, vrst, ld_encrypt, done_encrypt, key_encrypt_128, text_in_encrypt, text_out_encrypt);
	aes_inv_cipher_top aes_decrypt_core(vclk, vrst, kld, ld_decrypt, kdone, done_decrypt, key_decrypt_128, text_in_decrypt, text_out_decrypt);
	
	
	assign vprdata = readdata;
	
	always @(posedge vclk) 
	begin
		if (!vrst) begin			////reset condition
		//status_reg[31:0] <= 32'h0;
		state_e <= 2'd0;
		state_d <= 2'd0;
		//next_state_e <= 2'd0;
		//next_state_d <= 2'd0;
		//next_status_reg <= 32'h0;
	
		
		kld <= 1'b0;
		//next_kld <= 1'b0;
		ld_encrypt <= 1'b0;
		latch_encrypt <= 1'b0;
		latch_encrypt_q <= 1'b0;
		latch_decrypt <= 1'b0;
		latch_decrypt_q <= 1'b0;
			
		data_output_encrypt[0] <= 32'h0;
		data_output_encrypt[1] <= 32'h0;
		data_output_encrypt[2] <= 32'h0;
		data_output_encrypt[3] <= 32'h0;
		
		data_output_decrypt[0] <= 32'h0;
		data_output_decrypt[1] <= 32'h0;
		data_output_decrypt[2] <= 32'h0;
		data_output_decrypt[3] <= 32'h0;
		
		data_input_encrypt[0] <= 32'h0;
		data_input_encrypt[1] <= 32'h0;
		data_input_encrypt[2] <= 32'h0;
		data_input_encrypt[3] <= 32'h0;
		
		data_input_decrypt[0] <= 32'h0;
		data_input_decrypt[1] <= 32'h0;
		data_input_decrypt[2] <= 32'h0;
		data_input_decrypt[3] <= 32'h0;
		
		key_encrypt[0] <= 32'h0;
		key_encrypt[1] <= 32'h0;
		key_encrypt[2] <= 32'h0;
		key_encrypt[3] <= 32'h0;
		
		key_decrypt[0] <= 32'h0;
		key_decrypt[1] <= 32'h0;
		key_decrypt[2] <= 32'h0;
		key_decrypt[3] <= 32'h0;
		
		init_vector_encrypt[0] <= 32'h0;
		init_vector_encrypt[1] <= 32'h0;
		init_vector_encrypt[2] <= 32'h0;
		init_vector_encrypt[3] <= 32'h0;
		
		init_vector_decrypt[0] <= 32'h0;
		init_vector_decrypt[1] <= 32'h0;
		init_vector_decrypt[2] <= 32'h0;
		init_vector_decrypt[3] <= 32'h0;
		
		control_reg <= 32'h0;
		status_reg <= 32'h0;
	end
			
	else						//// non reset condition
	begin
	
		if (done_encrypt)				// dumping the output data(encrypt) into internal memory mapped register
		begin
			data_output_encrypt[0] <= text_out_encrypt[127:96];
			data_output_encrypt[1] <= text_out_encrypt[95:64];
			data_output_encrypt[2] <= text_out_encrypt[63:32];
			data_output_encrypt[3] <= text_out_encrypt[31:0];
		end
	
		if (done_decrypt)                               // dumping the output data(encrypt) into internal memory mapped register
		begin
			data_output_decrypt[0] <= text_out_decrypt[127:96] ^ init_vector_decrypt[0] ;
			data_output_decrypt[1] <= text_out_decrypt[95:64] ^ init_vector_decrypt[1];
			data_output_decrypt[2] <= text_out_decrypt[63:32] ^ init_vector_decrypt[2];
			data_output_decrypt[3] <= text_out_decrypt[31:0] ^ init_vector_decrypt[3];
		end
	
	
		state_e[1:0] <= next_state_e[1:0];
		state_d[1:0] <= next_state_d[1:0];
			
		ld_encrypt <= next_ld_encrypt;
		kld <= next_kld;
			
		latch_encrypt_q <= latch_encrypt;
		latch_decrypt_q <= latch_decrypt;
			
		latch_encrypt <= control_reg[0];
		latch_decrypt <= control_reg[1];
			
		//done_encrypt <= done_encrypt_wire;
		done_encrypt_q <= done_encrypt;
			
		//done_decrypt <= done_decrypt_wire;
		done_decrypt_q <= done_decrypt;
			
		status_reg <= next_status_reg;
					
			
		data_input_encrypt[0] <= next_data_input_encrypt[0];
		data_input_encrypt[1] <= next_data_input_encrypt[1];
		data_input_encrypt[2] <= next_data_input_encrypt[2];
		data_input_encrypt[3] <= next_data_input_encrypt[3];
			                         
		data_input_decrypt[0] <= next_data_input_decrypt[0];
		data_input_decrypt[1] <= next_data_input_decrypt[1];
		data_input_decrypt[2] <= next_data_input_decrypt[2];
		data_input_decrypt[3] <= next_data_input_decrypt[3];
			
		key_encrypt[0] <= next_key_encrypt[0];
		key_encrypt[1] <= next_key_encrypt[1];
		key_encrypt[2] <= next_key_encrypt[2];
		key_encrypt[3] <= next_key_encrypt[3];
			                  
		key_decrypt[0] <= next_key_decrypt[0];
		key_decrypt[1] <= next_key_decrypt[1];
		key_decrypt[2] <= next_key_decrypt[2];
		key_decrypt[3] <= next_key_decrypt[3];
			
		init_vector_encrypt[0] <= next_init_vector_encrypt[0];
		init_vector_encrypt[1] <= next_init_vector_encrypt[1];
		init_vector_encrypt[2] <= next_init_vector_encrypt[2];
		init_vector_encrypt[3] <= next_init_vector_encrypt[3];
			
		init_vector_decrypt[0] <= next_init_vector_decrypt[0];
		init_vector_decrypt[1] <= next_init_vector_decrypt[1];
		init_vector_decrypt[2] <= next_init_vector_decrypt[2];
		init_vector_decrypt[3] <= next_init_vector_decrypt[3];
			
		control_reg <= next_control_reg;			
		
		end	
	end
	


	
	always @(*)
	begin
	
		next_control_reg <= control_reg;
	
		case (vpaddr[7:2])					////READ LOGIC
			//3'b000: readdata = r;
			6'b011000: readdata <= data_output_encrypt[0];
			6'b011001: readdata <= data_output_encrypt[1];
			6'b011010: readdata <= data_output_encrypt[2];
			6'b011011: readdata <= data_output_encrypt[3];
			
			6'b011100: readdata <= data_output_decrypt[0];
			6'b011101: readdata <= data_output_decrypt[1];
			6'b011110: readdata <= data_output_decrypt[2];
			6'b011111: readdata <= data_output_decrypt[3];
			

			6'b000000: readdata <= key_encrypt[0];
			6'b000001: readdata <= key_encrypt[1];
			6'b000010: readdata <= key_encrypt[2];
			6'b000011: readdata <= key_encrypt[3];
				
			6'b000100: readdata <= key_decrypt[0];
			6'b000101: readdata <= key_decrypt[1];
			6'b000110: readdata <= key_decrypt[2];
			6'b000111: readdata <= key_decrypt[3];
			
			6'b001000: readdata <= data_input_encrypt[0];
			6'b001001: readdata <= data_input_encrypt[1];
			6'b001010: readdata <= data_input_encrypt[2];
			6'b001011: readdata <= data_input_encrypt[3];
		
			6'b001100: readdata <= data_input_decrypt[0];
			6'b001101: readdata <= data_input_decrypt[1];
			6'b001110: readdata <= data_input_decrypt[2];
			6'b001111: readdata <= data_input_decrypt[3];
				
			
			6'b010000: readdata <= init_vector_encrypt[0];
			6'b010001: readdata <= init_vector_encrypt[1];
			6'b010010: readdata <= init_vector_encrypt[2];
			6'b010011: readdata <= init_vector_encrypt[3];
				
			6'b010100: readdata <= init_vector_decrypt[0];
			6'b010101: readdata <= init_vector_decrypt[1];
			6'b010110: readdata <= init_vector_decrypt[2];
			6'b010111: readdata <= init_vector_decrypt[3];
					
			6'b100000: readdata <= control_reg;
			
			6'b100001: readdata <= status_reg;
          			
			6'b111111: readdata <= 32'hFFFFFFFF;
          		
			default: readdata <= 32'hAAAAAAAA;
		endcase
		
				
		// register-write logic
		if ((vpsel[vpindex] & vpenable & vpwrite) == 1'b1) 			////WRITE LOGIC
		begin
			case (vpaddr[7:2])
				
				6'b000000: next_key_encrypt[0] <= vpwdata;
				6'b000001: next_key_encrypt[1] <= vpwdata;
				6'b000010: next_key_encrypt[2] <= vpwdata;
				6'b000011: next_key_encrypt[3] <= vpwdata;
				
				6'b000100: next_key_decrypt[0] <= vpwdata;
				6'b000101: next_key_decrypt[1] <= vpwdata;
				6'b000110: next_key_decrypt[2] <= vpwdata;
				6'b000111: next_key_decrypt[3] <= vpwdata;
				
				
				6'b001000: next_data_input_encrypt[0] <= vpwdata;
				6'b001001: next_data_input_encrypt[1] <= vpwdata;
				6'b001010: next_data_input_encrypt[2] <= vpwdata;
				6'b001011: next_data_input_encrypt[3] <= vpwdata;
				
				6'b001100: next_data_input_decrypt[0] <= vpwdata;
				6'b001101: next_data_input_decrypt[1] <= vpwdata;
				6'b001110: next_data_input_decrypt[2] <= vpwdata;
				6'b001111: next_data_input_decrypt[3] <= vpwdata;
				
				
				6'b010000: next_init_vector_encrypt[0] <= vpwdata;
				6'b010001: next_init_vector_encrypt[1] <= vpwdata;
				6'b010010: next_init_vector_encrypt[2] <= vpwdata;
				6'b010011: next_init_vector_encrypt[3] <= vpwdata;
				
				6'b010100: next_init_vector_decrypt[0] <= vpwdata;
				6'b010101: next_init_vector_decrypt[1] <= vpwdata;
				6'b010110: next_init_vector_decrypt[2] <= vpwdata;
				6'b010111: next_init_vector_decrypt[3] <= vpwdata;
					
				6'b100000: next_control_reg <= vpwdata;
				
				default: if(0);
			endcase
		end
	
	
	
	
	// ENCRYPT STATE MACHINE
		
		next_status_reg <= status_reg;
		next_init_vector_encrypt[0] <= init_vector_encrypt[0];
		next_init_vector_encrypt[1] <= init_vector_encrypt[1];
		next_init_vector_encrypt[2] <= init_vector_encrypt[2];
		next_init_vector_encrypt[3] <= init_vector_encrypt[3];
		next_state_e <= state_e;
		next_ld_encrypt <= ld_encrypt;
		
		
		case(state_e)
		START_E: 
		begin
			if(latch_encrypt_q == 0 && latch_encrypt == 1)
				next_state_e <= LOAD_E;
		end
		
		LOAD_E: 
		begin
			next_state_e <= WAIT_E;
			next_status_reg[0] <= 1'b0;
			next_ld_encrypt <= 1'b1;
		end
		
		WAIT_E: 
		begin
			next_ld_encrypt <= 1'b0;
			if(done_encrypt == 1)
				next_state_e <= IV_E;
		end
		
		IV_E: 
		begin
			next_state_e <= START_E;
		
			next_init_vector_encrypt[0] <= data_output_encrypt[0];
			next_init_vector_encrypt[1] <= data_output_encrypt[1];
			next_init_vector_encrypt[2] <= data_output_encrypt[2];
			next_init_vector_encrypt[3] <= data_output_encrypt[3];
			
			next_status_reg[0] <= 1'b1;
		end
		
        	endcase
		
	
	// DECRYPT STATE MACHINE	


		next_init_vector_decrypt[0] <= init_vector_decrypt[0];
		next_init_vector_decrypt[1] <= init_vector_decrypt[1];
		next_init_vector_decrypt[2] <= init_vector_decrypt[2];
		next_init_vector_decrypt[3] <= init_vector_decrypt[3];
		next_kld <= kld;
		next_state_d <= state_d;
		
		case(state_d)
		START_D: 
		begin
			if(latch_decrypt_q == 0 && latch_decrypt == 1)
				next_state_d <= LOAD_D;
		end
		
		LOAD_D: 
		begin
			next_state_d <= WAIT_D;
			next_status_reg[1] <= 1'b0;
			next_kld <= 1'b1;
		end
		
		WAIT_D: 
		begin
			next_kld <= 1'b0;
			if(done_decrypt == 1)
				next_state_d <= IV_D;
		end
		
		IV_D: 
		begin
			next_state_d <= START_D;
			
			next_init_vector_decrypt[0] <= data_input_decrypt[0];
			next_init_vector_decrypt[1] <= data_input_decrypt[1];
			next_init_vector_decrypt[2] <= data_input_decrypt[2];
			next_init_vector_decrypt[3] <= data_input_decrypt[3];
				
			next_status_reg[1] <= 1'b1;
		end
		
        endcase

	end	
	

	
	
endmodule		
  
  

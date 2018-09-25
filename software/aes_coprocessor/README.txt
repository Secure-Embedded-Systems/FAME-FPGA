Registers for accessing the AES coprocessor
| Read/Write | Name                     | Address Range [7:2] |
|------------|--------------------------|---------------------|
| R/W        | key_encrypt[0:3]         | 000000 to 000011    |
| R/W        | data_input_encrypt[0:3]  | 001000 to 001011    |
| R/W        | init_vector_encrypt[0:3] | 010000 to 010011    |
| R          | data_output_encrypt[0:3] | 011000 to 011011    |
| R/W        | key_decrypt[0:3]         | 000100 to 000111    |
| R/W        | data_input_decrypt[0:3]  | 001100 to 001111    |
| R/W        | init_vector_decrypt[0:3] | 010100 to 010111    |
| R          | data_output_decrypt[0:3] | 011100 to 011111    |
| R/W        | control_reg              | 100000              |
| R          | status_reg               | 100001              |

The data, key and initialization registers are four 32-bit registers, making it 128-bit. The way to fill them up is that the Most significant 32 bits out of 128 go into the [0] register. Eg - data_input_encrypt[0] should be filled with data[127:96] and data_input_encrypt[3] should be filled with data[31:0]. The same convention should be followed for the key and initialization vector. Also, the output data should be read and arranged in the same convention.

Data Input Register - data_input_encrypt[0:3]/data_input_decrypt[0:3]
[0]   	  [1]   	  [2]	      [3]
31 ---- 0	31 ---- 0	31 ---- 0	31 ---- 0
data[127:96]	data[95:64]	data[63:32]	data[31:0]
Here, the 128-bit data will be plaintext in the case of encryption and ciphertext in case od decryption.

Key Input Register - key_encrypt[0:3]/key_decrypt[0:3]
[0]	[1]	[2]	[3]
31 ---- 0	31 ---- 0	31 ---- 0	31 ---- 0
key[127:96]	key[95:64]	key[63:32]	key[31:0]

Initialization Vector Input Register - init_vector_encrypt[0:3]/init_vector_decrypt[0:3]
[0]	[1]	[2]	[3]
31 ---- 0	31 ---- 0	31 ---- 0	31 ---- 0
init_vector[127:96]	init_vector[95:64]	init_vector[63:32]	init_vector[31:0]

Data Output Register - data_output_encrypt[0:3]/data_output_decrypt[0:3]
[0]	[1]	[2]	[3]
31 ---- 0	31 ---- 0	31 ---- 0	31 ---- 0
data_out[127:96]	data_out[95:64]	data_out[63:32]	data_out[31:0]
Once the status register shows that the encryption/decryption is complete, this register can be read to obtain the ciphertext/plaintext. Care should be taken that the registers are read and arranged to form the 128-bit data_out in the way shown above.

Control Register
31 - - - - - - - - - - - - - - - - - - - - 2	1	0
---	DEC_start	ENC_start
DEC_start: This bit can be used to start the decryption process. Once the input data(ciphertext), key and the initialization vector are filled up, this bit has to be set to '1' and then reset to '0' to start the decryption. Both setting and resetting have to be done through software.

ENC_start: This bit can be used to start the encryption process. Once the input data(plaintext), key and the initialization vector are filled up, this bit has to be set to '1' and then reset to '0' to start the decryption. Both setting and resetting have to be done through software.

Status Register
31 - - - - - - - - - - - - - - - - - - - - 2	1	0
---	DEC_done	ENC_done
DEC_done: This bit is used to monitor if the decryption process is done. Once the decryption process is completed, the coprocessor will assert this bit to 1. The software has to wait till this bit is changed to 1 before it reads out the output data.

ENC_done: This bit is used to monitor if the encryption process is done. Once the encryption process is completed, the coprocessor will assert this bit to 1. The software has to wait till this bit is changed to 1 before it reads out the output data.

Operation in CBC mode
The coprocessor supports continuous CBC encryption/decryption.
For such an operation, the initialization vector has to be loaded at the start along with the key.
After the first block is encrypted, the software just has to provide the next block of data and start the encryption/decryption. The Initialization vector register should not be changed at this point. To start encryption/decryption for the next block, the corresponding start bit in the control register should be set to '1' and the reset.
After every encryption/decryption process, the output should be read and stored. The coprocessor will not store or retain the output if the next encryption/decryption process has started.
Note: The coprocessor always stores the previous output in the init_vector_encrypt register after every encryption process and the previous input in the init_vector_decrypt register after every decryption process.

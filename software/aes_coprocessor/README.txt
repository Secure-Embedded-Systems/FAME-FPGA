Registers for accessing the AES coprocessor

Register Map

0 	 key_encrypt[127: 96]
1 	 key_encrypt[ 95: 64]
2 	 key_encrypt[ 63: 32]
3 	 key_encrypt[ 31:  0]

4 	 key_decrypt[127: 96]
5 	 key_decrypt[ 95: 64]
6 	 key_decrypt[ 63: 32]
7 	 key_decrypt[ 31:  0]

8	 data_input_encrypt[127: 96]
9	 data_input_encrypt[ 95: 64]
10	 data_input_encrypt[ 63: 32]
11	 data_input_encrypt[ 31:  0]

12	 data_input_decrypt[127: 96]
13	 data_input_decrypt[ 95: 64]
14	 data_input_decrypt[ 63: 32]
15	 data_input_decrypt[ 31:  0]

16	 init_vector_encrypt[127: 96]
17	 init_vector_encrypt[ 95: 64]
18	 init_vector_encrypt[ 63: 32]
19	 init_vector_encrypt[ 31:  0]

20	 init_vector_decrypt[127: 96]
21	 init_vector_decrypt[ 95: 64]
22	 init_vector_decrypt[ 63: 32]
23	 init_vector_decrypt[ 31:  0]

24	 data_output_encrypt[127: 96]
25	 data_output_encrypt[ 95: 64]
26	 data_output_encrypt[ 63: 32]
27	 data_output_encrypt[ 31:  0]

28	 data_output_decrypt[127: 96]
29	 data_output_decrypt[ 95: 64]
30	 data_output_decrypt[ 63: 32]
31	 data_output_decrypt[ 31:  0]

32	 control_reg
33	 status_reg

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

The data, key and initialization registers are four 32-bit registers,
making it 128-bit. The way to fill them up is that the Most
significant 32 bits out of 128 go into the [0] register. Eg -
data_input_encrypt[0] should be filled with data[127:96] and
data_input_encrypt[3] should be filled with data[31:0]. The same
convention should be followed for the key and initialization
vector. Also, the output data should be read and arranged in the same
convention.

Control Register

bit 1 DEC_start
bit 0 ENC_start

DEC_start: This bit can be used to start the decryption process. Once
the input data(ciphertext), key and the initialization vector are
filled up, this bit has to be set to '1' and then reset to '0' to
start the decryption. Both setting and resetting have to be done
through software.

ENC_start: This bit can be used to start the encryption process. Once
the input data(plaintext), key and the initialization vector are
filled up, this bit has to be set to '1' and then reset to '0' to
start the decryption. Both setting and resetting have to be done
through software.

Status Register

bit 1 DEC_done
bit 0 ENC_done

DEC_done: This bit is used to monitor if the decryption process is
done. Once the decryption process is completed, the coprocessor will
assert this bit to 1. The software has to wait till this bit is
changed to 1 before it reads out the output data.

ENC_done: This bit is used to monitor if the encryption process is
done. Once the encryption process is completed, the coprocessor will
assert this bit to 1. The software has to wait till this bit is
changed to 1 before it reads out the output data.

Operation in CBC mode

The coprocessor supports continuous CBC encryption/decryption.

For such an operation, the initialization vector has to be loaded at
the start along with the key.  After the first block is encrypted, the
software just has to provide the next block of data and start the
encryption/decryption. The Initialization vector register should not
be changed at this point. To start encryption/decryption for the next
block, the corresponding start bit in the control register should be
set to '1' and the reset.

After every encryption/decryption process, the output should be read
and stored. The coprocessor will not store or retain the output if the
next encryption/decryption process has started.  Note: The coprocessor
always stores the previous output in the init_vector_encrypt register
after every encryption process and the previous input in the
init_vector_decrypt register after every decryption process.

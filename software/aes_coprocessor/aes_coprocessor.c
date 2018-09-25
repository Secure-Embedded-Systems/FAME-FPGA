#include <stdio.h>

#define AES_BASE_ADDR 0x80013000

static volatile int *coprocessor_base_ptr;

  
main()
{
	int i, read_data_0, read_data_1, read_data_2, read_data_3;


	//ENCRYPT
		
	coprocessor_base_ptr = AES_BASE_ADDR;
	coprocessor_base_ptr[0] = 0x00000000;	//key_encrypt_0
	coprocessor_base_ptr[1] = 0x00000000;	//key_encrypt_1
	coprocessor_base_ptr[2] = 0x00000000;	//key_encrypt_2
	coprocessor_base_ptr[3] = 0x00000000;	//key_encrypt_3
	
	coprocessor_base_ptr[8] = 0xFFFFFFFF;	//data_encrypt_0
	coprocessor_base_ptr[9] = 0xFFFFFFFF;	//data_encrypt_1
	coprocessor_base_ptr[10] = 0xFFFFFFFF;	//data_encrypt_2
	coprocessor_base_ptr[11] = 0xFFFFFFFF;	//data_encrypt_3
	
	coprocessor_base_ptr[16] = 0x00000000;	//init_vector_encrypt_0
	coprocessor_base_ptr[17] = 0x00000000;	//init_vector_encrypt_1
	coprocessor_base_ptr[18] = 0x00000000;	//init_vector_encrypt_2
	coprocessor_base_ptr[19] = 0x00000000;	//init_vector_encrypt_3
	
	coprocessor_base_ptr[32] = 0x00000001;	//control_register
	//for(i = 0; i < 10; i++); 
	coprocessor_base_ptr[32] = 0x00000000;	//control_register
	
	//for(i = 0; i < 1000; i++); 
	while(coprocessor_base_ptr[33] != 0x00000001);

	read_data_0 = coprocessor_base_ptr[24];
	read_data_1 = coprocessor_base_ptr[25];
	read_data_2 = coprocessor_base_ptr[26];
	read_data_3 = coprocessor_base_ptr[27];

	
	printf("AES output = %08x \n", read_data_0);
	printf("AES output = %08x \n", read_data_1);
	printf("AES output = %08x \n", read_data_2);
	printf("AES output = %08x \n", read_data_3);


	coprocessor_base_ptr[32] = 0x00000001;	//control_register
	//for(i = 0; i < 10; i++); 
	coprocessor_base_ptr[32] = 0x00000000;	//control_register
	
	//for(i = 0; i < 1000; i++); 
	while(coprocessor_base_ptr[33] != 0x00000001);

	read_data_0 = coprocessor_base_ptr[24];
	read_data_1 = coprocessor_base_ptr[25];
	read_data_2 = coprocessor_base_ptr[26];
	read_data_3 = coprocessor_base_ptr[27];

	
	printf("AES output = %08x \n", read_data_0);
	printf("AES output = %08x \n", read_data_1);
	printf("AES output = %08x \n", read_data_2);
	printf("AES output = %08x \n", read_data_3);


	//DECRYPT
	/*coprocessor_base_ptr = AES_BASE_ADDR;
	coprocessor_base_ptr[4] = 0x00000000;	//key_encrypt_0
	coprocessor_base_ptr[5] = 0x00000000;	//key_encrypt_1
	coprocessor_base_ptr[6] = 0x00000000;	//key_encrypt_2
	coprocessor_base_ptr[7] = 0x00000000;	//key_encrypt_3
	
	coprocessor_base_ptr[12] = 0xFFFFFFFF;	//data_encrypt_0
	coprocessor_base_ptr[13] = 0xFFFFFFFF;	//data_encrypt_1
	coprocessor_base_ptr[14] = 0xFFFFFFFF;	//data_encrypt_2
	coprocessor_base_ptr[15] = 0xFFFFFFFF;	//data_encrypt_3
	
	coprocessor_base_ptr[20] = 0x00000000;	//init_vector_encrypt_0
	coprocessor_base_ptr[21] = 0x00000000;	//init_vector_encrypt_1
	coprocessor_base_ptr[22] = 0x00000000;	//init_vector_encrypt_2
	coprocessor_base_ptr[23] = 0x00000000;	//init_vector_encrypt_3
	
	coprocessor_base_ptr[32] = 0x00000002;	//control_register : start decryption
	//for(i = 0; i < 10; i++); 
	coprocessor_base_ptr[32] = 0x00000000;	//control_register : reset decryption bit
	
	//for(i = 0; i < 1000; i++); 
	while(coprocessor_base_ptr[33] != 0x00000002); //status register : wait for decryption done
	
	
	read_data_0 = coprocessor_base_ptr[28];
	read_data_1 = coprocessor_base_ptr[29];
	read_data_2 = coprocessor_base_ptr[30];
	read_data_3 = coprocessor_base_ptr[31];

	
	printf("AES output = %08x \n", read_data_0);
	printf("AES output = %08x \n", read_data_1);
	printf("AES output = %08x \n", read_data_2);
	printf("AES output = %08x \n", read_data_3);


	coprocessor_base_ptr[32] = 0x00000002;	//control_register
	//for(i = 0; i < 10; i++); 
	coprocessor_base_ptr[32] = 0x00000000;	//control_register
	
	//for(i = 0; i < 1000; i++); 
	while(coprocessor_base_ptr[33] != 0x00000002);

	read_data_0 = coprocessor_base_ptr[28];
	read_data_1 = coprocessor_base_ptr[29];
	read_data_2 = coprocessor_base_ptr[30];
	read_data_3 = coprocessor_base_ptr[31];

	
	printf("AES output = %08x \n", read_data_0);
	printf("AES output = %08x \n", read_data_1);
	printf("AES output = %08x \n", read_data_2);
	printf("AES output = %08x \n", read_data_3);
*/

}

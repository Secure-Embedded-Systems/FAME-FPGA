/*#include <stdio.h>

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
	
	coprocessor_base_ptr[32] = 0x00000001;	//control_register: start encryption
	//for(i = 0; i < 10; i++); 
	coprocessor_base_ptr[32] = 0x00000000;	//control_register: reset encryption bit
	
	//for(i = 0; i < 1000; i++); 
	while(coprocessor_base_ptr[33] != 0x00000001); //Wait for encryption done

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
	coprocessor_base_ptr = AES_BASE_ADDR;
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
}
*/


#include <stdio.h>

//#define AES_BASE_ADDR 0x80013000
//
//struct coprocessorreg {
//	volatile unsigned int encrypt_key0;
//	volatile unsigned int encrypt_key1;
//	volatile unsigned int encrypt_key2;
//	volatile unsigned int encrypt_key3;
//
//	volatile unsigned int decrypt_key0;
//	volatile unsigned int decrypt_key1;
//	volatile unsigned int decrypt_key2;
//	volatile unsigned int decrypt_key3;
//
//	volatile unsigned int encrypt_data0;
//	volatile unsigned int encrypt_data1;
//	volatile unsigned int encrypt_data2;
//	volatile unsigned int encrypt_data3;
//
//	volatile unsigned int decrypt_data0;
//	volatile unsigned int decrypt_data1;
//	volatile unsigned int decrypt_data2;
//	volatile unsigned int decrypt_data3;
//	
//
//	volatile unsigned int encrypt_init_vector0;
//	volatile unsigned int encrypt_init_vector1;
//	volatile unsigned int encrypt_init_vector2;
//	volatile unsigned int encrypt_init_vector3;
//	
//	volatile unsigned int decrypt_init_vector0;
//	volatile unsigned int decrypt_init_vector1;
//	volatile unsigned int decrypt_init_vector2;
//	volatile unsigned int decrypt_init_vector3;
//
//	volatile unsigned int out_data0;
//	volatile unsigned int out_data1;
//	volatile unsigned int out_data2;
//	volatile unsigned int out_data3;
//	
//	volatile unsigned int out_data4;
//	volatile unsigned int out_data5;
//	volatile unsigned int out_data6;
//	volatile unsigned int out_data7;
//
//	
//	volatile unsigned int control;
//	volatile unsigned int status;
//};
//
//struct coprocessorreg *ptr = (struct coprocessorreg *)AES_BASE_ADDR;
//
//void aes_input_key(char key[16], int encrypt_decrypt) //Function to take input key
//{
//	if(encrypt_decrypt)
//	{
//		ptr->encrypt_key3 = *((unsigned int *)key);
//		ptr->encrypt_key2 = *((unsigned int *)(key+4));
//		ptr->encrypt_key1 = *((unsigned int *)(key+8));
//		ptr->encrypt_key0 = *((unsigned int *)(key+12));
//		printf("\nKey values are %x %x %x %x\n", ptr->encrypt_key3, ptr->encrypt_key2, ptr->encrypt_key1, ptr->encrypt_key0);
//	}
//	else
//	{
//		ptr->decrypt_key3 = *((unsigned int *)key);
//		ptr->decrypt_key2 = *((unsigned int *)(key+4));
//		ptr->decrypt_key1 = *((unsigned int *)(key+8));
//		ptr->decrypt_key0 = *((unsigned int *)(key+12));
//		printf("\nKey values are %x %x %x %x\n", ptr->decrypt_key3, ptr->decrypt_key2, ptr->decrypt_key1, ptr->decrypt_key0);
//	}
//
//	
//}
//
//void aes_input_data(char data[16], int encrypt_decrypt)	//Function to take input data
//{	
//	if(encrypt_decrypt)
//	{
//		ptr->encrypt_data3 = *((unsigned int *)data);
//		ptr->encrypt_data2 = *((unsigned int *)(data+4));
//		ptr->encrypt_data1 = *((unsigned int *)(data+8));
//		ptr->encrypt_data0 = *((unsigned int *)(data+12));
//		printf("\nData values are %x %x %x %x\n", ptr->encrypt_data3, ptr->encrypt_data2, ptr->encrypt_data1, ptr->encrypt_data0);
//	}
//	else 
//	{
//		ptr->decrypt_data3 = *((unsigned int *)data);
//		ptr->decrypt_data2 = *((unsigned int *)(data+4));
//		ptr->decrypt_data1 = *((unsigned int *)(data+8));
//		ptr->decrypt_data0 = *((unsigned int *)(data+12));
//		printf("\nData values are %x %x %x %x\n", ptr->decrypt_data3, ptr->decrypt_data2, ptr->decrypt_data1, ptr->decrypt_data0);
//	}
//	
//}
//
//char* aes_output_data(int encrypt_decrypt)	//Function to read output plain/cipher text 
//{
//	
//	int read_data_0,read_data_1,read_data_2,read_data_3;
//	if(encrypt_decrypt==1) 
//	{
//		while(ptr->status != 0x00000001);	//Wait till encryption done
//		read_data_0 = ptr->out_data0;
//		read_data_1 = ptr->out_data1;
//		read_data_2 = ptr->out_data2;
//		read_data_3 = ptr->out_data3;
////		printf("AES output = %08x \n", read_data_0);
////		printf("AES output = %08x \n", read_data_1);
////		printf("AES output = %08x \n", read_data_2);
////		printf("AES output = %08x \n", read_data_3);
//		return (char*)ptr+96;
//	}
//
//	else 
//	{
//		while(ptr->status != 0x00000002);	//wait till decryption done
//	
//		read_data_0 = ptr->out_data4;
//		read_data_1 = ptr->out_data5;
//		read_data_2 = ptr->out_data6;
//		read_data_3 = ptr->out_data7;
////		printf("AES output = %08x \n", read_data_0);
////		printf("AES output = %08x \n", read_data_1);
////		printf("AES output = %08x \n", read_data_2);
////		printf("AES output = %08x \n", read_data_3);
//		return (char*)ptr+112;
//	}
//
//}
//
//
//
//
//void aes_start_encrypt_decrypt(int encrypt_decrypt)	//Function to start encryption/decryption
//{
//	if(encrypt_decrypt==1)
//		ptr->control = 0x00000001;	//control_register: start encryption
//	else 
//		ptr->control = 0x00000002;	//control_register : start decryption
//	//for(i = 0; i < 10; i++); 
//	ptr->control = 0x00000000;	//control_register: reset encryption bit
//
//}

main()
{
	int i; char j;
	unsigned int *output_aes;
	unsigned int output_keymill[128];
	char key[16];
	char input[16];
	for(j=0; j<16;j++)
		key[j] = 0;
	for(j=0; j<16;j++)
		input[j] = 0;

	
//	for(i=0;i<16;i++)
//		printf("\nChar value %d : %c ", i, key[i]);
//	aes_input_key(key,0);
//	aes_input_data(input,0);
//	aes_start_encrypt_decrypt(0);
//	output = (unsigned int*)aes_output_data(0);
//	if(output[0]==0x140F0F10 && output[1]==0x11B5223D && output[2]==0x79587717 && 0xFFD9EC3A)
//		printf("AES decrypt test passed\n");
//	else {
//		printf("AES decrypt test failed\n");
//		printf("AES output_check = %08x \n", output[0]);
//		printf("AES output_check = %08x \n", output[1]);
//		printf("AES output_check = %08x \n", output[2]);
//		printf("AES output_check = %08x \n", output[3]);
//	}
	
	printf("Testing AES coprocessor: Encrypt operation\n");
	aes_input_key(key,1);
	aes_input_data(input,1);
	aes_start_encrypt_decrypt(1);
	output_aes = (unsigned int*)aes_output_data(1);
	printf("AES cipher text word1 = %08x \n", output_aes[0]);
	printf("AES cipher text word2 = %08x \n", output_aes[1]);
	printf("AES cipher text word3 = %08x \n", output_aes[2]);
	printf("AES cipher text word4 = %08x \n", output_aes[3]);
	if(output_aes[0]==0x66e94bd4 && output_aes[1]==0xef8a2c3b && output_aes[2]==0x884cfa59 && output_aes[3]==0xca342b2e)
		printf("AES encryption test passed\n");
	else printf("AES encryption test failed\n");
	
	printf("\nTesting Keymill coprocessor\n");
	for(j=0; j<16;j++)
		key[j] = 'A'+j;
	for(j=0; j<16;j++)
		input[j] = 'B';

	reset_keymill();
	keymill_input_key(key);
	keymill_input_iv(input);
	start_keymill();
	//output_keymill = keymill_output();
	for(i=0;i<4;i++)
	{
		output_keymill[i] = keymill_output();
		printf("\nKeymill output %d : %x", i, output_keymill[i]);
	}

	if(output_keymill[0]==0x9bfca94c && output_keymill[1]==0x97905985 && output_keymill[2]==0xf4f42682 && output_keymill[3]==0xe7e70483)
		printf("\nKeymill test passed\n");
	else printf("\nKeymill test failed\n");

}

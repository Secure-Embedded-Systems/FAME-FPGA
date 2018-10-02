//API for using the AES coprocessor in FAMEv2
/* Following is a sample main program for using this API
main()
{
	int i; char j;
	unsigned int *output;
	char key[16];
	char input[16];
	for(j=0; j<16;j++)
		key[j] = 0;
	for(j=0; j<16;j++)
		input[j] = 0;

	int encrypt_decrypt = 0;	
	aes_input_key(key,encrypt_decrypt);
	aes_input_data(input,encrypt_decrypt);
	aes_start_encrypt_decrypt(encrypt_decrypt);
	output = (unsigned int*)aes_output_data(encrypt_decrypt);
	printf("AES output_check = %08x \n", output[0]);
	printf("AES output_check = %08x \n", output[1]);
	printf("AES output_check = %08x \n", output[2]);
	printf("AES output_check = %08x \n", output[3]);

}
*/

#include <stdio.h>

#define AES_BASE_ADDR 0x80013000

struct coprocessorreg {
	volatile unsigned int encrypt_key0;
	volatile unsigned int encrypt_key1;
	volatile unsigned int encrypt_key2;
	volatile unsigned int encrypt_key3;

	volatile unsigned int decrypt_key0;
	volatile unsigned int decrypt_key1;
	volatile unsigned int decrypt_key2;
	volatile unsigned int decrypt_key3;

	volatile unsigned int encrypt_data0;
	volatile unsigned int encrypt_data1;
	volatile unsigned int encrypt_data2;
	volatile unsigned int encrypt_data3;

	volatile unsigned int decrypt_data0;
	volatile unsigned int decrypt_data1;
	volatile unsigned int decrypt_data2;
	volatile unsigned int decrypt_data3;
	

	volatile unsigned int encrypt_init_vector0;
	volatile unsigned int encrypt_init_vector1;
	volatile unsigned int encrypt_init_vector2;
	volatile unsigned int encrypt_init_vector3;
	
	volatile unsigned int decrypt_init_vector0;
	volatile unsigned int decrypt_init_vector1;
	volatile unsigned int decrypt_init_vector2;
	volatile unsigned int decrypt_init_vector3;

	volatile unsigned int out_data0;
	volatile unsigned int out_data1;
	volatile unsigned int out_data2;
	volatile unsigned int out_data3;
	
	volatile unsigned int out_data4;
	volatile unsigned int out_data5;
	volatile unsigned int out_data6;
	volatile unsigned int out_data7;

	
	volatile unsigned int control;
	volatile unsigned int status;
};

struct coprocessorreg *ptr = (struct coprocessorreg *)AES_BASE_ADDR;

void aes_input_key(char key[16], int encrypt_decrypt) //Function to take input key
{
	if(encrypt_decrypt)
	{
		ptr->encrypt_key3 = *((unsigned int *)key);
		ptr->encrypt_key2 = *((unsigned int *)(key+4));
		ptr->encrypt_key1 = *((unsigned int *)(key+8));
		ptr->encrypt_key0 = *((unsigned int *)(key+12));
		printf("\nKey values are %x %x %x %x\n", ptr->encrypt_key3, ptr->encrypt_key2, ptr->encrypt_key1, ptr->encrypt_key0);
	}
	else
	{
		ptr->decrypt_key3 = *((unsigned int *)key);
		ptr->decrypt_key2 = *((unsigned int *)(key+4));
		ptr->decrypt_key1 = *((unsigned int *)(key+8));
		ptr->decrypt_key0 = *((unsigned int *)(key+12));
		printf("\nKey values are %x %x %x %x\n", ptr->decrypt_key3, ptr->decrypt_key2, ptr->decrypt_key1, ptr->decrypt_key0);
	}

	
}

void aes_input_data(char data[16], int encrypt_decrypt)	//Function to take input data
{	
	if(encrypt_decrypt)
	{
		ptr->encrypt_data3 = *((unsigned int *)data);
		ptr->encrypt_data2 = *((unsigned int *)(data+4));
		ptr->encrypt_data1 = *((unsigned int *)(data+8));
		ptr->encrypt_data0 = *((unsigned int *)(data+12));
		printf("\nData values are %x %x %x %x\n", ptr->encrypt_data3, ptr->encrypt_data2, ptr->encrypt_data1, ptr->encrypt_data0);
	}
	else 
	{
		ptr->decrypt_data3 = *((unsigned int *)data);
		ptr->decrypt_data2 = *((unsigned int *)(data+4));
		ptr->decrypt_data1 = *((unsigned int *)(data+8));
		ptr->decrypt_data0 = *((unsigned int *)(data+12));
		printf("\nData values are %x %x %x %x\n", ptr->decrypt_data3, ptr->decrypt_data2, ptr->decrypt_data1, ptr->decrypt_data0);
	}
	
}

char* aes_output_data(int encrypt_decrypt)	//Function to read output plain/cipher text 
{
	
	int read_data_0,read_data_1,read_data_2,read_data_3;
	if(encrypt_decrypt==1) 
	{
		while(ptr->status != 0x00000001);	//Wait till encryption done
		read_data_0 = ptr->out_data0;
		read_data_1 = ptr->out_data1;
		read_data_2 = ptr->out_data2;
		read_data_3 = ptr->out_data3;
//		printf("AES output = %08x \n", read_data_0);
//		printf("AES output = %08x \n", read_data_1);
//		printf("AES output = %08x \n", read_data_2);
//		printf("AES output = %08x \n", read_data_3);
		return (char*)ptr+96;
	}

	else 
	{
		while(ptr->status != 0x00000002);	//wait till decryption done
	
		read_data_0 = ptr->out_data4;
		read_data_1 = ptr->out_data5;
		read_data_2 = ptr->out_data6;
		read_data_3 = ptr->out_data7;
//		printf("AES output = %08x \n", read_data_0);
//		printf("AES output = %08x \n", read_data_1);
//		printf("AES output = %08x \n", read_data_2);
//		printf("AES output = %08x \n", read_data_3);
		return (char*)ptr+112;
	}

}




void aes_start_encrypt_decrypt(int encrypt_decrypt)	//Function to start encryption/decryption
{
	if(encrypt_decrypt==1)
		ptr->control = 0x00000001;	//control_register: start encryption
	else 
		ptr->control = 0x00000002;	//control_register : start decryption
	//for(i = 0; i < 10; i++); 
	ptr->control = 0x00000000;	//control_register: reset encryption bit

}

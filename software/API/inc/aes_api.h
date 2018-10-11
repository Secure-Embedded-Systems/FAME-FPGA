#include <stdio.h>

#define AES_BASE_ADDR 0x80013000

typedef struct {
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
}aes_reg;



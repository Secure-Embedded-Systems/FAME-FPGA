#include <stdio.h>
main()
{
	int i; char j;
	unsigned int *output_aes;
	unsigned int output_keymill[128];
	
	//Initialize key and plain_text
	char key[16];
	char input[16];
	for(j=0; j<16;j++)
		key[j] = 0;
	for(j=0; j<16;j++)
		input[j] = 0;

	printf("Testing AES coprocessor: Encrypt operation\n");
	aes_input_key(key,1);	//Send key
	aes_input_data(input,1);//Send plain text
	aes_start_encrypt_decrypt(1);//Start encryption
	output_aes = (unsigned int*)aes_output_data(1);//Get cipher text
	printf("AES cipher text word1 = %08x \n", output_aes[0]);
	printf("AES cipher text word2 = %08x \n", output_aes[1]);
	printf("AES cipher text word3 = %08x \n", output_aes[2]);
	printf("AES cipher text word4 = %08x \n", output_aes[3]);
	if(output_aes[0]==0x66e94bd4 && output_aes[1]==0xef8a2c3b && output_aes[2]==0x884cfa59 && output_aes[3]==0xca342b2e)
		printf("AES encryption test passed\n");
	else printf("AES encryption test failed\n");
	
	printf("\nTesting Keymill coprocessor\n");
	//Initialize key and initialization vector
	for(j=0; j<16;j++)
		key[j] = 'A'+j;
	for(j=0; j<16;j++)
		input[j] = 'B';

	reset_keymill();//SW reset keymill
	keymill_input_key(key);//Send key
	keymill_input_iv(input);//Send initialization vector
	start_keymill();//Start keymill
	//output_keymill = keymill_output();
	for(i=0;i<4;i++)
	{
		output_keymill[i] = keymill_output();//Get keys generated from keymill
		printf("\nKeymill output %d : %x", i, output_keymill[i]);
	}

	if(output_keymill[0]==0x9bfca94c && output_keymill[1]==0x97905985 && output_keymill[2]==0xf4f42682 && output_keymill[3]==0xe7e70483)
		printf("\nKeymill test passed\n");
	else printf("\nKeymill test failed\n");

}

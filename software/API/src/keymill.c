/* API for L-R Keymill coprocessor
Following is sample code for using this API

void main()
{

	int i; char j;
	unsigned int output;
	char key[16];
	char input[16];
	for(j=0; j<16;j++)
		key[j] = 'A'+j;
	for(j=0; j<16;j++)
		input[j] = 'B';
	
	reset_keymill();
	keymill_input_key(key);
	keymill_input_iv(input);
	start_keymill();
	//output = keymill_output();
	for(i=0;i<128;i++)
	{
		output = keymill_output();
		printf("\nKeymill output %d : %u", i, output);
	}
}
*/


#include "keymill.h"
keymill_reg *ptr = (keymill_reg *)KEYMILL_BASE_ADDR;

void keymill_input_key(char key[16]) //Function to take input key
{
		ptr->input_key0 = *((unsigned int *)key);
		ptr->input_key1 = *((unsigned int *)(key+4));
		ptr->input_key2 = *((unsigned int *)(key+8));
		ptr->input_key3 = *((unsigned int *)(key+12));
		printf("\nKey values are %x %x %x %x\n", ptr->input_key0, ptr->input_key1, ptr->input_key2, ptr->input_key3);
}

void keymill_input_iv(char iv[16]) //Function to take input key
{
		ptr->input_iv0 = *((unsigned int *)iv);
		ptr->input_iv1 = *((unsigned int *)(iv+4));
		ptr->input_iv2 = *((unsigned int *)(iv+8));
		ptr->input_iv3 = *((unsigned int *)(iv+12));
		printf("\nInit_vector values are %x %x %x %x\n", ptr->input_iv0, ptr->input_iv1, ptr->input_iv2, ptr->input_iv3);
}

void start_keymill() //Function to start the key generation
{
	ptr->keymill_control = 0x00000001;
}

void reset_keymill() //Software reset keymill
{
	ptr->keymill_control = 0x00000002;
}

unsigned int keymill_output() //Get 32b output from keymill
{	
	unsigned int output;
	int i;
	while((ptr->keymill_control & 0x80000000) != 0);
	
	for(i=0;i<4; i++)
	{ 
		while((ptr->keymill_control & 0x40000000) != 0);
		output = ptr->output;
	}
	return output;
}




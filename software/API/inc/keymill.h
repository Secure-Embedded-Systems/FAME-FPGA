#include <stdio.h>

#define KEYMILL_BASE_ADDR 0x80014000

typedef struct {
	volatile unsigned int keymill_control;
	
	volatile unsigned int input_key0;
	volatile unsigned int input_key1;
	volatile unsigned int input_key2;
	volatile unsigned int input_key3;
 	
	volatile unsigned int input_iv0;
	volatile unsigned int input_iv1;
	volatile unsigned int input_iv2;
	volatile unsigned int input_iv3;
	
	volatile unsigned int dummy;
	
	volatile unsigned int output;
}keymill_reg;

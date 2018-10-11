/* API for APBUART peripheral
void main()
{	
	volatile long long cnt;
	init_uart();
	for(cnt=0;cnt<100;cnt++)
		put_char('A');
	printf("input_char: %c",get_char());
	char test[] = "Tarun";
	put_string(test,5);
	char* output = (char*)malloc(5);
	get_string(output,5);
	for(cnt=0; cnt<5;cnt++)
	printf("input_string: %c",output[cnt]);
	free(output);
}	
*/

#include "uart.h"

uart_reg *ptr = (uart_reg *)UART_BASE_ADDR;

void init_uart()
{
	ptr->data = 0; //Clear the data register
	ptr->scaler = (SYS_CLK*1000000)/(BAUDRATE*8+7);//Set scaler value according to system clock and baudrate
	ptr->control = 0x3;	//Enable transmitter and receiver
}

void set_baudrate(int baudrate)
{
	ptr->scaler = (SYS_CLK*1000000)/(baudrate*8+7);

}

void put_char(char a)
{
	while(ptr->status & (1<<9)); //Wait if transmission fifo is full
	ptr->data = a;
}

char get_char()
{
	while(!(ptr->status & 0x1)); //Wait till data ready
	return ptr->data; 

}

void put_string(char* input_string, int size)
{
	int i;
	for(i=0;i<size;i++)
	{
		put_char(input_string[i]);
	}	
}

void get_string(char* output_string,int size)
{
	int i;
	for(i=0;i<size;i++)
	{	
		output_string[i] = get_char();
	}
}	



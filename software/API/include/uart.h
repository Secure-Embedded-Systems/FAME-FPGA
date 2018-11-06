#include <stdio.h>
#define BAUDRATE 38400
#define SYS_CLK 50
#define UART_BASE_ADDR 0x80000100

typedef struct {
	volatile unsigned int data;
	volatile unsigned int status;
	volatile unsigned int control;
	volatile unsigned int scaler;
	volatile unsigned int fifo_debug;
}uart_reg;

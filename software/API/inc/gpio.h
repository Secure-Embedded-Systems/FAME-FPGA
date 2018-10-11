#include <stdio.h>

#define GPIO_BASE_ADDR 0x80000500
#define NUM_GPIO 8
typedef struct {
	volatile unsigned int din;
	volatile unsigned int dout;
	volatile unsigned int dir;
	volatile unsigned int imask;
	volatile unsigned int level;
	volatile unsigned int edge;
	volatile unsigned int bypass;
	volatile unsigned int reserved;
	volatile unsigned int irqmap;
}gpio_reg;

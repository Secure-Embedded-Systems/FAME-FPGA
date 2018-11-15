#include "gpio.h"
#include <stdio.h>

/* GPIO demo program
   GPIO ports are pin mapped to the GPIO header as well as LEDs on the FPGA board
   This program will test the GPIO pins by blinking LEDS on the FPGA board
*/

typedef enum {
PIN0,
PIN1,
PIN2,
PIN3,
PIN4,
PIN5,
PIN6,
PIN7} GPIO_PINS;

typedef enum {
INPUT,
OUTPUT} PIN_DIRECTION;

void wait()
{
volatile long long cnt;
for(cnt=0;cnt<1000000;cnt++);
}

int main() {
 int i,j;
 unsigned int gpiovalue;
 volatile long long cnt, cnt2;
 
 //Blink LED connected to GPIO[2] 10 times
 set_gpio_pin_dir(PIN2,OUTPUT);
 for(i=0;i<10;i++) {
	set_gpio_pin_output(PIN2,1);
	wait();
	set_gpio_pin_output(PIN2,0);
	wait();
 }
 
 //Set all GPIO pins as ouputs
 set_gpio_dir(OUTPUT);
 
 //Rotate through all the GPIO pins
 for (i=0; i<5; i++) {
	gpiovalue=0x1;
	set_gpio_output(gpiovalue);
	for(j=0; j<8; j++) {
		wait();
		gpiovalue = gpiovalue << 1;
		set_gpio_output(gpiovalue);
	}
 }
}

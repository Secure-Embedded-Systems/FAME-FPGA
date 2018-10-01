/*
API for measuring execution time using GPTIMER peripheral of GRLIB.
Sample API call:
timer_start();
//Insert code here
printf("Ticks executed= %ul", timer_stop());
*/

#include <stdio.h>
#define ADDR 0x80000600 
struct timerreg {
    volatile unsigned int counter;		/* 0x0 */
    volatile unsigned int reload;		/* 0x4 */
    volatile unsigned int control;		/* 0x8 */
    volatile unsigned int dummy;		/* 0xC */
};

struct gptimer {
    volatile unsigned int scalercnt;		/* 0x00 */
    volatile unsigned int scalerload;		/* 0x04 */
    volatile unsigned int configreg;		/* 0x08 */
    volatile unsigned int dummy1;		/* 0x0C */
    struct timerreg timer[7];
};

struct gptimer *lr = (struct gptimer *) ADDR;
#define RESOLUTION 100
#define MAX_VALUE 0xFFFFFFFF


void timer_start()
{
        int ntimers;
	volatile int counter=0;

	ntimers = lr->configreg & 0x7; //Find number of counters configured.

	lr->scalerload = RESOLUTION;   //Load prescaler with clock division factor
	lr->scalercnt = RESOLUTION;    //This division factor is also the reolution
	lr->timer[0].control = 0;
	lr->timer[0].counter = MAX_VALUE; //Load counter0 with largest 32 bit value
	lr->timer[0].reload = MAX_VALUE;  //Also set the reload value to largest 32 bit value
	lr->timer[0].control = 0x3;	  //Enable timer0 

}

unsigned long int timer_stop()
{
	lr->timer[0].control = 0;	//Disable timer0
	unsigned long int exec_tics = (unsigned long int)(MAX_VALUE - lr->timer[0].counter) * RESOLUTION;
	lr->timer[0].control = 0x4;     //Reset timer0 to original value
	return exec_tics;

}

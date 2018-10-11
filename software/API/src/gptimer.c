#include "gptimer.h"
gptimer *lr = (gptimer *) ADDR;
unsigned long int count=MAX_VALUE;
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
	lr->timer[0].control = 0xf;	  //Enable timer0 

}

unsigned long int timer_stop()
{
	lr->timer[0].control = 0;	//Disable timer0
	unsigned long int exec_tics = (unsigned long int)(MAX_VALUE - lr->timer[0].counter) * RESOLUTION;
	lr->timer[0].control = 0x4;     //Reset timer0 to original value
	return exec_tics;

}

unsigned long int timerlap()
{
	unsigned long int lap;
	if(count==MAX_VALUE)
	{
		lr->scalerload = RESOLUTION;   //Load prescaler with clock division factor
		lr->scalercnt = RESOLUTION;    //This division factor is also the reolution
		lr->timer[0].control = 0;
		lr->timer[0].counter = MAX_VALUE; //Load counter0 with largest 32 bit value
		lr->timer[0].reload = MAX_VALUE;  //Also set the reload value to largest 32 bit value
		lr->timer[0].control = 0xf;	  //Enable timer0 
	}
	
	lap = (unsigned long int) (count - lr->timer[0].counter) * RESOLUTION;
	count = lr->timer[0].counter;
	return lap;
}

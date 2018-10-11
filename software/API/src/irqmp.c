/*API for the Interrupt controller (IRQMP)
Sample code for using the API along with gptimer API. 
Initialize the timer with a small value and wait for underrun and interrupt to be generated
void main()
{
timer_start();
while(check_pending_interrupts()==0);
printf("interrupts value : %x", check_pending_interrupts());
}
*/

#include "irqmp.h"
irqmp_reg *ptr = (irqmp_reg *)IRQMP_BASE_ADDR;

void init_irqmp()
{
	ptr->level = 0; 		//Set all interrupts to have level0
	ptr->mask = 0;			//Mask all interrupts at init
	ptr->clear = 0xFFFFFFFE;	//Clear all interrupts
}

void set_interrupt_level(unsigned int interrupt, unsigned int level) //Set a certain interrupt to level 1 or 0
{
	if(level==1)
		ptr->level |= (1<<interrupt) ;
	else if(level==0)
		ptr->level &= ~(1<<interrupt);

}

void force_interrupt(unsigned int interrupt) // Force a certain interrupt
{
	ptr->force |= (1<<interrupt);	

}

char clear_interrupt(unsigned int interrupt) //Clear a certain interrupt
{
	ptr->clear |= (1<<interrupt);

}

void mask_interrupt(unsigned int interrupt) //Mask a certain interrupt
{
	ptr->mask &= ~(1<<interrupt);
}

unsigned int check_pending_interrupts() //Check the status of the interrupt register
{
	return ptr->pending;	

}

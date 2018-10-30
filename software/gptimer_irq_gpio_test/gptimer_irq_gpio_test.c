#include <stdio.h>


main()
{
 int i=0;
 int cnt;
 int irq_value;
 unsigned int gpio_output=0x0;
 for (i=0;i<8;i++)
 {
 	set_gpio_dir(i,1);//Set all gpio directions to ouptut
 }
 
 timer_init(0x0FFFFFFF); // Initialize timer to 0x0FFFFFFF and start the timer
 while(check_pending_interrupts()==0)//Keep checking until we have timer underflow and an interrupt is generated
 {
		set_gpio_pin_output(0,1);	//Toggle the first GPIO/LED
		for(cnt=0;cnt<1000000;cnt++);
		set_gpio_pin_output(0,0);	//Toggle the first GPIO/LED
		for(cnt=0;cnt<1000000;cnt++);
 }
 irq_value=check_pending_interrupts();
 printf("interrupts value : %x", irq_value);
 if(irq_value==0x100)
	printf("\nGPTIMER IRQ GPIO test passed\n");
}

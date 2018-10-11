#include "gpio.h"
gpio_reg *ptr = (gpio_reg *)GPIO_BASE_ADDR;

void set_gpio_dir(unsigned int gpio_num, unsigned int dir)	//Set the direction of an individual gpio pin
{
	if(gpio_num < NUM_GPIO) 
	{
		if(dir==0)
			ptr->dir = ptr->dir & (0x0 << gpio_num);
		else if(dir==1)
			ptr->dir = ptr->dir | (0x1 << gpio_num);
	}

}

void set_gpio_pin_output(unsigned int gpio_num, unsigned int value)	//Set the output of an individual gpio pin
{
	if(gpio_num < NUM_GPIO) 
	{
		if(value==0)
			ptr->dout = ptr->dout & (0x0 << gpio_num);
		else if(value==1)
			ptr->dout = ptr->dout | (0x1 << gpio_num);
	}
}

void set_gpio_output(unsigned int value)	//Set the output of all gpio pins
{
	if(value < (0x1<<NUM_GPIO)) 
	{
		ptr->dout = value;
	}
}

unsigned int get_gpio_pin_input(unsigned int gpio_num)	//Get the input from an individual gpio pin
{
	if(gpio_num < NUM_GPIO)
		return ptr->din >> gpio_num; 
}

unsigned int get_gpio_input()	//Get the input from all gpio pins
{
	return ptr->din; 
}

#include "gpio.h"

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
} gpio_reg;

void set_gpio_dir(unsigned int gpio_num, unsigned int dir) {
  gpio_reg *ptr = (gpio_reg *)GPIO_BASE_ADDR;
  if(gpio_num < NUM_GPIO) {
    if(dir==0)
      ptr->dir = ptr->dir & (0x0 << gpio_num);
    else if(dir==1)
      ptr->dir = ptr->dir | (0x1 << gpio_num);
  }
}

void set_gpio_pin_output(unsigned int gpio_num, unsigned int value) {
  gpio_reg *ptr = (gpio_reg *)GPIO_BASE_ADDR;
  if(gpio_num < NUM_GPIO)  {
      if(value==0)
	ptr->dout = ptr->dout & (0x0 << gpio_num);
      else if(value==1)
	ptr->dout = ptr->dout | (0x1 << gpio_num);
    }
}

void set_gpio_output(unsigned int value) {
  gpio_reg *ptr = (gpio_reg *)GPIO_BASE_ADDR;
  if(value < (0x1<<NUM_GPIO)) {
    ptr->dout = value;
  }
}

unsigned int get_gpio_pin_input(unsigned int gpio_num) {
  gpio_reg *ptr = (gpio_reg *)GPIO_BASE_ADDR;
  if(gpio_num < NUM_GPIO)
    return ptr->din >> gpio_num; 
  return 0;
}

unsigned int get_gpio_input() {
  gpio_reg *ptr = (gpio_reg *)GPIO_BASE_ADDR;
  return ptr->din; 
}

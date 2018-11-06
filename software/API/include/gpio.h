#ifndef GPIO_H
#define GPIO_H

void set_gpio_dir(unsigned int gpio_num, unsigned int dir);
void set_gpio_pin_output(unsigned int gpio_num, unsigned int value);
void set_gpio_output(unsigned int value);
unsigned int get_gpio_pin_input(unsigned int gpio_num);
unsigned int get_gpio_input();

#endif
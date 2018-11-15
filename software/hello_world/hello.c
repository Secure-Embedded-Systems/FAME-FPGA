#include <stdio.h>
#include "uart.h"

//int __bcc_con_outbyte(char c) {
//  put_char_uart(c);
//}

void main() {
  unsigned i;
  init_uart();
  for (i=0; i<20; i++) {
    printf("Hello World %d\n", i);
  }
}

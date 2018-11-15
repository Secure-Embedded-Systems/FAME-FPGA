#include <stdio.h>
#include "gptimer.h"

void main() {
  unsigned long t1, t2;
  volatile unsigned i;
  unsigned r;
  volatile unsigned result;

  timer_start();
  
  while (1) {
    t1 = timer_lap();    
    r = 0;
    for (i=0; i<100; i++) {
      r += i;
    }
    result = r;
    t2 = timer_lap();
    printf("300 empty iterations take %d ticks (%d cycles)\n", t2, t2*10);
  }
  
    
}

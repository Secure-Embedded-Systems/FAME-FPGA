#include <stdio.h>
#include "gptimer.h"

void main() {
  unsigned long t1, t2;
  volatile unsigned i;
  unsigned r;
  volatile unsigned result;
  
  printf("Number of timers %d\n", ntimers());
  
  timer_start();
  
  printf("Hello World\n");

  t1 = timer_lap();
  r = 0;
  for (i=0; i<100; i++)
    r += i;
  result = r;
  t2 = timer_lap();

  printf("100 empty iterations take %lx\n", t2);
  
  t1 = timer_lap();
  r = 0;
  for (i=0; i<100; i++)
    r += i;
  result = r;
  t2 = timer_lap();

  printf("100 empty iterations take %lx\n", t2);
  
  t1 = timer_lap();
  r = 0;
  for (i=0; i<100; i++)
    r += i;
  result = r;
  t2 = timer_lap();

  printf("100 empty iterations take %lx\n", t2);

  timer_stop();
  
  t1 = timer_lap();
  r = 0;
  for (i=0; i<100; i++)
    r += i;
  result = r;
  t2 = timer_lap();

  printf("timer stopped; 100 empty iterations take %lx\n", t2);

  timer_start();
  
  t1 = timer_lap();
  r = 0;
  for (i=0; i<500; i++)
    r += i;
  result = r;
  t2 = timer_lap();

  printf("500 empty iterations take %lx\n", t2);
    
}

#include <stdio.h>
#include "uart.h"
#include "gptimer.h"

int __bcc_con_outbyte(char c) {
  put_char_uart(c);
}

void gcdtop(unsigned a3,
            unsigned a2,
            unsigned a1,
            unsigned a0,
            unsigned b3,
            unsigned b2,
            unsigned b1,
            unsigned b0,
            unsigned start,
	    unsigned rst,
            unsigned *q3,
            unsigned *q2,
            unsigned *q1,
            unsigned *q0,
            unsigned *done);

void transpose(unsigned a[32], unsigned b[32]) {
  unsigned bit, word;
  for (word = 0; word < 32; word++)
    b[word] = 0;
  for (bit = 0; bit < 32; bit++) 
    for (word = 0; word < 32; word++) 
      b[bit] = b[bit] | (( (a[word] & (1 << bit)) >> bit) << word);
}

unsigned gcd(unsigned a, unsigned b) {
  while (a != b) {
    if (a > b)
      a = a - b;
    else
      b = b - a;
  }
  return a;
}

void main() {
  unsigned cnt;
  unsigned long t1, t2;
  
  init_uart();
  timer_start();

  t1 = timer_lap();
  
  unsigned dataa[32] =
    { 8 , // 1
      2 ,
      3 ,
      4 ,
      5 ,
      5 ,
      5 ,
      5 , // 8
      5 ,
      5 ,
      6 ,
      7 ,
      8 ,
      9 ,
     10 ,
     12 , // 16
     13 ,
     14 ,
     15 ,
      2 ,
      3 ,
      4 ,
      5 ,
      6 , // 24
      7 ,
      8 ,
      9 ,
     10 ,
     12 ,
     14 ,
     15 ,
     10 }; // 32

  unsigned datab[32] =
    {( 13 ), // 1
     ( 1 ),
     ( 1 ),
     ( 1 ),
     ( 1 ),
     ( 8 ),
     ( 9 ),
     (10 ), // 8
     (11 ),
     (12 ),
     (12 ),
     (12 ),
     (13 ),
     (14 ),
     (15 ),
     (15 ), // 16
     (15 ),
     (15 ),
     (15 ),
     (15 ),
     (15 ),
     (15 ),
     (15 ),
     (15 ), // 24
     (15 ),
     (15 ),
     (15 ),
     (11 ),
     (13 ),
     (15 ),
     (14 ),
     ( 5 )}; // 32
  
  unsigned result[32];

  t2 = timer_lap();
  for (cnt=0; cnt<31; cnt++)
    result[cnt] = gcd(dataa[cnt], datab[cnt]);
  t2 = timer_lap();

  printf("32 GCDs computed in %lx\n", t2);

}


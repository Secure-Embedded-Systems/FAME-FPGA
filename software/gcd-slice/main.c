#include <stdio.h>
#include "uart.h"
#include "gptimer.h"

//int __bcc_con_outbyte(char c) {
//  put_char_uart(c);
//}

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

void main() {
  unsigned cnt;
  unsigned long t1, t2;

  init_uart();
  timer_start();

  unsigned data[32] =
    { 8 + ( 13 << 4), // 1
      2 + ( 1 << 4),
      3 + ( 1 << 4),
      4 + ( 1 << 4),
      5 + ( 1 << 4),
      5 + ( 8 << 4),
      5 + ( 9 << 4),
      5 + (10 << 4), // 8
      5 + (11 << 4),
      5 + (12 << 4),
      6 + (12 << 4),
      7 + (12 << 4),
      8 + (13 << 4),
      9 + (14 << 4),
     10 + (15 << 4),
     12 + (15 << 4), // 16
     13 + (15 << 4),
     14 + (15 << 4),
     15 + (15 << 4),
      2 + (15 << 4),
      3 + (15 << 4),
      4 + (15 << 4),
      5 + (15 << 4),
      6 + (15 << 4), // 24
      7 + (15 << 4),
      8 + (15 << 4),
      9 + (15 << 4),
     10 + (11 << 4),
     12 + (13 << 4),
     14 + (15 << 4),
     15 + (14 << 4),
     10 + ( 5 << 4)}; // 32

  unsigned tdata[32];

  t2 = timer_lap();
  transpose(data, tdata);
  t2 = timer_lap();
  printf("Transpose %lx\n", t2);
  
  //  for (cnt=0; cnt<32; cnt++)
  //    printf("%5d %8x %8x\n", cnt, data[cnt], tdata[cnt]);

  unsigned start, rst, done;
  unsigned q[32] = {0,0,0,0,0,0,0,0,
		    0,0,0,0,0,0,0,0,
		    0,0,0,0,0,0,0,0,
		    0,0,0,0,0,0,0,0};

  t1 = timer_lap();
  done = 0;
  cnt = 0;
  while ((cnt < 5) || (done != -1)) {
	  
    rst   = (cnt==0) ? 0xffffffff : 0;
    start = (cnt==1) ? 0xffffffff : 0;
    
    gcdtop(tdata[3], // a3
	   tdata[2], // a2
	   tdata[1], // a1
	   tdata[0], // a0
	   tdata[7], // b3
	   tdata[6], // b2
	   tdata[5], // b1
	   tdata[4], // b0
	   start,
	   rst,
	   &(q[3]),
	   &(q[2]),
	   &(q[1]),
	   &(q[0]),
	   &done);
	   
	cnt++;
  }
  t2 = timer_lap();
  printf("32 bitsliced GCDs computed in %lx\n", t2);

  t1 = timer_lap();
  transpose(q, tdata);
  t2 = timer_lap();
  printf("Transport computed in %lx\n", t2);
  
  //  for (cnt=0; cnt<32; cnt++)
  //    printf("%5d %8x %8x\n", cnt, q[cnt], tdata[cnt]);

}


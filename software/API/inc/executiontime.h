/*
API for measuring execution time using GPTIMER peripheral of GRLIB.
Sample API call:
timer_start();
//Insert code here
printf("Ticks executed= %ul", timer_stop());
*/

#include <stdio.h>
#define ADDR 0x80000600 
typedef struct {
    volatile unsigned int counter;		/* 0x0 */
    volatile unsigned int reload;		/* 0x4 */
    volatile unsigned int control;		/* 0x8 */
    volatile unsigned int dummy;		/* 0xC */
}timerreg;

typedef struct {
    volatile unsigned int scalercnt;		/* 0x00 */
    volatile unsigned int scalerload;		/* 0x04 */
    volatile unsigned int configreg;		/* 0x08 */
    volatile unsigned int dummy1;		/* 0x0C */
    timerreg timer[7];
}gptimer;

#define RESOLUTION 100
#define MAX_VALUE 0xFFFFFFFF

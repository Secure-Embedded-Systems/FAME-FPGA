#include <stdio.h>
#define IRQMP_BASE_ADDR 0x80000200

typedef struct {
	volatile unsigned int level;
	volatile unsigned int pending;
	volatile unsigned int force;
	volatile unsigned int clear;
	volatile unsigned int multiproc_status;
	volatile unsigned int broadcast;
	volatile unsigned int error_mode;
	volatile unsigned int dummy1[10];
	volatile unsigned int mask;
}irqmp_reg;

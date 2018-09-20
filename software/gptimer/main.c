
#include <stdio.h>
#include "testmod.h"

#ifndef GRLIB_REPORTDEV_WIDTH
/* Use 32 for AHBREP or GRTESTMOD with 32-bit width */
#define GRLIB_REPORTDEV_WIDTH 32
#endif

#if GRLIB_REPORTDEV_WIDTH == 32
#define REPORTDEV_OFFSET 1
typedef int testmod_type;
#elif GRLIB_REPORTDEV_WIDTH == 64
#define REPORTDEV_OFFSET 1
typedef long long testmod_type;
#else
#define REPORTDEV_OFFSET 2
typedef short testmod_type;
#endif

#ifndef GRLIB_REPORTDEV_BASE
#define GRLIB_REPORTDEV_BASE 0x20000000
#endif

int fails = 0;

volatile testmod_type *grtestmod = (volatile testmod_type *) GRLIB_REPORTDEV_BASE;
static void grtestmod_write(r,v)
{
	grtestmod[r*REPORTDEV_OFFSET] = v;
}

fail(int dev)
{
    fails++;
	grtestmod_write(1,dev);
    printf("Note: failed %d\n",dev);
	return(0);
}

int main()
{
    gptimer_test(GRLIB_REPORTDEV_BASE, 0x8);
    if (fails)
    {
        printf("# ** Note: %d TESTS FAILED\n", fails);
    }
    else
    {
        printf("# ** Note: ALL gptimer TESTS PASSED\n");
    }

    return 0;
}



#include <stdio.h>

int main() {
//	printf("\n\n\nhello world!\n\nhello!\n\n");
	
	int A = 0x88ffffff;
	int B = 0x00000000;
	int tibs_res; // aaaaaaaa
	int y_tibs; // 8080aaaa
	int invtibs_res; // 0fff0000
	int y_invtibs; // afff0000

	// put shares in one variable (TIBS)
	asm volatile ("mov %4, %%l0\n\t"  // %l0 = A
					"mov %5, %%l1\n\t"  // %l1 = B
					".word 0xa4ec0011\n\t"  // TIBS %l0, %l1, %l2
					"mov %%l2, %0\n\t"
					"rd %%y, %1\n\t" // y_tibs = %y
					".word 0xa4cc0011\n\t"  // INVTIBS %l0, %l1, %l2
					"mov %%l2, %2\n\t"
					"rd %%y, %3\n\t" // y_invtibs = %y
					: "=r" (tibs_res), "=r" (y_tibs), "=r" (invtibs_res), "=r" (y_invtibs)
					: "r" (A), "r" (B)
					: "%l0", "%l1", "%l2", "%l3"
					);


	printf("tibs_res = %08x\n\n", tibs_res);
	printf("y_tibs = %08x\n\n", y_tibs);
	printf("invtibs_res = %08x\n\n", invtibs_res);
	printf("y_invtibs = %08x\n\n", y_invtibs);


	A = 0xABCDEF01;
	B = 0xCCCCCCCC;
	int andor_res; // should be AACCEE88
	int orand_res; // should be CDCDCD45
	int red2; // should be 0xEF01EF01 
	int y2; // y = 0xABCDABCD
	int red3; // should be 0x10FEEF01 
	int y3; // y = 0x5432ABCD
	int red4; // 0x01010101
	int y4; // y = 0xEFEFEFEF
	int red5; // 0xFE01FE01 
	int y5; // y = 0x10EF10EF
	int red6; // 0xCDCDCDCD
	int y6; // y = 0xABABABAB
	int red7; // 0x32CD32CD // y = 0x54AB54AB
	int y7; // y = 0x54AB54AB

	asm volatile (
		"mov %2, %%l0\n\t" // %l0 = A
		"mov %3, %%l1\n\t" // %l1 = B
		".word 0xa5640011\n\t" // ANDOR %l0, %l1, %l2
		"mov %%l2, %0\n\t" // andor_es = %l2
		".word 0xa56c0011\n\t" // ORAND %l0, %l1, %l2
		"mov %%l2, %1\n\t" // orand_es = %l2
		: "=r" (andor_res), "=r" (orand_res)
		: "r" (A), "r" (B)
		: "%l0", "%l1", "%l2"
		);

	asm volatile (
		"mov %12, %%l0\n\t" // %l0 = A
		".word 0xa46c2002\n\t" // RED %l0, 2, %l2
		"mov %%l2, %0\n\t" // red2 = %l2
		"rd %%y, %6\n\t" // y2 = %y
		".word 0xa46c2003\n\t" // RED %l0, 3, %l2
		"mov %%l2, %1\n\t" // red3 = %l2
                "rd %%y, %7\n\t" // y3 = %y
		".word 0xa46c2004\n\t" // RED %l0, 4, %l2
		"mov %%l2, %2\n\t" // red4 = %l2        
	        "rd %%y, %8\n\t" // y4 = %y
		".word 0xa46c2005\n\t" // RED %l0, 5, %l2
		"mov %%l2, %3\n\t" // red5 = %l2
                "rd %%y, %9\n\t" // y5 = %y
		".word 0xa46c2006\n\t" // RED %l0, 6, %l2
		"mov %%l2, %4\n\t" // red6 = %l2
                "rd %%y, %10\n\t" // y6 = %y
		".word 0xa46c2007\n\t" // RED %l0, 7, %l2
		"mov %%l2, %5\n\t" // red7 = %l2
                "rd %%y, %11\n\t" // y7 = %y
		: "=r" (red2), "=r" (red3), "=r" (red4), "=r" (red5), "=r" (red6), "=r" (red7), "=r" (y2), "=r" (y3), "=r" (y4), "=r" (y5), "=r" (y6), "=r" (y7)
		: "r" (A)
		: "%l0", "%l1", "%l2"
		);

	printf("andor_res = %08x\n", andor_res);
	printf("orand_res = %08x\n\n", orand_res);
	printf("red2 = %08x\n\n", red2);
	printf("y2 = %08x\n\n", y2);
	printf("red3 = %08x\n\n", red3);
	printf("y3 = %08x\n\n", y3);
	printf("red4 = %08x\n\n", red4);
	printf("y4 = %08x\n\n", y4);
	printf("red5 = %08x\n\n", red5);
	printf("y5 = %08x\n\n", y5);
	printf("red6 = %08x\n\n", red6);
	printf("y6 = %08x\n\n", y6);
	printf("red7 = %08x\n\n", red7);
	printf("y7 = %08x\n\n", y7);

	A = 0x66666666;
	int rot2_res; // should be 0x99999999
	int rot4_res; // should be 0xcccccccc

	asm volatile (
		"mov %2, %%l0\n\t" // %l0 = A
		".word 0xa24c2002\n\t" // TIBS %l0, 2, %l1
		"mov %%l1, %0\n\t" // rot2_res = %l1
		".word 0xa24c2004\n\t" // TIBS %l0, 4, %l1
		"mov %%l1, %1\n\t" // rot4_res = %l1
		: "=r" (rot2_res), "=r" (rot4_res)
		: "r" (A)//, "r" (B)
		: "%l0", "%l1"
		);

	printf("rot2_res = %08x\n", rot2_res);
	printf("rot4_res = %08x\n\n", rot4_res);


	A = 0xAA55AA55;
	int ftchk2; // 0x00000000
	int ftchk3; // 0x0000FFFF
	int ftchk4; // 0x000000FF
	int ftchk5; // 0x00000000
        int ftchk10; // 0xFFFF0000
        int ftchk11; // 0x0000FFFF
        int ftchk12; // 0x00FF00FF
        int ftchk13; // 0xFF00FF00

	asm volatile (
		"mov %4, %%l0\n\t" // %l0 = A
		".word 0xa3742002\n\t" // FTCHK %l0, 2, %l1
		"mov %%l1, %0\n\t" // ftchk2 = %l1
		".word 0xa3742003\n\t" // FTCHK %l0, 3, %l1
		"mov %%l1, %1\n\t" // ftchk3 = %l1
		".word 0xa3742004\n\t" // FTCHK %l0, 4, %l1
		"mov %%l1, %2\n\t" // ftchk4 = %l1
		".word 0xa3742005\n\t" // FTCHK %l0, 5, %l1
		"mov %%l1, %3\n\t" // ftchk5 = %l1
		: "=r" (ftchk2), "=r" (ftchk3), "=r" (ftchk4), "=r" (ftchk5)
		: "r" (A)//, "r" (B)
		: "%l0", "%l1"
		);

	asm volatile (
                "mov %4, %%l0\n\t" // %l0 = A
                ".word 0xa374200a\n\t" // FTCHK %l0, 2, %l1
                "mov %%l1, %0\n\t" // ftchk2 = %l1
                ".word 0xa374200b\n\t" // FTCHK %l0, 3, %l1
                "mov %%l1, %1\n\t" // ftchk3 = %l1
                ".word 0xa374200c\n\t" // FTCHK %l0, 4, %l1
                "mov %%l1, %2\n\t" // ftchk4 = %l1
                ".word 0xa374200d\n\t" // FTCHK %l0, 5, %l1
                "mov %%l1, %3\n\t" // ftchk5 = %l1
                : "=r" (ftchk10), "=r" (ftchk11), "=r" (ftchk12), "=r" (ftchk13)
                : "r" (A)//, "r" (B)
                : "%l0", "%l1"
                );

	printf("ftchk2 = %08x\n", ftchk2);
	printf("ftchk3 = %08x\n", ftchk3);
	printf("ftchk4 = %08x\n", ftchk4);
	printf("ftchk5 = %08x\n", ftchk5);
        printf("ftchk10 = %08x\n", ftchk10);
        printf("ftchk11 = %08x\n", ftchk11);
        printf("ftchk12 = %08x\n", ftchk12);
        printf("ftchk13 = %08x\n\n", ftchk13);






	A = 0xF0F0F0F0;
	B = 0xCCCCCCCC;
	int andc8; // should be fcc0fcc0
	int andc16; // should be fcfcc0c0
	int xorc8; // should be c33cc33c
	int xorc16; // should be c3c33c3c
	int xnorc8; // 3cc33cc3
	int xnorc16; // 3c3cc3c3

	asm volatile (
		"mov %2, %%l0\n\t" // %l0 = A
		"mov %3, %%l1\n\t" // %l1 = B
		".word 0xe4440011\n\t" // ANDC8 %l0, %l1, %l2
		"mov %%l2, %0\n\t" // andc8 = %l2
	//	"mov %2, %%l0\n\t" // %l0 = A
          //      "mov %3, %%l1\n\t" // %l1 = B
		".word 0xe45c0011\n\t" // ANDC16 %l0, %l1, %l2
		"mov %%l2, %1\n\t" // andc16 = %l2
		: "=r" (andc8), "=r" (andc16)
		: "r" (A), "r" (B)
		: "%l0", "%l1", "%l2"
		);

	asm volatile (
		"mov %2, %%l0\n\t" // %l0 = A
		"mov %3, %%l1\n\t" // %l1 = B
		".word 0xe4640011\n\t" // XORC8 %l0, %l1, %l2
		"mov %%l2, %0\n\t" // xorc8 = %l2
            //    "mov %2, %%l0\n\t" // %l0 = A
             //   "mov %3, %%l1\n\t" // %l1 = B
		".word 0xe4740011\n\t" // XORC16 %l0, %l1, %l2
		"mov %%l2, %1\n\t" // xorc16 = %l2
		: "=r" (xorc8), "=r" (xorc16)
		: "r" (A), "r" (B)
		: "%l0", "%l1", "%l2"
		);

	asm volatile (
		"mov %2, %%l0\n\t" // %l0 = A
		"mov %3, %%l1\n\t" // %l1 = B
		".word 0xe4c40011\n\t" // XNORC8 %l0, %l1, %l2
		"mov %%l2, %0\n\t" // xnorc8 = %l2
       //         "mov %2, %%l0\n\t" // %l0 = A
         //       "mov %3, %%l1\n\t" // %l1 = B
		".word 0xe4dc0011\n\t" // XNORC16 %l0, %l1, %l2
		"mov %%l2, %1\n\t" // xnorc16 = %l2
		: "=r" (xnorc8), "=r" (xnorc16)
		: "r" (A), "r" (B)
		: "%l0", "%l1", "%l2"
		);


	printf("andc8 = %08x\n", andc8);
	printf("andc16 = %08x\n\n", andc16);
	printf("xorc8 = %08x\n\n", xorc8);
	printf("xorc16 = %08x\n\n", xorc16);
	printf("xnorc8 = %08x\n\n", xnorc8);
	printf("xnorc16 = %08x\n\n", xnorc16);
	//printf("A = %08x\n\n", A);
	

	return 0;
}



void share2(unsigned a, unsigned r,
            unsigned *s1, unsigned *s2) {
  asm volatile ("xor     %2, %3, %%10     \n\t"
                "tibs    %%10, %3, %1     \n\t"
                "rd      %%y, %0          \n\t"
                : "=r" (*s1), "=r" (*s2)
                : "r"  (a),   "r"  (r)
                : "%10"
                );
}

void unshare2(unsigned s1, unsigned s2,
	      unsigned *a, unsigned *r) {
  asm volatile ("invtibs  %2, %3, %1      \n\t"
                "rd       %%y, %0           \n\t"
                "xor      %0, %1, %0      \n\t"
                : "=r" (*a), "=r" (*r)
                : "r"  (s1), "r"  (s2)
                :
                );
}

void share4(unsigned   a, unsigned   b, unsigned   c, unsigned   d,
	    unsigned *s1, unsigned *s2, unsigned *s3, unsigned *s4) {
  asm volatile ("xor     %4,   %5, %%10     \n\t"
                "xor     %%10, %6, %%10     \n\t"
                "xor     %%10, %7, %%10     \n\t"
                "tibs    %%10, %5, %%11     \n\t"
                "rd      %%y, %%10          \n\t"
                "tibs    %6,   %7, %%13     \n\t"
                "rd      %%y, %%12          \n\t"
                "tibs    %%10, %%12, %1     \n\t"
                "rd      %%y, %0            \n\t"
                "tibs    %%11, %%13, %3     \n\t"
                "rd      %%y, %2            \n\t"
                : "=r" (*s1), "=r" (*s2), "=r" (*s3), "=r" (*s4)
                : "r"  (a),   "r"  (b),   "r"  (c),   "r"  (d)
                : "%10", "%11", "%12", "%13"
                );
}

void unshare4(unsigned  s1, unsigned  s2, unsigned  s3, unsigned  s4,
  	      unsigned *a,  unsigned *b,  unsigned *c,  unsigned *d) {
  asm volatile ("invtibs %4, %6, %%11       \n\t"
                "rd      %%y, %%10          \n\t"
                "invtibs %5, %7, %%13       \n\t"
                "rd      %%y, %%12          \n\t"
		"invtibs %%10, %%11, %1     \n\t"
                "rd      %%y, %0            \n\t"
		"invtibs %%12, %%13, %3     \n\t"
                "rd      %%y, %2            \n\t"
		"xor     %0, %1, %0         \n\t"
		"xor     %0, %2, %0         \n\t"
		"xor     %0, %3, %0         \n\t"
                : "=r" (*a), "=r" (*b), "=r" (*c), "=r" (*d)
                : "r"  (s1),   "r"  (s2),   "r"  (s3),   "r"  (s4)
                : "%10", "%11", "%12", "%13"
                );
}

#include <stdio.h>

void main() {

  if (0) {
    unsigned a, r, s1, s2, b;
    // test for 2-share
    for (a=0x80000000; a!=0; a=a>>1) {
      r = 0xAAAAAAAA;
      b = a;
      share2(b, r, &s1, &s2);  
      printf(">> a %8x r %8x s1 %8x s2 %8x\n", b, r, s1, s2);  
      unshare2(s1, s2, &b, &r);
      printf("<< a %8x r %8x s1 %8x s2 %8x\n", b, r, s1, s2);
    }
  }

  unsigned a, b, c, d, q;
  unsigned s1, s2, s3, s4;
  
  for (q=0x80000000; q!=0; q=q>>1) {
    unsigned a = q;
    unsigned b = 0xBBBBBBBB;
    unsigned c = 0xCCCCCCCC;
    unsigned d = 0xDDDDDDDD;
    
    share4(a, b, c, d, &s1, &s2, &s3, &s4);
    printf(">> a  %8x b  %8x c  %8x d  %8x\n",  a,  b,  c,  d);
    printf("   s1 %8x s2 %8x s3 %8x s4 %8x\n", s1, s2, s3, s4);
    unshare4(s1, s2, s3, s4, &a, &b, &c, &d);
    printf("<< a  %8x b  %8x c  %8x d  %8x\n",  a,  b,  c,  d);
    printf("   s1 %8x s2 %8x s3 %8x s4 %8x\n", s1, s2, s3, s4);
  }

}

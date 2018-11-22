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



#include <stdio.h>

void main() {
  unsigned a, r, s1, s2, b;
  
  for (a=0x80000000; a!=0; a=a>>1) {
    r = 0xAAAAAAAA;
    b = a;
    share2(b, r, &s1, &s2);  
    printf(">> a %8x r %8x s1 %8x s2 %8x\n", b, r, s1, s2);  
    unshare2(s1, s2, &b, &r);
    printf("<< a %8x r %8x s1 %8x s2 %8x\n", b, r, s1, s2);
  }
  
}

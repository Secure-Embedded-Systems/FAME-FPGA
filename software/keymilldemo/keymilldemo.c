#include "keymill.h"
#include <stdio.h>

  /* Keymill test values: For the same initialization vector and secret key, 
     the same keystream is generated.
     test values for Keymill operation:
     KEY 2B7E1516 28AED2A6 ABF71588 09CF4F3C
     INITIALIZATION VECTOR 6BC1BEE2 2E409F96 E93D7E11 7393172A
     KEYSTREAM 54B140F6 E7DD283E CC2019FD 8FAA5BD9

*/
void show(char *s, unsigned a[4]) {
  unsigned cnt;
  printf("%s ", s);
  for (cnt = 0; cnt<4; cnt++)
    printf("%8X", a[cnt]);
  printf("\n");
}

unsigned diff(unsigned a[4], unsigned b[4]) {
  unsigned cnt, chk = 0;
  for (cnt = 0; cnt<4; cnt++)
    if (a[cnt] != b[cnt])
      chk++;
  return (chk > 0);
}

int main() {  
  unsigned key[4]    = {0x2B7E1516, 0x28AED2A6, 0xABF71588, 0x09CF4F3C};
  unsigned init_vector[4] = {0x6BC1BEE2, 0x2E409F96, 0xE93D7E11, 0x7393172A};
  unsigned output_keymill[4];
  unsigned keycheck[4]= {0x54b140f6, 0xe7dd283e, 0xcc2019fd, 0x8faa5bd9};
  int i;
  
  //------------ Keymill Test
 reset_keymill();//SW reset keymill
 keymill_input_key(key);//Send key
 keymill_input_iv(init_vector);//Send initialization vector
 start_keymill();//Start keymill
 
 for(i=0;i<4;i++)
 {
 	output_keymill[i] = keymill_output();//Get keys generated from keymill
 	printf("Keymill keystream word%d : %x\n", i, output_keymill[i]);
 }


  if (diff(output_keymill, keycheck)) {
    printf("Keymill test did not produce correct keys\n");
    show("GOT ", output_keymill);
    show("EXP ", keycheck);
  }
  else printf("Keymill test passed\n");
  
}

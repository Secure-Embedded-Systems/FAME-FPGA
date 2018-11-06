#include "aescoproc.h"
#include <stdio.h>

  /* test values for AES128 ECB

  KEY 2B7E1516 28AED2A6 ABF71588 09CF4F3C
    
PLAIN 6BC1BEE2 2E409F96 E93D7E11 7393172A
      AE2D8A57 1E03AC9C 9EB76FAC 45AF8E51
      30C81C46 A35CE411 E5FBC119 1A0A52EF
      F69F2445 DF4F9B17 AD2B417B E66C3710
   
CIPHR 3AD77BB4 0D7A3660 A89ECAF3 2466EF97
      F5D3D585 03B9699D E785895A 96FDBAAF
      43B1CD7F 598ECE23 881B00E3 ED030688
      7B0C785E 27E8AD3F 82232071 04725DD4
    
  */

  /* test values for AES128 CBC

  IV is 00010203 04050607 08090A0B 0C0D0E0F

  KEY   2B7E1516 28AED2A6 ABF71588 09CF4F3C

  PLAIN 6BC1BEE2 2E409F96 E93D7E11 7393172A
        AE2D8A57 1E03AC9C 9EB76FAC 45AF8E51
        30C81C46 A35CE411 E5FBC119 1A0A52EF
        F69F2445 DF4F9B17 AD2B417B E66C3710

CIPHER  7649ABAC 8119B246 CEE98E9B 12E9197D
        5086CB9B 507219EE 95DB113A 917678B2
        73BED6B8 E3C1743B 7116E69E 22229516
        3FF1CAA1 681FAC09 120ECA30 7586E1A7 
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
  unsigned plain1[4] = {0x6BC1BEE2, 0x2E409F96, 0xE93D7E11, 0x7393172A};
  unsigned plain2[4] = {0xAE2D8A57, 0x1E03AC9C, 0x9EB76FAC, 0x45AF8E51};   
  unsigned ecbct1[4] = {0x3AD77BB4, 0x0D7A3660, 0xA89ECAF3, 0x2466EF97};
  unsigned ecbct2[4] = {0xF5D3D585, 0x03B9699D, 0xE785895A, 0x96FDBAAF};
  unsigned tmp[4];
  unsigned cnt, chk;
  
  //------------ ECB encryption test
  aes_set_encrypt_key(key);
  aes_set_ecb_encrypt_data(plain1);
  aes_start_encrypt();
  while (! aes_done_encrypt()) ;

  aes_get_encrypt_data(tmp);

  if (diff(tmp, ecbct1)) {
    printf("ECB Encryption 1 fails\n");
    show("GOT ", tmp);
    show("EXP ", ecbct1);
  }
  
  aes_set_ecb_encrypt_data(plain2);
  aes_start_encrypt();
  while (! aes_done_encrypt()) ;

  aes_get_encrypt_data(tmp);

  if (diff(tmp, ecbct2)) {
    printf("ECB Encryption 2 fails\n");
    show("GOT ", tmp);
    show("EXP ", ecbct2);
  }
  
  //------------ ECB decryption test
  aes_set_decrypt_key(key);
  aes_set_decrypt_data(ecbct1);
  aes_start_decrypt();
  while (! aes_done_decrypt()) ;

  aes_get_ecb_decrypt_data(tmp);
  
  if (diff(tmp, plain1)) {
    printf("ECB Decryption 1 fails\n");
    show("GOT ", tmp);
    show("EXP ", plain1);
  }
  
  aes_set_decrypt_key(key);
  aes_set_decrypt_data(ecbct2);
  aes_start_decrypt();
  while (! aes_done_decrypt()) ;

  aes_get_ecb_decrypt_data(tmp);
  
  if (diff(tmp, plain2)) {
    printf("ECB Decryption 2 fails\n");
    show("GOT ", tmp);
    show("EXP ", plain2);
  }
  
}

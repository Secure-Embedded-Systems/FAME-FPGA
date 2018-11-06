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

int main() {
  
  int key[4]  = {0x2B7E1516, 0x28AED2A6, 0xABF71588, 0x09CF4F3C};
  int data[4] = {0x6BC1BEE2, 0x2E409F96, 0xE93D7E11, 0x7393172A};
  int iv[4]   = {0, 0, 0, 0};
  int odata[4];
  unsigned cnt;
  
  aes_set_encrypt_key(key);
  aes_set_encrypt_data(data);
  aes_set_encrypt_iv(iv);
  
  aes_start_encrypt();
  while (! aes_done_encrypt) ;

  aes_get_encrypt_data(odata);
  
  printf("KEY   ");
  for (cnt=0; cnt<4; cnt++) printf("%8X ", key[cnt]);
  printf("PLAIN ");
  for (cnt=0; cnt<4; cnt++) printf("%8X ", data[cnt]);
  printf("CIPHER ");
  for (cnt=0; cnt<4; cnt++) printf("%8X ", odata[cnt]);
  
}

#include <stdio.h>
#include "aes.h"

int main() {
  unsigned i;

  typedef unsigned char u8;
  u8 key[] = {0x00, 0x01, 0x02, 0x03,
	      0x04, 0x05, 0x06, 0x07,
	      0x08, 0x09, 0x0A, 0x0B,
	      0x0C, 0x0D, 0x0E, 0x0F};
  
  u8 txt[] = {0x00, 0x11, 0x22, 0x33,
	      0x44, 0x55, 0x66, 0x77,
	      0x88, 0x99, 0xAA, 0xBB,
	      0xCC, 0xDD, 0xEE, 0xFF};

  /* expected ciphertext: 69C4E0D86A7B0430D8CDB78070B4C55A */
  
  u8 dout[16];

  AES_KEY keyexp;

  AES_set_encrypt_key(key, 128, &keyexp);
  for (i=0; i<100; i++) {
    AES_encrypt(txt, dout, &keyexp);
  }

  for (i=0; i<16; i++)
    printf("%2x", dout[i]);
  printf("\n");

  return 0;
}

#include "aescoproc.h"

#define AES_BASE_ADDR 0x80013000

typedef enum {
  ENCRYPT_KEY0,
  ENCRYPT_KEY1,
  ENCRYPT_KEY2,
  ENCRYPT_KEY3,
  DECRYPT_KEY0,
  DECRYPT_KEY1,
  DECRYPT_KEY2,
  DECRYPT_KEY3,
  ENCRYPT_DATA0,
  ENCRYPT_DATA1,
  ENCRYPT_DATA2,
  ENCRYPT_DATA3,
  DECRYPT_DATA0,
  DECRYPT_DATA1,
  DECRYPT_DATA2,
  DECRYPT_DATA3,
  ENCRYPT_INIT_VECTOR0,
  ENCRYPT_INIT_VECTOR1,
  ENCRYPT_INIT_VECTOR2,
  ENCRYPT_INIT_VECTOR3,
  DECRYPT_INIT_VECTOR0,
  DECRYPT_INIT_VECTOR1,
  DECRYPT_INIT_VECTOR2,
  DECRYPT_INIT_VECTOR3,
  OUT_DATA0,
  OUT_DATA1,
  OUT_DATA2,
  OUT_DATA3,
  OUT_DATA4,
  OUT_DATA5,
  OUT_DATA6,
  OUT_DATA7,
  CONTROL,
  STATUS} AESREGID_T;

#define AESREG (((volatile unsigned *) AES_BASE_ADDR))

void aes_set_encrypt_key(unsigned d[4]) {
  AESREG[ENCRYPT_KEY0] = d[0];
  AESREG[ENCRYPT_KEY1] = d[1];
  AESREG[ENCRYPT_KEY2] = d[2];
  AESREG[ENCRYPT_KEY3] = d[3];
}

void aes_set_decrypt_key(unsigned d[4]) {
  AESREG[DECRYPT_KEY0] = d[0];
  AESREG[DECRYPT_KEY1] = d[1];
  AESREG[DECRYPT_KEY2] = d[2];
  AESREG[DECRYPT_KEY3] = d[3];
}

void aes_set_ecb_encrypt_data(unsigned d[4]) {
  // xor with IV because of bug in Verilog design
  AESREG[ENCRYPT_DATA0] = d[0] ^ AESREG[ENCRYPT_INIT_VECTOR0];
  AESREG[ENCRYPT_DATA1] = d[1] ^ AESREG[ENCRYPT_INIT_VECTOR1];
  AESREG[ENCRYPT_DATA2] = d[2] ^ AESREG[ENCRYPT_INIT_VECTOR2];
  AESREG[ENCRYPT_DATA3] = d[3] ^ AESREG[ENCRYPT_INIT_VECTOR3];
}

void aes_set_cbc_encrypt_data(unsigned d[4]) {
  AESREG[ENCRYPT_DATA0] = d[0];
  AESREG[ENCRYPT_DATA1] = d[1];
  AESREG[ENCRYPT_DATA2] = d[2];
  AESREG[ENCRYPT_DATA3] = d[3];
}

void aes_set_decrypt_data(unsigned d[4]) {
  AESREG[DECRYPT_DATA0] = d[0] ;
  AESREG[DECRYPT_DATA1] = d[1] ;
  AESREG[DECRYPT_DATA2] = d[2] ;
  AESREG[DECRYPT_DATA3] = d[3] ;
} 

void aes_set_encrypt_iv(unsigned d[4]) {
  // Verilog bug prevents direct programming of IV. We do it indirectly.
  // 1) decrypt IV vector
  // 2) extract ECB mode ciphertext
  // 3) encrypt ECB mode ciphertext
  unsigned t[4];
  aes_set_decrypt_data(d);
  aes_start_decrypt();
  while (!aes_done_decrypt());
  aes_get_ecb_decrypt_data(t);
  aes_set_ecb_encrypt_data(t);
  aes_start_encrypt();
  while (!aes_done_encrypt());
}

void aes_set_decrypt_iv(unsigned d[4]) {
  // Verilog bug prevents direct programming of IV. We do it indirectly.
  // 1) decrypt iv
  aes_set_decrypt_data(d);
  aes_start_decrypt();
  while (!aes_done_decrypt());
}

void aes_get_encrypt_data(unsigned data[4]) {
  data[0] = AESREG[OUT_DATA0];
  data[1] = AESREG[OUT_DATA1];
  data[2] = AESREG[OUT_DATA2];
  data[3] = AESREG[OUT_DATA3];
}

void aes_get_ecb_decrypt_data(unsigned data[4]) {
  // xor with IV because of bug in Verilog design
  data[0] = AESREG[OUT_DATA4] ^ AESREG[DECRYPT_INIT_VECTOR0];
  data[1] = AESREG[OUT_DATA5] ^ AESREG[DECRYPT_INIT_VECTOR1];
  data[2] = AESREG[OUT_DATA6] ^ AESREG[DECRYPT_INIT_VECTOR2];
  data[3] = AESREG[OUT_DATA7] ^ AESREG[DECRYPT_INIT_VECTOR3];
}

void aes_get_cbc_decrypt_data(unsigned data[4]) {
  data[0] = AESREG[OUT_DATA4];
  data[1] = AESREG[OUT_DATA5];
  data[2] = AESREG[OUT_DATA6];
  data[3] = AESREG[OUT_DATA7];
}

void aes_get_encrypt_iv(unsigned d[4]) {
  // xor with IV because of bug in Verilog design
  d[0] = AESREG[ENCRYPT_INIT_VECTOR0];
  d[1] = AESREG[ENCRYPT_INIT_VECTOR1];
  d[2] = AESREG[ENCRYPT_INIT_VECTOR2];
  d[3] = AESREG[ENCRYPT_INIT_VECTOR3];
}

void aes_get_decrypt_iv(unsigned d[4]) {
  // xor with IV because of bug in Verilog design
  d[0] = AESREG[DECRYPT_INIT_VECTOR0];
  d[1] = AESREG[DECRYPT_INIT_VECTOR1];
  d[2] = AESREG[DECRYPT_INIT_VECTOR2];
  d[3] = AESREG[DECRYPT_INIT_VECTOR3];
}

void     aes_start_encrypt() {
  AESREG[CONTROL] = 0x1;
  AESREG[CONTROL] = 0x0;
}

void     aes_start_decrypt() {
  AESREG[CONTROL] = 0x2;
  AESREG[CONTROL] = 0x0;
}

unsigned aes_done_encrypt() {
  return ((AESREG[STATUS] & 0x1) == 0x1);
}

unsigned aes_done_decrypt() {
  return ((AESREG[STATUS] & 0x2) == 0x2);
}


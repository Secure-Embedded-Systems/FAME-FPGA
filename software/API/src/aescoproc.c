#include "aescoproc.h"

#define AES_BASE_ADDR 0x80013000

typedef struct {
  volatile unsigned int encrypt_key0;
  volatile unsigned int encrypt_key1;
  volatile unsigned int encrypt_key2;
  volatile unsigned int encrypt_key3;
  
  volatile unsigned int decrypt_key0;
  volatile unsigned int decrypt_key1;
  volatile unsigned int decrypt_key2;
  volatile unsigned int decrypt_key3;
  
  volatile unsigned int encrypt_data0;
  volatile unsigned int encrypt_data1;
  volatile unsigned int encrypt_data2;
  volatile unsigned int encrypt_data3;
  
  volatile unsigned int decrypt_data0;
  volatile unsigned int decrypt_data1;
  volatile unsigned int decrypt_data2;
  volatile unsigned int decrypt_data3;
  
  
  volatile unsigned int encrypt_init_vector0;
  volatile unsigned int encrypt_init_vector1;
  volatile unsigned int encrypt_init_vector2;
  volatile unsigned int encrypt_init_vector3;
  
  volatile unsigned int decrypt_init_vector0;
  volatile unsigned int decrypt_init_vector1;
  volatile unsigned int decrypt_init_vector2;
  volatile unsigned int decrypt_init_vector3;
  
  volatile unsigned int out_data0;
  volatile unsigned int out_data1;
  volatile unsigned int out_data2;
  volatile unsigned int out_data3;
  
  volatile unsigned int out_data4;
  volatile unsigned int out_data5;
  volatile unsigned int out_data6;
  volatile unsigned int out_data7;
  
  
  volatile unsigned int control;
  volatile unsigned int status;
} aes_reg;

#define AESREGPTR (((volatile aes_reg *) AES_BASE_ADDR))

void aes_set_encrypt_key(int d[4]) {
  AESREGPTR->encrypt_key0 = d[0];
  AESREGPTR->encrypt_key1 = d[1];
  AESREGPTR->encrypt_key2 = d[2];
  AESREGPTR->encrypt_key3 = d[3];
}

void aes_set_decrypt_key(int d[4]) {
  AESREGPTR->decrypt_key0 = d[0];
  AESREGPTR->decrypt_key1 = d[1];
  AESREGPTR->decrypt_key2 = d[2];
  AESREGPTR->decrypt_key3 = d[3];
}

void aes_set_encrypt_data(int d[4]) {
  AESREGPTR->encrypt_data0 = d[0];
  AESREGPTR->encrypt_data1 = d[1];
  AESREGPTR->encrypt_data2 = d[2];
  AESREGPTR->encrypt_data3 = d[3];
}

void aes_set_decrypt_data(int d[4]) {
  AESREGPTR->decrypt_data0 = d[0];
  AESREGPTR->decrypt_data1 = d[1];
  AESREGPTR->decrypt_data2 = d[2];
  AESREGPTR->decrypt_data3 = d[3];
}

void aes_set_encrypt_iv(int d[4]) {
  AESREGPTR->encrypt_init_vector0 = d[0];
  AESREGPTR->encrypt_init_vector1 = d[1];
  AESREGPTR->encrypt_init_vector2 = d[2];
  AESREGPTR->encrypt_init_vector3 = d[3];
}

void aes_set_decrypt_iv(int d[4]) {
  AESREGPTR->decrypt_init_vector0 = d[0];
  AESREGPTR->decrypt_init_vector1 = d[1];
  AESREGPTR->decrypt_init_vector2 = d[2];
  AESREGPTR->decrypt_init_vector3 = d[3];
}

void aes_get_encrypt_data(int data[4]) {
  data[0] = AESREGPTR->out_data0;
  data[1] = AESREGPTR->out_data1;
  data[2] = AESREGPTR->out_data2;
  data[3] = AESREGPTR->out_data3;
}

void aes_get_decrypt_data(int data[4]) {
  data[0] = AESREGPTR->out_data4;
  data[1] = AESREGPTR->out_data5;
  data[2] = AESREGPTR->out_data6;
  data[3] = AESREGPTR->out_data7;
}

void     aes_start_encrypt() {
  AESREGPTR->control = 0x1;
  AESREGPTR->control = 0x0;
}

void     aes_start_decrypt() {
  AESREGPTR->control = 0x2;
  AESREGPTR->control = 0x0;
}

unsigned aes_done_encrypt() {
  return ((AESREGPTR->status & 0x1) == 0x1);
}

unsigned aes_done_decrypt() {
  return ((AESREGPTR->status & 0x2) == 0x2);
}


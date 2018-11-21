typedef unsigned char uint8_t;
// typedef unsigned uint32_t;

#include <stdio.h>


typedef struct{
  uint8_t ks[16];
} aes_roundkey_t;

typedef struct{
  aes_roundkey_t key[10+1];
} aes128_ctx_t;

typedef struct{
  aes_roundkey_t key[1]; /* just to avoid the warning */
} aes_genctx_t;

typedef struct{
  uint8_t s[16];
} aes_cipher_state_t;

const uint8_t aes_sbox[256] = {
 0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
 0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
 0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
 0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
 0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
 0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
 0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
 0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
 0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
 0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
 0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
 0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
 0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
 0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
 0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
 0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
};

void aes128_enc(void *buffer, aes128_ctx_t *ctx);
void aes_encrypt_core(aes_cipher_state_t *state, const aes_genctx_t *ks, uint8_t rounds);
void aes_init(const void *key, unsigned keysize_b, aes_genctx_t *ctx);
void aes128_init(const void *key, aes128_ctx_t *ctx);

void aes128_enc(void *buffer, aes128_ctx_t *ctx){
  aes_encrypt_core(buffer, (aes_genctx_t*)ctx, 10);
}

void aes_shiftcol(void *data, uint8_t shift){
  uint8_t tmp[4];
  tmp[0] = ((uint8_t*)data)[ 0];
  tmp[1] = ((uint8_t*)data)[ 4];
  tmp[2] = ((uint8_t*)data)[ 8];
  tmp[3] = ((uint8_t*)data)[12];
  ((uint8_t*)data)[ 0] = tmp[(shift+0)&3];
  ((uint8_t*)data)[ 4] = tmp[(shift+1)&3];
  ((uint8_t*)data)[ 8] = tmp[(shift+2)&3];
  ((uint8_t*)data)[12] = tmp[(shift+3)&3];
}

uint8_t xtime(uint8_t x) {
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
}

static void aes_enc_round(aes_cipher_state_t *state, const aes_roundkey_t *k){
  uint8_t tmp[16], t;
  uint8_t i;
  
  /* subBytes */
  for(i=0; i<16; ++i)
    tmp[i] = aes_sbox[state->s[i]];

  /* shiftRows */
  aes_shiftcol(tmp+1, 1);
  aes_shiftcol(tmp+2, 2);
  aes_shiftcol(tmp+3, 3);
  
  /* mixColums */
  for(i=0; i<4; ++i){
    t = tmp[4*i+0] ^ tmp[4*i+1] ^ tmp[4*i+2] ^ tmp[4*i+3];
    state->s[4*i+0] =
      xtime(tmp[4*i+0] ^ tmp[4*i+1])
      ^ tmp[4*i+0]
      ^ t;
    state->s[4*i+1] =
      xtime(tmp[4*i+1] ^ tmp[4*i+2])
      ^ tmp[4*i+1]
      ^ t;
    state->s[4*i+2] =
      xtime(tmp[4*i+2] ^ tmp[4*i+3])
      ^ tmp[4*i+2]
      ^ t;
    state->s[4*i+3] =
      xtime(tmp[4*i+3] ^ tmp[4*i+0])
      ^ tmp[4*i+3]
      ^ t;
  }

  /* addRoundKey */
  for(i=0; i<16; ++i)
    state->s[i] ^= k->ks[i];

}

static void aes_enc_lastround(aes_cipher_state_t *state,const aes_roundkey_t *k){
  uint8_t i;
  
  /* subBytes */
  for(i=0; i<16; ++i)
    state->s[i] = aes_sbox[state->s[i]];
  
  /* shiftRows */
  aes_shiftcol(state->s+1, 1);
  aes_shiftcol(state->s+2, 2);
  aes_shiftcol(state->s+3, 3);
  
  /* keyAdd */
  for(i=0; i<16; ++i)
    state->s[i] ^= k->ks[i];
  
}

void aes_encrypt_core(aes_cipher_state_t *state, const aes_genctx_t *ks, uint8_t rounds){
  uint8_t i;
  
  for(i=0; i<16; ++i)
    state->s[i] ^= ks->key[0].ks[i];
  
  i=1;
  for(;rounds>1;--rounds){
    aes_enc_round(state, &(ks->key[i]));
    ++i;
  }
  
  aes_enc_lastround(state, &(ks->key[i]));
}


static void aes_rotword(void *a){
  uint8_t t;
  t=((uint8_t*)a)[0];
  ((uint8_t*)a)[0] = ((uint8_t*)a)[1];
  ((uint8_t*)a)[1] = ((uint8_t*)a)[2];
  ((uint8_t*)a)[2] = ((uint8_t*)a)[3];
  ((uint8_t*)a)[3] = t;
}

const uint8_t rc_tab[] = { 0x01, 0x02, 0x04, 0x08,
			   0x10, 0x20, 0x40, 0x80,
			   0x1b, 0x36 };

void aes_init(const void *key, unsigned keysize_b, aes_genctx_t *ctx){
  uint8_t hi,i,nk, next_nk;
  uint8_t rc=0;
  union {
    uint32_t v32;
    uint8_t  v8[4];
  } tmp;
  
  nk=keysize_b>>5; /* 4, 6, 8 */
  hi=4*(nk+6+1);
  
  for (i=0; i<keysize_b/8; i++)
    ((uint8_t *) ctx)[i] = ((uint8_t *) key)[i];
  
  next_nk = nk;
  
  for(i=nk;i<hi;++i){
    tmp.v32 = ((uint32_t*)(ctx->key[0].ks))[i-1];
    if(i!=next_nk){
      if(nk==8 && i%8==4){
	tmp.v8[0] = aes_sbox[tmp.v8[0]];
	tmp.v8[1] = aes_sbox[tmp.v8[1]];
	tmp.v8[2] = aes_sbox[tmp.v8[2]];
	tmp.v8[3] = aes_sbox[tmp.v8[3]];
      }
    } else {
      next_nk += nk;
      aes_rotword(&(tmp.v32));
      tmp.v8[0] = aes_sbox[tmp.v8[0]];
      tmp.v8[1] = aes_sbox[tmp.v8[1]];
      tmp.v8[2] = aes_sbox[tmp.v8[2]];
      tmp.v8[3] = aes_sbox[tmp.v8[3]];
      tmp.v8[0] ^= rc_tab[rc];
      rc++;
    }
    ((uint32_t*)(ctx->key[0].ks))[i] = ((uint32_t*)(ctx->key[0].ks))[i-nk] ^ tmp.v32;
  }
}

void aes128_init(const void *key, aes128_ctx_t *ctx){
  aes_init(key, 128, (aes_genctx_t*)ctx);
}

void main() {
  unsigned char buf[] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
			 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};

  unsigned char key[] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
			 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
    
  aes128_ctx_t rkey;

  aes128_init(key, &rkey);
  aes128_enc(buf, &rkey);
  
  unsigned i, j;
  
  for (i=0; i<16; i++)
    printf("%2x", buf[i]);
  
}

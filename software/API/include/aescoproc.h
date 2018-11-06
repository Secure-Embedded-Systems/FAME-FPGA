#ifndef AESCOPROC_H
#define AESCOPROC_H

void     aes_set_encrypt_key (unsigned key[4]);
void     aes_set_decrypt_key (unsigned key[4]);
void     aes_set_ecb_encrypt_data(unsigned data[4]);
void     aes_set_cbc_encrypt_data(unsigned data[4]);
void     aes_set_decrypt_data(unsigned data[4]);
void     aes_set_encrypt_iv  (unsigned data[4]);
void     aes_set_decrypt_iv  (unsigned data[4]);
void     aes_get_encrypt_data(unsigned data[4]);
void     aes_get_ecb_decrypt_data(unsigned data[4]);
void     aes_get_cbc_decrypt_data(unsigned data[4]);
void     aes_get_encrypt_iv  (unsigned data[4]);
void     aes_get_decrypt_iv  (unsigned data[4]);
void     aes_start_encrypt   ();
void     aes_start_decrypt   ();
unsigned aes_done_encrypt    ();
unsigned aes_done_decrypt    ();

#endif

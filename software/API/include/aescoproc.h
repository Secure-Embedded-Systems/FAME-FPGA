#ifndef AESCOPROC_H
#define AESCOPROC_H

void     aes_set_encrypt_key (int key[4]);
void     aes_set_decrypt_key (int key[4]);
void     aes_set_encrypt_data(int data[4]);
void     aes_set_decrypt_data(int data[4]);
void     aes_set_encrypt_iv  (int data[4]);
void     aes_set_decrypt_iv  (int data[4]);
void     aes_get_encrypt_data(int data[4]);
void     aes_get_decrypt_data(int data[4]);
void     aes_start_encrypt   ();
void     aes_start_decrypt   ();
unsigned aes_done_encrypt    ();
unsigned aes_done_decrypt    ();

#endif

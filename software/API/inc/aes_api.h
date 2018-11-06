#ifndef AES_API
#define AES_API

void  aes_input_key  (char key[16], int encrypt_decrypt);
void  aes_input_data (char data[16], int encrypt_decrypt);
char* aes_output_data(int encrypt_decrypt);
void  aes_start_encrypt_decrypt(int encrypt_decrypt);

#endif

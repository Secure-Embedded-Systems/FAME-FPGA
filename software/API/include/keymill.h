#ifndef KEYMILL_H
#define KEYMILL_H

void keymill_input_key(char key[16]);
void keymill_input_iv(char iv[16]);
void start_keymill();
void reset_keymill();
unsigned int keymill_output();

#endif

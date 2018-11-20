#include <stdio.h>
#include "aescoproc.h"

int main() {

  unsigned key[4] = {0, 0, 0, 0};
  unsigned pt[4]  = {0xFFFFFFFF,
		     0xFFFFFFFF,
		     0xFFFFFFFF,
		     0xFFFFFFFF};
  unsigned ct[4];
  unsigned ecb_ct_exp[4] = {0x3F5B8CC9,
			    0xEA855A0A,
			    0xFA7347D2,
			    0x3E8D664E};
  unsigned ecb_pt_exp[4] = {0xFFFFFFFF,
			    0xFFFFFFFF,
			    0xFFFFFFFF,
			    0xFFFFFFFF};

  // ECB encrypt
  aes_set_key(key);
  aes_set_input_data(pt);
  aes_encrypt_ecb();
  aes_get_output_data(ct);

  printf("ECB Encrypt %8x %8x %8x %8x\n", ct[0], ct[1], ct[2], ct[3]);
  printf("    correct %8d %8d %8d %8d\n",
	 (ecb_ct_exp[0]==ct[0]),
	 (ecb_ct_exp[1]==ct[1]),
	 (ecb_ct_exp[2]==ct[2]),
	 (ecb_ct_exp[3]==ct[3]));
  
  aes_soft_reset();
    
  // ECB decrypt
  aes_set_key(key);
  aes_set_input_data(ct);
  aes_decrypt_ecb();
  aes_get_output_data(pt);

  printf("ECB Decrypt %8x %8x %8x %8x\n", pt[0], pt[1], pt[2], pt[3]);
  printf("    correct %8d %8d %8d %8d\n",
	 (pt[0]==ecb_pt_exp[0]),
	 (pt[1]==ecb_pt_exp[1]),
	 (pt[2]==ecb_pt_exp[2]),
	 (pt[3]==ecb_pt_exp[3]));
  
  aes_soft_reset();


  // CBC encrypt
  unsigned cbc_key[4] = {0x01234567,
			 0x89ABCDEF,
			 0x01234567,
			 0x89ABCDEF};
  unsigned cbc_pt[8]  = {0xF0F4FFFF,
			 0x1FF2FF0F,
			 0xFFFF2FF0,
			 0xEF9FF3FF,
			 0xF0F4FFFF,
			 0x1F02FF01,
			 0xFF4F2FF0,
			 0xEF9FF3FE};
  unsigned cbc_iv[4]  = {0xB000000E,
			 0x00000000,
			 0x30000000,
			 0x0000000F};
  unsigned cbc_ct_exp[8]={0xAF1C884A,
			  0xE3D5AA40,
			  0x88695A72,
			  0xA5B94DFD,
			  0x3F31583F,
			  0xE602C372,
			  0xC0187C6B,
			  0xF1F73E91};

  aes_set_key(cbc_key);
  aes_set_iv(cbc_iv);
  aes_set_input_data(&(cbc_pt[0]));
  aes_encrypt_cbc();
  aes_get_output_data(ct);
  
  printf("CBC Encrypt %8x %8x %8x %8x\n", ct[0], ct[1], ct[2], ct[3]);
  printf("    correct %8d %8d %8d %8d\n",
	 (ct[0]==cbc_ct_exp[0]),
	 (ct[1]==cbc_ct_exp[1]),
	 (ct[2]==cbc_ct_exp[2]),
	 (ct[3]==cbc_ct_exp[3]));

  aes_set_input_data(&(cbc_pt[4]));
  aes_encrypt_cbc();
  aes_get_output_data(ct);

  printf("CBC Encrypt %8x %8x %8x %8x\n", ct[0], ct[1], ct[2], ct[3]);
  printf("    correct %8d %8d %8d %8d\n",
	 (ct[0]==cbc_ct_exp[4]),
	 (ct[1]==cbc_ct_exp[5]),
	 (ct[2]==cbc_ct_exp[6]),
	 (ct[3]==cbc_ct_exp[7]));

  aes_soft_reset();

  // CBC Decrypt
  unsigned cbc_ct[8]  = {0xF0F4FFFF, 0x1FF2FF0F, 0xFFFF2FF0, 0xEF9FF3FF,
			 0xF0F4FFFF, 0x1F02FF01, 0xFF4F2FF0, 0xEF9FF3FE};
  unsigned cbc_pt_exp[8]={0xC513746E, 0xE855E195, 0x260A2B99, 0x261A463F,    
			  0xA323C5F6, 0x2F761C25, 0x1B79CADA, 0xA98EF692};

  aes_set_key(cbc_key);
  aes_set_iv(cbc_iv);
  aes_set_input_data(&(cbc_ct[0]));
  aes_decrypt_cbc();
  aes_get_output_data(pt);

  printf("CBC Decrypt %8x %8x %8x %8x\n", pt[0], pt[1], pt[2], pt[3]);
  printf("    correct %8d %8d %8d %8d\n",
	 (pt[0]==cbc_pt_exp[0]),
	 (pt[1]==cbc_pt_exp[1]),
	 (pt[2]==cbc_pt_exp[2]),
	 (pt[3]==cbc_pt_exp[3]));

  aes_set_input_data(&(cbc_ct[4]));
  aes_decrypt_cbc();
  aes_get_output_data(pt);

  printf("CBC Decrypt %8x %8x %8x %8x\n", pt[0], pt[1], pt[2], pt[3]);
  printf("    correct %8d %8d %8d %8d\n",
	 (pt[0]==cbc_pt_exp[4]),
	 (pt[1]==cbc_pt_exp[5]),
	 (pt[2]==cbc_pt_exp[6]),
	 (pt[3]==cbc_pt_exp[7]));
  
  return 0;
}


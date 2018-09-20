########### load sdf
vsim -multisource_delay latest -sdftyp /d3=netgen/par/leon3mp_timesim.sdf -sdfnoerror work.testbench

########## load waveforms

################### clk
add wave -label clk  sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_29/clk  

################### divider 
add wave -noupdate -divider -height 20 {fetch stage}

################### fetch
add wave -radix hex  {fetch_pc { sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_f_pc_2/i  
                             sim:/testbench/alarm_out                            
                             sim:/testbench/alarm_out                            
}}

################### divider 
add wave -noupdate -divider -height 20 {decode stage}

################### decode

################### d.pc 
add wave -radix hex  {decode_pc { sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pc_2/i  
                             sim:/testbench/alarm_out                            
                             sim:/testbench/alarm_out                            
}}

################### d.instruction.reg 
add wave -radix hex  {decode_inst { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inst_0_0/i  
}}

################### d.cmp
add wave -radix hex  {decode_cmp { 
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_cwp_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_cwp_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_cwp_0/i
}}

################### decode control
add wave -label decode_inull  sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_inull/i 
add wave -label decode_mexc  sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_mexc/i 
add wave -label decode_annul sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_annul/i 
add wave -label decode_pv  sim:/testbench/d3/u0_leon3x0_p0_iu_r_d_pv/i 

###########################################################
################### access stage
###########################################################

################### divider 
add wave -noupdate -divider -height 20 {access stage}

################### a.pc 
add wave -radix hex  {access_pc { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_pc_2/i  
                             sim:/testbench/alarm_out                            
                             sim:/testbench/alarm_out                            
}}

################### access.instruction.reg 
add wave -radix hex  {access_inst { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_inst_0/i  
}}

################### access.rd
add wave -radix hex  {access_rd { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_7/i
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_6/i
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_5/i
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_4/i
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_3/i
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_2/i
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_1/i
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_rd_0/i
}}

add wave -label a_trap sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_trap/i 
add wave -label a_wicc sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_wicc/i  
add wave -label a_wreg sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ctrl_wreg/i 
add wave -label a_rfe1 sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rfe2/i 
add wave -label a_rfe2 sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rfe1/i 
add wave -label a_ldcheck1  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ldcheck1/i 
add wave -label a_ldcheck2  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ldcheck2/i 
add wave -label a_ldchkex  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ldchkex/i 
add wave -label a_ldchkra  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ldchkra/i 
add wave -label a_et sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_et/i
add wave -label a_wovf sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_wovf/i
add wave -label a_wunf sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_wunf/i
add wave -label a_ticc sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_ticc/i
add wave -label a_su sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_su/i

################### access.rsel1
add wave -radix hex  {access_rsel1 {
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rsel1_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rsel1_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rsel1_0/i

}}

################### access.rsel2
add wave -radix hex  {access_rsel2 {
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rsel2_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rsel2_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_rsel2_0/i
}}

################### access.immediate
#bit 22 missing
# "bit 22" is probably sign_extension bit. I duplicate bit 21.
add wave -radix hex  { access_imm { sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_31/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_30/i   
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_29/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_28/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_27/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_26/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_25/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_24/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_23/i 
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_21/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_21/i   
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_20/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_19/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_18/i   
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_17/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_16/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_15/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_14/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_13/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_12/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_11/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_10/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_9/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_8/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_7/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_6/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_5/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_4/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_3/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_2/i
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_1/i  
                                  sim:/testbench/d3/u0_leon3x0_p0_iu_r_a_imm_0/i 
}}     


###########################################################
################### execution stage
###########################################################

################### divider 
add wave -noupdate -divider -height 20 {execution stage}

################### execution.pc 
add wave -radix hex  {execution_pc { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_pc_2/i  
                             sim:/testbench/alarm_out                            
                             sim:/testbench/alarm_out                            
}}


################### execution.instruction.reg 
add wave -radix hex  {execution_inst { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_inst_0/i  
}}

################### execution.instruction.op1 
add wave -radix hex  {execution_op1 { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op1_0/i  
}}

add wave -radix hex  {execution_op2 { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_op2_0/i  
}}


################### execution.cmp
add wave -radix hex  {execution_cmp { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_cwp_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_cwp_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_cwp_0/i  
}}


add wave -label et sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_et/i
add wave -label jmpl sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_jmpl/i
add wave -label ldbp1 sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ldbp1/i
add wave -label ldbp2 sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ldbp2/i
add wave -label rfe1 sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_rfe1/i
add wave -label rfe2 sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_rfe2/i
add wave -label sari sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_sari/i
add wave -label alu_add sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_aluadd/i
add wave -label alu_cin sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_alucin/i
add wave -radix hex  {alu_op { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_aluop_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_aluop_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_aluop_0/i  
}}
add wave -radix hex  {alu_sel { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_alusel_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_alusel_0/i  
}}

add wave -label su sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_su/i
add wave -label ymsb sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ymsb/i
add wave -label shleft sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_shleft/i
add wave -radix hex  {shcnt { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_shcnt_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_shcnt_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_shcnt_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_shcnt_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_shcnt_0/i  
}}

################### execution.rd 
add wave -radix hex  {execution_rd { 
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_7/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_6/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_5/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_4/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_3/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_e_ctrl_rd_0/i
}}


###########################################################
################### memory stage
###########################################################

################### divider 
add wave -noupdate -divider -height 20 {memory stage}

################### memory.pc 
add wave -radix hex  {memory_pc { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pc_2/i  
                             sim:/testbench/alarm_out                            
                             sim:/testbench/alarm_out                            
}}

################### memory.instruction.reg 
add wave -radix hex  {memory_inst { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_inst_0/i  
}}

################### memory.rd 
add wave -radix hex  {memory_rd { 
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_7/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_6/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_5/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_4/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_3/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rd_0/i
}}

add wave -label m_ctrl_pv sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_pv/i
add wave -label m_ctrl_wreg sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_wreg/i
add wave -label m_ctrl_wicc sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_wicc/i
add wave -label m_ctrl_trap sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_trap/i
add wave -label m_ctrl_rett sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_rett/i
add wave -label m_nalign sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_nalign/i
add wave -label m_dci_dsuen sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_dsuen/i
add wave -label m_dci_enaddr sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_enaddr/i
add wave -label dci_lock sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_lock/i
add wave -label dci_read sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_read/i
################### memory.dci.size
add wave -radix hex  {memory_dci_size { 
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_size_1/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_size_0/i
}}
add wave -label dci_write sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_write/i
add wave -label dci_signed sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_signed/i
################### memory.cnt
add wave -radix hex  {memory_cnt { 
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_cnt_1/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_ctrl_cnt_0/i
}}

################### memory.dci.asi 
add wave -radix hex  {memory_dci_asi { 
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_7/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_6/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_5/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_4/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_3/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_dci_asi_0/i
}}
################### memory.icc
add wave -radix hex  {memory_icc {
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_icc_3/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_icc_2/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_icc_1/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_icc_0/i
}}

################### memory.result
add wave -radix hex  {memory_result { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_m_result_0/i  
}}

###########################################################
################### exception.stage
###########################################################

################### divider 
add wave -noupdate -divider -height 20 {exception stage}

################### exception.pc 
add wave -radix hex  {exception_pc { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pc_2/i  
                             sim:/testbench/alarm_out                            
                             sim:/testbench/alarm_out                            
}}

################### exception.instruction.reg 
add wave -radix hex  {exception_inst { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_inst_0/i  
}}


################### exception.rd 
add wave -radix hex  {exception_rd { 
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_7/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_6/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_5/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_4/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_3/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rd_0/i
}}

add wave -label x_ctrl_pv sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_pv/i
add wave -label x_ctrl_wreg sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_wreg/i
add wave -label x_ctrl_wicc sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_wicc/i
add wave -label x_ctrl_trap sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_trap/i
add wave -label x_ctrl_rett sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_ctrl_rett/i
add wave -label x_dci_dsuen sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_dsuen/i
add wave -label x_dci_enaddr sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_enaddr/i
add wave -label x_dci_lock sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_lock/i
add wave -label x_dci_read sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_read/i
################### exception.dci.size
add wave -radix hex  {exception_dci_size { 
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_size_1/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_size_0/i
}}
add wave -label x_dci_write sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_write/i
add wave -label x_dci_signed sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_signed/i

################### exception.dci.asi 
add wave -radix hex  {exception_dci_asi { 
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_7/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_6/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_5/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_4/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_3/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_2/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_1/i
                            sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_dci_asi_0/i
}}
################### exception.icc
add wave -radix hex  {exception_icc {
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_icc_3/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_icc_2/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_icc_1/i
                        sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_icc_0/i
}}

################### exception.result
add wave -radix hex  {exception_result { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_x_result_0/i  
}}

###########################################################
################### writeback.stage
###########################################################

################### divider 
add wave -noupdate -divider -height 20 {writeback stage}

################### writeback.instruction.reg 
add wave -radix hex  {writeback_result { 
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_31/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_30/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_29/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_28/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_27/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_26/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_25/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_24/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_23/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_22/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_21/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_20/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_19/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_18/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_17/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_16/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_15/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_14/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_13/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_12/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_11/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_10/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_9/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_8/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_7/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_6/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_5/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_4/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_3/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_2/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_1/i  
                             sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_result_0/i  
}}

add wave -label wreg sim:/testbench/d3/u0_leon3x0_p0_iu_r_w_wreg/i


################### simulate
run -all

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group MIPS_TOP /tb_mips_processor/w_CLK
add wave -noupdate -group MIPS_TOP /tb_mips_processor/w_RESET
add wave -noupdate -group MIPS_TOP /tb_mips_processor/w_REGF_OUT_1
add wave -noupdate -group MIPS_TOP /tb_mips_processor/w_REGF_OUT_2
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/i_opcode
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_REG_DST
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_ALU_SRC
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_MEMtoREG
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_wREG
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_rMEM
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_wMEM
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_BRANCH
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_INCON_BRANCH
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_ALU_OP
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_LOAD_IMM
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_OR_IMM
add wave -noupdate -group 18_MAIN_CONTROL /tb_mips_processor/u_DUV/controle/o_JAL_JUMP
add wave -noupdate -group 01_INSTRUCTION_MEM /tb_mips_processor/u_DUV/memoria_de_instrucoes/i_CLOCK
add wave -noupdate -group 01_INSTRUCTION_MEM /tb_mips_processor/u_DUV/memoria_de_instrucoes/i_ADDR
add wave -noupdate -group 01_INSTRUCTION_MEM -radix hexadecimal /tb_mips_processor/u_DUV/memoria_de_instrucoes/o_INS_OUT
add wave -noupdate -group 01_INSTRUCTION_MEM -radix hexadecimal -childformat {{/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(0) -radix hexadecimal} {/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(1) -radix hexadecimal} {/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(2) -radix hexadecimal} {/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(3) -radix hexadecimal} {/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(4) -radix hexadecimal} {/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(5) -radix hexadecimal} {/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(6) -radix hexadecimal}} -expand -subitemconfig {/tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(0) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(1) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(2) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(3) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(4) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(5) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/memoria_de_instrucoes/INST(6) {-height 17 -radix hexadecimal}} /tb_mips_processor/u_DUV/memoria_de_instrucoes/INST
add wave -noupdate -group 03_INSTRUCTION_MUX /tb_mips_processor/u_DUV/mux_inst/i_INPUT_1_5
add wave -noupdate -group 03_INSTRUCTION_MUX /tb_mips_processor/u_DUV/mux_inst/i_INPUT_2_5
add wave -noupdate -group 03_INSTRUCTION_MUX /tb_mips_processor/u_DUV/mux_inst/i_SEL_2
add wave -noupdate -group 03_INSTRUCTION_MUX /tb_mips_processor/u_DUV/mux_inst/o_OUT_5
add wave -noupdate -group 05_SIGN_EXT /tb_mips_processor/u_DUV/sign_ext/i_INPUT_16
add wave -noupdate -group 05_SIGN_EXT /tb_mips_processor/u_DUV/sign_ext/o_OUT_32
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/i_CLK
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/i_ADDR_RD_1
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/i_ADDR_RD_2
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/i_ADDR_WR
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/i_JAL_JUMP
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/i_DIN
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/i_wREG
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/o_DOUT_1
add wave -noupdate -group 04_REGISTER_FILE /tb_mips_processor/u_DUV/banc_de_regist/o_DOUT_2
add wave -noupdate -group 04_REGISTER_FILE -childformat {{/tb_mips_processor/u_DUV/banc_de_regist/REG(0) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(1) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(2) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(3) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(4) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(5) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(6) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(7) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(8) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(9) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(10) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(11) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(12) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(13) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(14) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(15) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(16) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(17) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(18) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(19) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(20) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(21) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(22) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(23) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(24) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(25) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(26) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(27) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(28) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(29) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(30) -radix hexadecimal} {/tb_mips_processor/u_DUV/banc_de_regist/REG(31) -radix hexadecimal}} -subitemconfig {/tb_mips_processor/u_DUV/banc_de_regist/REG(0) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(1) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(2) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(3) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(4) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(5) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(6) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(7) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(8) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(9) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(10) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(11) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(12) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(13) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(14) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(15) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(16) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(17) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(18) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(19) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(20) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(21) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(22) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(23) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(24) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(25) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(26) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(27) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(28) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(29) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(30) {-height 17 -radix hexadecimal} /tb_mips_processor/u_DUV/banc_de_regist/REG(31) {-height 17 -radix hexadecimal}} /tb_mips_processor/u_DUV/banc_de_regist/REG
add wave -noupdate -group 06_ALU_CONTROL /tb_mips_processor/u_DUV/operacao_da_UAL/i_ALU_OP
add wave -noupdate -group 06_ALU_CONTROL /tb_mips_processor/u_DUV/operacao_da_UAL/i_FUNCT
add wave -noupdate -group 06_ALU_CONTROL /tb_mips_processor/u_DUV/operacao_da_UAL/o_OPERATION
add wave -noupdate -group 06_ALU_CONTROL /tb_mips_processor/u_DUV/operacao_da_UAL/i_LOAD_IMM
add wave -noupdate -group 06_ALU_CONTROL /tb_mips_processor/u_DUV/operacao_da_UAL/i_OR_IMM
add wave -noupdate -group 06_ALU_CONTROL /tb_mips_processor/u_DUV/operacao_da_UAL/o_JR_JUMP
add wave -noupdate -group 07_ALU_MUX /tb_mips_processor/u_DUV/mux_in_alu/i_INPUT_1_32
add wave -noupdate -group 07_ALU_MUX /tb_mips_processor/u_DUV/mux_in_alu/i_INPUT_2_32
add wave -noupdate -group 07_ALU_MUX /tb_mips_processor/u_DUV/mux_in_alu/i_SEL_2
add wave -noupdate -group 07_ALU_MUX /tb_mips_processor/u_DUV/mux_in_alu/o_OUT_32
add wave -noupdate -group 08_ALU /tb_mips_processor/u_DUV/ual/i_A
add wave -noupdate -group 08_ALU /tb_mips_processor/u_DUV/ual/i_B
add wave -noupdate -group 08_ALU /tb_mips_processor/u_DUV/ual/i_OPERATION
add wave -noupdate -group 08_ALU /tb_mips_processor/u_DUV/ual/o_OUT
add wave -noupdate -group 08_ALU /tb_mips_processor/u_DUV/ual/o_ZERO_FLAG
add wave -noupdate -group 08_ALU /tb_mips_processor/u_DUV/ual/s_OUTPUT_BUFFER
add wave -noupdate -group 09_DATA_MEM /tb_mips_processor/u_DUV/memoria_de_dados/i_CLK
add wave -noupdate -group 09_DATA_MEM /tb_mips_processor/u_DUV/memoria_de_dados/i_rMEM
add wave -noupdate -group 09_DATA_MEM /tb_mips_processor/u_DUV/memoria_de_dados/i_wMEM
add wave -noupdate -group 09_DATA_MEM /tb_mips_processor/u_DUV/memoria_de_dados/i_ADDR
add wave -noupdate -group 09_DATA_MEM /tb_mips_processor/u_DUV/memoria_de_dados/i_DATA_IN
add wave -noupdate -group 09_DATA_MEM /tb_mips_processor/u_DUV/memoria_de_dados/o_OUT
add wave -noupdate -group 09_DATA_MEM /tb_mips_processor/u_DUV/memoria_de_dados/RAM
add wave -noupdate -group 10_DATA_MEM_MUX /tb_mips_processor/u_DUV/mux_out_data_mem/i_INPUT_1_32
add wave -noupdate -group 10_DATA_MEM_MUX /tb_mips_processor/u_DUV/mux_out_data_mem/i_INPUT_2_32
add wave -noupdate -group 10_DATA_MEM_MUX /tb_mips_processor/u_DUV/mux_out_data_mem/i_SEL_2
add wave -noupdate -group 10_DATA_MEM_MUX /tb_mips_processor/u_DUV/mux_out_data_mem/o_OUT_32
add wave -noupdate -group 11_SHIFT_LEFT_SIGN /tb_mips_processor/u_DUV/desl_esq_extend/i_INPUT_32
add wave -noupdate -group 11_SHIFT_LEFT_SIGN /tb_mips_processor/u_DUV/desl_esq_extend/o_OUT_32
add wave -noupdate -group 12_PC_SHIFT_ADDER /tb_mips_processor/u_DUV/pc_shift_adder/i_INPUT_1_32
add wave -noupdate -group 12_PC_SHIFT_ADDER /tb_mips_processor/u_DUV/pc_shift_adder/i_INPUT_2_32
add wave -noupdate -group 12_PC_SHIFT_ADDER /tb_mips_processor/u_DUV/pc_shift_adder/o_OUT_32
add wave -noupdate -group 2_PROGRAM_COUNTER /tb_mips_processor/u_DUV/prog_count/i_CLK
add wave -noupdate -group 2_PROGRAM_COUNTER /tb_mips_processor/u_DUV/prog_count/i_CLK_RESET_n
add wave -noupdate -group 2_PROGRAM_COUNTER /tb_mips_processor/u_DUV/prog_count/i_PC
add wave -noupdate -group 2_PROGRAM_COUNTER /tb_mips_processor/u_DUV/prog_count/o_PC
add wave -noupdate -group 2_PROGRAM_COUNTER /tb_mips_processor/u_DUV/prog_count/s_PC_REG
add wave -noupdate -group 17_PC_PLUS_FOUR /tb_mips_processor/u_DUV/pc_plus_four/i_INPUT_32
add wave -noupdate -group 17_PC_PLUS_FOUR /tb_mips_processor/u_DUV/pc_plus_four/o_OUT_32
add wave -noupdate -group 16_INSTRUCTION_SHIFT /tb_mips_processor/u_DUV/inst_shift/i_INPUT_26
add wave -noupdate -group 16_INSTRUCTION_SHIFT /tb_mips_processor/u_DUV/inst_shift/o_OUT_28
add wave -noupdate -group 15_CONCAT /tb_mips_processor/u_DUV/concatenate/i_INPUT_1_28
add wave -noupdate -group 15_CONCAT /tb_mips_processor/u_DUV/concatenate/i_INPUT_2_4
add wave -noupdate -group 15_CONCAT /tb_mips_processor/u_DUV/concatenate/o_OUT_32
add wave -noupdate -group 13_COND_BRANCH /tb_mips_processor/u_DUV/conditional_branch/i_INPUT_1_32
add wave -noupdate -group 13_COND_BRANCH /tb_mips_processor/u_DUV/conditional_branch/i_INPUT_2_32
add wave -noupdate -group 13_COND_BRANCH /tb_mips_processor/u_DUV/conditional_branch/i_SEL_2
add wave -noupdate -group 13_COND_BRANCH /tb_mips_processor/u_DUV/conditional_branch/o_OUT_32
add wave -noupdate -group 14_INCOND_BRANCH /tb_mips_processor/u_DUV/inconditional_branch/i_INPUT_1_32
add wave -noupdate -group 14_INCOND_BRANCH /tb_mips_processor/u_DUV/inconditional_branch/i_INPUT_2_32
add wave -noupdate -group 14_INCOND_BRANCH /tb_mips_processor/u_DUV/inconditional_branch/i_SEL_2
add wave -noupdate -group 14_INCOND_BRANCH /tb_mips_processor/u_DUV/inconditional_branch/o_OUT_32
add wave -noupdate -group 18_JAL_BRANCH /tb_mips_processor/u_DUV/jal_branch/i_INPUT_1_32
add wave -noupdate -group 18_JAL_BRANCH /tb_mips_processor/u_DUV/jal_branch/i_INPUT_2_32
add wave -noupdate -group 18_JAL_BRANCH /tb_mips_processor/u_DUV/jal_branch/i_SEL_2
add wave -noupdate -group 18_JAL_BRANCH /tb_mips_processor/u_DUV/jal_branch/o_OUT_32
add wave -noupdate -group 19_JR_BRANCH /tb_mips_processor/u_DUV/jr_branch/i_INPUT_1_32
add wave -noupdate -group 19_JR_BRANCH /tb_mips_processor/u_DUV/jr_branch/i_INPUT_2_32
add wave -noupdate -group 19_JR_BRANCH /tb_mips_processor/u_DUV/jr_branch/i_SEL_2
add wave -noupdate -group 19_JR_BRANCH /tb_mips_processor/u_DUV/jr_branch/o_OUT_32
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {920 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 210
configure wave -valuecolwidth 240
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {542 ps}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MAIN_CONTROL is

port(

	i_opcode		:	in std_logic_vector(5 downto 0);
	i_JR_JUMP		:	in std_logic;
	
	o_REG_DST	:	out std_logic;
	o_ALU_SRC	:	out std_logic;
	o_MEMtoREG	:	out std_logic;
	o_wREG		:	out std_logic;
	o_rMEM		:	out std_logic;
	o_wMEM		:	out std_logic;
	o_BRANCH		:	out std_logic;
	o_INCON_BRANCH	:	out std_logic;
	o_ALU_OP		:	out std_logic_vector(1 downto 0);
	o_LOAD_IMM		:	out std_logic;
	o_OR_IMM		:	out std_logic;
	o_SLT_IMM		:	out std_logic;
	o_JAL_JUMP		:	out std_logic

);

end MAIN_CONTROL;

architecture ARCH_1 of MAIN_CONTROL is

	begin
	

	--o_REG_DST	<=	'1' when i_opcode = "000000" else '0';	--R
	--o_ALU_SRC	<=	'1' when (i_opcode = "100011" or i_opcode = "101011") else '0';	--(lw or sw)
	--o_MEMtoREG	<=	'1' when i_opcode = "100011" else '0';	--lw
	--o_wREG		<=	'1' when (i_opcode = "000000" or i_opcode = "100011") else '0';	--(R or lw)
	--o_rMEM		<=	'1' when i_opcode = "100011" else '0';	--lw
	--o_wMEM		<=	'1' when i_opcode = "101011" else '0';	--sw
	--o_BRANCH		<=	'1' when i_opcode = "000100" else '0';	--beq

	--o_INCON_BRANCH	<=	'0';

	--o_ALU_OP(1)	<=	'1' when i_opcode = "000000" else '0';	--R
	--o_ALU_OP(0)	<=	'1' when i_opcode = "000100" else '0';	--beq


	---NOTES:
    -- ADDI = o_ALU_SRC and o_wREG
	-- J = o_INCON_BRANCH
	-- LUI = o_ALU_SRC and o_wREG and o_LOAD_IMM
	-- ORI = o_ALU_SRC and o_wREG and o_OR_IMM
	-- SLTI = o_ALU_SRC and o_wREG and o_SLT_IMM
	-- JAL = o_INCON_BRANCH and o_JAL_JUMP

	--ATT, MAKING JR 000000, funct 001000

	o_REG_DST	<=	'1' when i_opcode = "000000" else '0';	--R
	o_ALU_SRC	<=	'1' when (i_opcode = "100011" or i_opcode = "101011" or i_opcode = "001000" or i_opcode = "001111" or i_opcode = "001101" or i_opcode = "001010") else '0';	--(lw or sw or addi or lui or ori or slti)
	o_MEMtoREG	<=	'1' when i_opcode = "100011" else '0';	--lw
	o_wREG		<=	'1' when (i_opcode = "000000" or i_opcode = "100011" or i_opcode = "001000" or i_opcode = "001111" or i_opcode = "001101" or i_opcode = "001010") else '0';	--(R or lw or addi or lui or ori or slti)
	o_rMEM		<=	'1' when i_opcode = "100011" else '0';	--lw
	o_wMEM		<=	'1' when i_opcode = "101011" else '0';	--sw
	o_BRANCH		<=	'1' when i_opcode = "000100" else '0';	--beq

	o_INCON_BRANCH	<=	'1' when i_opcode = "000010" or i_opcode = "000011" or i_JR_JUMP = '1' else '0'; --j or jal or jr

	o_ALU_OP(1)	<=	'1' when i_opcode = "000000" else '0';	--R
	o_ALU_OP(0)	<=	'1' when i_opcode = "000100" else '0';	--beq

	o_LOAD_IMM 	<=	'1' when i_opcode = "001111" else '0';	--lui forced flag, CAN YOU FEEL THE JANK?
	o_OR_IMM	<=	'1' when i_opcode = "001101" else '0';	--ori
	o_SLT_IMM	<=	'1' when i_opcode = "001010" else '0';	--slti
	o_JAL_JUMP	<=	'1' when i_opcode = "000011" else '0';	--jal

end ARCH_1;
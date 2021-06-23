library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_MAIN_CONTROL is

end entity;

architecture ARCH_1 of tb_MAIN_CONTROL is

    component MAIN_CONTROL is

        port(
            i_opcode		:	in std_logic_vector(5 downto 0);
	
            o_REG_DST	:	out std_logic;
            o_ALU_SRC	:	out std_logic;
            o_MEMtoREG	:	out std_logic;
            o_wREG		:	out std_logic;
            o_rMEM		:	out std_logic;
            o_wMEM		:	out std_logic;
            o_BRANCH		:	out std_logic;
            o_ALU_OP		:	out std_logic_vector(1 downto 0)
        );
        
    end component;

    signal w_opcode :   std_logic_vector(5 downto 0);
    signal w_REG_DST, w_ALU_SRC, w_MEMtoREG, w_wREG, w_rMEM, w_wMEM, w_BRANCH   :   std_logic;
    signal w_ALU_OP :   std_logic_vector(1 downto 0);

    begin

        u_DUV   :   MAIN_CONTROL port map(
            i_opcode    =>  w_opcode,
            
            o_REG_DST   =>  w_REG_DST,
            o_ALU_SRC   =>  w_ALU_SRC,
            o_MEMtoREG  =>  w_MEMtoREG,
            o_wREG      =>  w_wREG,
            o_rMEM      =>  w_rMEM,
            o_wMEM      =>  w_wMEM,
            o_BRANCH    =>  w_BRANCH,
            o_ALU_OP    =>  w_ALU_OP
        );

        p_PROCESS   :   process begin

            w_opcode    <=  "000000";   --R
            wait for 2 ns;

            w_opcode    <=  "100011";   --lw
            wait for 2 ns;

            w_opcode    <=  "101011";   --sw
            wait for 2 ns;

            w_opcode    <=  "000100";   --beq
            wait for 2 ns;

            wait;

        end process p_PROCESS;

end ARCH_1;
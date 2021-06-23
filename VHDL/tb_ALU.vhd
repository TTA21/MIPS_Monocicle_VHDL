library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_ALU is

end entity;

architecture ARCH_1 of tb_ALU is

    component ALU is

        port(
        
            i_A			:	in std_logic_vector(31 downto 0);
            i_B			:	in std_logic_vector(31 downto 0);
            i_OPERATION	:	in std_logic_vector(2 downto 0);
            
            o_OUT			:	out std_logic_vector(31 downto 0);
            o_ZERO_FLAG	:	out std_logic
            
            --MISSING OVERFLOW AND CARRY FOR NOW
            
        );
        
    end component;

    signal w_A, w_B, w_OUT  :   std_logic_vector(31 downto 0);
    signal w_OPERATION      :   std_logic_vector(2 downto 0);
    signal w_ZERO_FLAG      :   std_logic;

    begin

        u_DUV   :   ALU port map(
            i_A         =>  w_A,
            i_B         =>  w_B,
            i_OPERATION =>  w_OPERATION,
            o_OUT       =>  w_OUT,
            o_ZERO_FLAG =>  w_ZERO_FLAG
        );

        p_PROCESS   :   process begin

            w_A <=  "00000000000000000000000000000101";
            w_B <=  "00000000000000000000000000000101";
            w_OPERATION <=  "000";  ---AND

            wait for 2 ns;

            w_A <=  "00000000000000000000000000000001";
            w_B <=  "00000000000000000000000000000111";
            w_OPERATION <=  "001";  ---OR

            wait for 2 ns;

            w_A <=  "00000000000000000000000000000001";
            w_B <=  "00000000000000000000000000000111";
            w_OPERATION <=  "010";  ---ADD

            wait for 2 ns;

            w_A <=  "00000000000000000000000000000001";
            w_B <=  "00000000000000000000000000000111";
            w_OPERATION <=  "110";  ---SUB

            wait for 2 ns;

            w_A <=  "00000000000000000000000000000001";
            w_B <=  "00000000000000000000000000000111";
            w_OPERATION <=  "111";  ---SLT

            wait for 2 ns;

        end process p_PROCESS;

end ARCH_1;
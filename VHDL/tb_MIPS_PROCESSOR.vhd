library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_MIPS_PROCESSOR is

end entity;

architecture ARCH_1 of tb_MIPS_PROCESSOR is

    component MIPS_PROCESSOR is

        port(
            i_CLOCK     :   in std_logic;
            i_RESET     :   in std_logic;
            o_REGF_OUT_1    :   out std_logic_vector(31 downto 0);
            o_REGF_OUT_2    :   out std_logic_vector(31 downto 0)
        );
        
    end component;

    constant c_CLK_PERIOD   : time := 200 ps    ;
    signal w_CLK, w_RESET  :   std_logic;
    signal w_REGF_OUT_1, w_REGF_OUT_2 :   std_logic_vector(31 downto 0);

    
    begin

        u_DUV   :   MIPS_PROCESSOR port map(
            w_CLK, w_RESET, w_REGF_OUT_1, w_REGF_OUT_2
        );

        p_CLK: process
            begin
    
                w_CLK <= '0';
                wait for c_CLK_PERIOD/2;  
                w_CLK <= '1';
                wait for c_CLK_PERIOD/2;  
        
      	end process p_CLK;

        p_PROCESS   :   process begin
        
            w_RESET <= '0';
            wait for c_CLK_PERIOD;
            w_RESET <= '0';
            wait for c_CLK_PERIOD;
            w_RESET <=  '1';
            wait for c_CLK_PERIOD;

            wait;
        end process p_PROCESS;

end ARCH_1;
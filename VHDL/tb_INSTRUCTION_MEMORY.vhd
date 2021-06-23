library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_INSTRUCTION_MEMORY is

end entity;

architecture ARCH_1 of tb_INSTRUCTION_MEMORY is

    component INSTRUCTION_MEMORY is

        port(
            i_CLOCK     :   in std_logic;
            i_ADDR      :   in std_logic_vector(31 downto 0);
            o_INS_OUT   :   out std_logic_vector(31 downto 0)
        );
        
    end component;

    constant c_CLK_PERIOD   : time := 200 ps    ;
    signal w_CLK  :   std_logic;
    signal w_ADDR, w_INS_OUT :   std_logic_vector(31 downto 0);

    
    begin

        u_DUV   :   INSTRUCTION_MEMORY port map(
            w_CLK, w_ADDR, w_INS_OUT
        );

        p_CLK: process
            begin
    
                w_CLK <= '0';
                wait for c_CLK_PERIOD/2;  
                w_CLK <= '1';
                wait for c_CLK_PERIOD/2;  
        
      	end process p_CLK;

          --00000000000000000000000000000000
          --XXXXXXXXXX00000000000000000000XX    ---ADDRESS

        p_PROCESS   :   process begin
        
            w_ADDR  <=  "XXXXXXXXXX00000000000000000000XX";
            wait for c_CLK_PERIOD;

            w_ADDR  <=  "XXXXXXXXXX00000000000000000001XX";
            wait for c_CLK_PERIOD;

            w_ADDR  <=  "XXXXXXXXXX00000000000000000010XX";
            wait for c_CLK_PERIOD;

            w_ADDR  <=  "XXXXXXXXXX00000000000000000011XX";
            wait for c_CLK_PERIOD;

            w_ADDR  <=  "XXXXXXXXXX00000000000000000100XX";
            wait for c_CLK_PERIOD;


            wait;
        end process p_PROCESS;

end ARCH_1;
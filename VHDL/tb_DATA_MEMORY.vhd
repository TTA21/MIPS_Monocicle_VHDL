library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_DATA_MEMORY is

end entity;

architecture ARCH_1 of tb_DATA_MEMORY is

    component DATA_MEMORY is

        port(
            i_CLK       :   in std_logic;
            i_rMEM      :   in std_logic;
            i_wMEM      :   in std_logic;

            i_ADDR      :   in std_logic_vector(31 downto 0);
            i_DATA_IN   :   in std_logic_vector(31 downto 0);
            o_OUT       :   out std_logic_vector(31 downto 0)
        );
        
    end component;

    constant c_CLK_PERIOD   : time := 200 ps    ;
    signal w_CLK, w_rMEM, w_wMEM  :   std_logic;
    signal w_ADDR, w_DATA_IN, w_OUT :   std_logic_vector(31 downto 0);

    
    begin

        u_DUV   :   DATA_MEMORY port map(
            w_CLK, w_rMEM, w_wMEM, w_ADDR, w_DATA_IN, w_OUT
        );

        p_CLK: process
            begin
    
                w_CLK <= '0';
                wait for c_CLK_PERIOD/2;  
                w_CLK <= '1';
                wait for c_CLK_PERIOD/2;  
        
      	end process p_CLK;

          --00000000000000000000000000000000
          --XXXXXXXXXXXXXXXX00000000000000XX    ---ADDRESS

        p_PROCESS   :   process begin
        
            w_rMEM  <=  '1';
            w_wMEM  <=  '0';
            w_ADDR  <=  "XXXXXXXXXXXXXXXX00000000000000XX";
            w_DATA_IN   <=  "00000000000000000000000000000000";

            wait for c_CLK_PERIOD;

            w_rMEM  <=  '1';
            w_wMEM  <=  '0';
            w_ADDR  <=  "XXXXXXXXXXXXXXXX00000000000001XX";
            w_DATA_IN   <=  "00000000000000000000000000000000";

            wait for c_CLK_PERIOD;

            w_rMEM  <=  '1';
            w_wMEM  <=  '0';
            w_ADDR  <=  "XXXXXXXXXXXXXXXX00000000000010XX";
            w_DATA_IN   <=  "00000000000000000000000000000000";

            wait for c_CLK_PERIOD;

            w_rMEM  <=  '1';
            w_wMEM  <=  '0';
            w_ADDR  <=  "XXXXXXXXXXXXXXXX00000000000011XX";
            w_DATA_IN   <=  "00000000000000000000000000000000";

            wait for c_CLK_PERIOD;

            w_rMEM  <=  '1';
            w_wMEM  <=  '0';
            w_ADDR  <=  "XXXXXXXXXXXXXXXX00000000000100XX";
            w_DATA_IN   <=  "00000000000000000000000000000000";

            wait for c_CLK_PERIOD;

            w_rMEM  <=  '1';
            w_wMEM  <=  '0';
            w_ADDR  <=  "XXXXXXXXXXXXXXXX00000000000101XX";
            w_DATA_IN   <=  "00000000000000000000000000000000";

            wait for c_CLK_PERIOD;

            w_rMEM  <=  '1';
            w_wMEM  <=  '0';
            w_ADDR  <=  "XXXXXXXXXXXXXXXX00000000000110XX";
            w_DATA_IN   <=  "00000000000000000000000000000000";

            wait for c_CLK_PERIOD;

            wait;
        end process p_PROCESS;

end ARCH_1;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_REGISTER_FILE is

end entity;

architecture ARCH_1 of tb_REGISTER_FILE is

    component REGISTER_FILE is

        port(
            i_CLK       :   in std_logic;

            i_ADDR_RD_1 :   in std_logic_vector(4 downto 0);
            i_ADDR_RD_2 :   in std_logic_vector(4 downto 0);
            i_ADDR_WR   :   in std_logic_vector(4 downto 0);   ---Check for writing to $zero
            i_DIN       :   in std_logic_vector(31 downto 0);
            i_wREG      :   in std_logic;  ---Almost didnt see it, could use better looking diagram

            o_DOUT_1    :   out std_logic_vector(31 downto 0);
            o_DOUT_2    :   out std_logic_vector(31 downto 0)
        );
        
    end component;

    constant c_CLK_PERIOD   : time := 200 ps    ;
    signal w_ADDR_RD_1, w_ADDR_RD_2, w_ADDR_WR  :   std_logic_vector(4 downto 0);
	signal w_DIN, w_DOUT_1, w_DOUT_2	:	std_logic_vector(31 downto 0);
    signal w_wREG, w_CLK   :   std_logic;

    begin

        u_DUV   :   REGISTER_FILE port map(
            w_CLK, w_ADDR_RD_1, w_ADDR_RD_2, w_ADDR_WR, w_DIN, w_wREG, w_DOUT_1, w_DOUT_2
        );

        p_CLK: process
      
            begin
    
            w_CLK <= '0';
            wait for c_CLK_PERIOD/2;  
            w_CLK <= '1';
            wait for c_CLK_PERIOD/2;  
        
      	end process p_CLK;

        p_PROCESS   :   process begin
        
        	w_ADDR_RD_1 <=  "00000";
            w_ADDR_RD_2 <=  "00001";
            w_ADDR_WR   <=  "00000";
            w_DIN       <=  "01010101010101010101010101010101";
            w_wREG      <=  '0';
            wait for c_CLK_PERIOD;

            w_ADDR_RD_1 <=  "00000";
            w_ADDR_RD_2 <=  "00001";
            w_ADDR_WR   <=  "00011";
            w_DIN       <=  "01010101010101010101010101010101";
            w_wREG      <=  '1';
            wait for c_CLK_PERIOD;

            w_ADDR_RD_1 <=  "00011";
            w_ADDR_RD_2 <=  "00010";
            w_ADDR_WR   <=  "00010";
            w_DIN       <=  "01010101010101010101010101010101";
            w_wREG      <=  '1';
            wait for c_CLK_PERIOD;

            w_ADDR_RD_1 <=  "00011";
            w_ADDR_RD_2 <=  "00010";
            w_ADDR_WR   <=  "00110";
            w_DIN       <=  "01010101010101010101010101010101";
            w_wREG      <=  '0';
            wait for c_CLK_PERIOD;

            wait for c_CLK_PERIOD;

            wait;
        end process p_PROCESS;

end ARCH_1;
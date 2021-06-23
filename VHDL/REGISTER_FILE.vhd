library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity REGISTER_FILE is

port(

    i_CLK       :   in std_logic;

	i_ADDR_RD_1 :   in std_logic_vector(4 downto 0);    ---Address linked to DOUT1
    i_ADDR_RD_2 :   in std_logic_vector(4 downto 0);    ---Address linked to DOUT2
    i_ADDR_WR   :   in std_logic_vector(4 downto 0);    ---Check for writing to $zero
    i_DIN       :   in std_logic_vector(31 downto 0);   ---Vector input
    i_wREG      :   in std_logic;  ---Almost didnt see it, could use better looking diagram
    i_JAL_JUMP  :   in std_logic;   ---if 1, forget i_ADDR_WR, $31 until jump is over

    o_DOUT_1    :   out std_logic_vector(31 downto 0);
    o_DOUT_2    :   out std_logic_vector(31 downto 0)

);

end REGISTER_FILE;

architecture ARCH_1 of REGISTER_FILE is

	type t_REG is array ( 0 to 31 ) of std_logic_vector( 31 downto 0 );
	signal REG	:	t_REG := (29 => x"7fffeffc", 28 => x"10008000" , others=>(others=>'0'));
	
	begin

        process(i_ADDR_RD_1, i_ADDR_RD_2, i_ADDR_WR, i_DIN, i_wREG, i_CLK) begin

		  if(rising_edge(i_CLK)) then
		  
            if i_JAL_JUMP = '0' then

                if(i_wREG = '1' and not (i_ADDR_WR = "00000")) then
                    REG(to_integer(unsigned(i_ADDR_WR)))    <=  i_DIN;
                end if;
            
            else    ---if jal, the inferred register is $31, or $ra
                REG(31)    <=  i_DIN;
            end if;
	
		  end if;

        end process;

    o_DOUT_1    <=  REG(to_integer(unsigned(i_ADDR_RD_1)));
    o_DOUT_2    <=  REG(to_integer(unsigned(i_ADDR_RD_2)));

    ---Much better code than PSD

end ARCH_1;
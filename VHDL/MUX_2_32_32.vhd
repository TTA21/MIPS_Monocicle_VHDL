library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUX_2_32_32 is

port(

	i_INPUT_1_32    :   in std_logic_vector(31 downto 0);
    i_INPUT_2_32    :   in std_logic_vector(31 downto 0);
    i_SEL_2         :   in std_logic;
    o_OUT_32        :   out std_logic_vector(31 downto 0)

);

end MUX_2_32_32;

architecture ARCH_1 of MUX_2_32_32 is

	begin

    o_OUT_32    <=  i_INPUT_1_32 when i_SEL_2 = '0' else i_INPUT_2_32;
	
end ARCH_1;
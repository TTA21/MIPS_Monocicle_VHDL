library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SHIFT_2_LEFT_32_32 is

port(

	i_INPUT_32  :   in std_logic_vector(31 downto 0);
    o_OUT_32    :   out std_logic_vector(31 downto 0)

);

end SHIFT_2_LEFT_32_32;

architecture ARCH_1 of SHIFT_2_LEFT_32_32 is

	begin

    o_OUT_32(1 downto 0)   <=  "00";
    o_OUT_32(31 downto 2)  <=  i_INPUT_32(29 downto 0);
	
end ARCH_1;
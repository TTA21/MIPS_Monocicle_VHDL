library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SHIFT_2_LEFT_26_28 is

port(

	i_INPUT_26  :   in std_logic_vector(25 downto 0);
    o_OUT_28    :   out std_logic_vector(27 downto 0)

);

end SHIFT_2_LEFT_26_28;

architecture ARCH_1 of SHIFT_2_LEFT_26_28 is

	begin

    o_OUT_28(1 downto 0)   <=  "00";
    o_OUT_28(27 downto 2)  <=  i_INPUT_26(25 downto 0);
	
end ARCH_1;
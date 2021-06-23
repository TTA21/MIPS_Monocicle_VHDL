library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CONCATONATE_28_4_32 is

port(

	i_INPUT_1_28    :   in std_logic_vector(27 downto 0);
    i_INPUT_2_4    :   in std_logic_vector(3 downto 0);
    o_OUT_32      :   out std_logic_vector(31 downto 0)

);

end CONCATONATE_28_4_32;

architecture ARCH_1 of CONCATONATE_28_4_32 is

	begin

    o_OUT_32    <=  i_INPUT_2_4 & i_INPUT_1_28;

end ARCH_1;
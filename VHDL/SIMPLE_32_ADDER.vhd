library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SIMPLE_32_ADDER is

port(

	i_INPUT_1_32    :   in std_logic_vector(31 downto 0);
    i_INPUT_2_32    :   in std_logic_vector(31 downto 0);
    o_OUT_32      :   out std_logic_vector(31 downto 0)

);

end SIMPLE_32_ADDER;

architecture ARCH_1 of SIMPLE_32_ADDER is

	begin

    o_OUT_32    <=  std_logic_vector(unsigned(i_INPUT_1_32) + unsigned(i_INPUT_2_32));
	
end ARCH_1;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PROGRAM_COUNTER_ADDER is

port(

	i_INPUT_32    :   in std_logic_vector(31 downto 0);
    o_OUT_32      :   out std_logic_vector(31 downto 0)

);

end PROGRAM_COUNTER_ADDER;

architecture ARCH_1 of PROGRAM_COUNTER_ADDER is

	begin

    o_OUT_32    <=  std_logic_vector(unsigned(i_INPUT_32) + 4);
	
end ARCH_1;
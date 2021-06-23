library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SIGN_EXT_16_32 is

port(

	i_INPUT_16  :   in std_logic_vector(15 downto 0);
    o_OUT_32    :   out std_logic_vector(31 downto 0)

);

end SIGN_EXT_16_32;

architecture ARCH_1 of SIGN_EXT_16_32 is

	begin

    --This idea looked so good in my head
    --o_OUT_32    <=  std_logic_vector(signed(i_INPUT_16));

    --had to go with this monstrosity instead
    o_OUT_32 <= "0000000000000000" & i_INPUT_16 when i_INPUT_16(15) = '0' 
                else "1111111111111111" &  i_INPUT_16;
	
	
end ARCH_1;
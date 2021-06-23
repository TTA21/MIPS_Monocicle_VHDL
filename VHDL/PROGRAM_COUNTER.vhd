library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PROGRAM_COUNTER is

port(
    i_CLK           :   in std_logic;
    i_CLK_RESET_n   :   in std_logic;
    i_PC            :   in std_logic_vector(31 downto 0);
    o_PC            :   out std_logic_vector(31 downto 0)
);

end PROGRAM_COUNTER;

architecture ARCH_1 of PROGRAM_COUNTER is
    signal s_PC_REG : std_logic_vector(31 downto 0) := x"00400000";

	begin
        process (i_CLK, i_PC) begin
            if(rising_edge(i_CLK)) then
                if(i_CLK_RESET_n = '0') then
                    s_PC_REG    <=  x"00400000";
                else
                    s_PC_REG    <=  i_PC;
                end if;
            end if;
        end process;

        o_PC    <=  s_PC_REG;
        --o_PC    <=  i_PC when not i_PC(31 downto 28) = "UUUU" else "0000" & i_PC(27 downto 0);
	
end ARCH_1;
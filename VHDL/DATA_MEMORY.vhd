library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DATA_MEMORY is

port(

    i_CLK       :   in std_logic;
    i_rMEM      :   in std_logic;
    i_wMEM      :   in std_logic;

    i_ADDR      :   in std_logic_vector(31 downto 0);
    i_DATA_IN   :   in std_logic_vector(31 downto 0);
    o_OUT       :   out std_logic_vector(31 downto 0)

);

end DATA_MEMORY;

architecture ARCH_1 of DATA_MEMORY is

    ---2 ^ 30 = 0x40000000 ... yeah, no. 
    --From .data(0x10010000, 0d268500992) down, and only 16 addresses, not like i'm gonna use it all

    --- First Algorithm
    type t_RAM is array ( 0 to 31 ) of std_logic_vector( 31 downto 0 );
	--signal RAM	:	t_RAM := (others=>(others=>'0'));
    signal RAM	:	t_RAM := (
        x"00000000",    ---0x10010000
        x"0000000a",    ---0x10010004
        x"00000014",    ---0x10010008
        x"0000001e",    ---0x1001000c
        x"00000028",    ---0x10010010
        x"00000032",    ---0x10010014
        x"0000003c",    ---0x10010018
        x"00000046",    ---0x1001001c
        x"00000050",    ---0x10010020
        x"0000005a",    ---0x10010024
        x"00000064",    ---0x10010028
        x"0000006e",    ---0x1001002c
        x"00000078",    ---0x10010030
        x"00000082",    ---0x10010034
        x"0000008c",    ---0x10010038
        x"00000096",    ---0x1001003c
        x"00000000",    ---0x10010040
        x"00000000",    ---you get the point
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000"
    );

    ---NOTE: Second and third algorithm do not require data mem

	begin

        process (i_CLK, i_rMEM, i_wMEM) begin
            if(rising_edge(i_CLK)) then

                if(i_wMEM = '1') then
                    RAM(( to_integer(unsigned(i_ADDR(13 downto 2))))) <= i_DATA_IN;
                    ---             address           - offset     / 4   
                end if;

            end if; --i_CLK
        end process;

        o_OUT <= RAM(( to_integer(unsigned(i_ADDR(13 downto 2))))) when i_rMEM = '1' else (others => '0');
                    --"XXXXXXXXXXXXXXXX00000000000000XX";
end ARCH_1;
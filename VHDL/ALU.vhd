library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is

port(

	i_A			:	in std_logic_vector(31 downto 0);
	i_B			:	in std_logic_vector(31 downto 0);
	i_OPERATION	:	in std_logic_vector(2 downto 0);
	
	o_OUT			:	out std_logic_vector(31 downto 0);
	o_ZERO_FLAG	:	out std_logic
	
	--MISSING OVERFLOW AND CARRY FOR NOW
	
	
);

end ALU;

architecture ARCH_1 of ALU is

	signal s_OUTPUT_BUFFER : std_logic_vector(31 downto 0);	--Just in case, might remove later

	begin
	
	process (i_A, i_B, i_OPERATION) begin
	
		case (i_OPERATION) is
		
			--Quicker than searching for the damn page in the book, fu*! linux mint's pdf viewer
			--http://personal.denison.edu/~bressoud/cs281-s08/homework/MIPSALU.html
			when "000" => s_OUTPUT_BUFFER <= i_A and i_B;
			when "001" => s_OUTPUT_BUFFER <= i_A or i_B;
			when "010" => s_OUTPUT_BUFFER <= std_logic_vector(signed(i_A) + signed(i_B));
			when "011" => s_OUTPUT_BUFFER <= i_B(15 downto 0) & "0000000000000000";	---lui, immediate expected at -i_B(15 downto 0)
			when "110" => s_OUTPUT_BUFFER <= std_logic_vector(signed(i_A) - signed(i_B));
			when "111" => 	--SLT
								if(signed(i_A) < signed(i_B)) then
									s_OUTPUT_BUFFER <= (0 => '1', others => '0'); -- 000...0001
								else
									s_OUTPUT_BUFFER <= (others => '0'); -- 000...0000
								end if;
			when others => NULL;
			---MISSING NOR, i_OPERATION VECTOR SIZE DOES NOT MATCH DOCUMENTATION, FIX LATER
			s_OUTPUT_BUFFER <= (others => '0');
		end case;
		
	end process;
		
	o_OUT	<=	s_OUTPUT_BUFFER;
	
	---10 minutes for this line, normal if statements dont work outside a  process for some god forsaken reason
	o_ZERO_FLAG <= '1' when s_OUTPUT_BUFFER = "00000000000000000000000000000000" else '0';
	
end ARCH_1;
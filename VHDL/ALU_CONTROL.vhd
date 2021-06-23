library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_CONTROL is

port(

	i_ALU_OP		:	in std_logic_vector(1 downto 0);
	i_FUNCT		:	in std_logic_vector(5 downto 0);	--only using first 4
	i_LOAD_IMM	:	in std_logic;
	i_OR_IMM	:	in std_logic;
	i_SLT_IMM	:	in std_logic;
	
	o_JR_JUMP	:	out std_logic;	---if 1, jr
	o_OPERATION	:	out std_logic_vector(2 downto 0)

);

end ALU_CONTROL;

architecture ARCH_1 of ALU_CONTROL is


	begin

		process (i_ALU_OP, i_FUNCT, i_LOAD_IMM, i_SLT_IMM) begin

			if i_LOAD_IMM = '0' and i_OR_IMM = '0' and i_SLT_IMM = '0' then --R
				o_OPERATION(2) <= (i_ALU_OP(0) or (i_ALU_OP(1) and i_FUNCT(1)));
				o_OPERATION(1) <= (not i_ALU_OP(1) or not i_FUNCT(2));
				o_OPERATION(0) <= (i_ALU_OP(1) and (i_FUNCT(3) or i_FUNCT(0)));
			end if;

			if i_LOAD_IMM = '1' then
				o_OPERATION <= "011";	---Forcing shift by 16
			end if;

			if i_OR_IMM = '1' then
				o_OPERATION <= "001";	---Forcing OR
			end if;

			if i_SLT_IMM = '1' then
				o_OPERATION <= "111";	---Forcing SLTI
			end if;


		end process;

		o_JR_JUMP	<=	'1' when i_FUNCT = "001000"	else '0';
	
end ARCH_1;
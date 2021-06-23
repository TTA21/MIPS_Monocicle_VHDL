library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INSTRUCTION_MEMORY is

port(

    i_CLOCK     :   in std_logic;
	i_ADDR      :   in std_logic_vector(31 downto 0) := x"00400000";
    o_INS_OUT   :   out std_logic_vector(31 downto 0)

);

end INSTRUCTION_MEMORY;

--00000000010000000000000000000000
--XXXXXXXXXX00000000000000000000XX

architecture ARCH_1 of INSTRUCTION_MEMORY is

   --- First Algorithm        WORKING       
   type t_RAM is array ( 0 to 6 ) of std_logic_vector( 31 downto 0 );
	signal INST	:	t_RAM := (
        x"20120001",    ---main:addi $s2, $zero, 1    # Inicializa $s2 em 1
        x"3c011001",    ---     lui  $1, 0x000010001  # como o exercício assume que o endereço-base de A[]
								---									# está em $s3, foi incluida esta instrução
        x"34330000",    ---     ori  $19, $1, 0x0
        x"8e680020",    ---     lw   $t0, 32($s3)     # $t0 = A[8]
        x"02484020",    ---     add  $t0, $s2, $t0    # $t0 = $t0 + h
        x"ae680030",    ---     sw   $t0, 48($s3)     # A[12] = $t
        x"00000000"		---	  nop
    );

   --- Second Algorithm        WORKING         
   --type t_RAM is array ( 0 to 8 ) of std_logic_vector( 31 downto 0 );
	--signal INST	:	t_RAM := (
   --     x"20100000",    ---main:addi $s0, $zero, 0
   --     x"20110001",    ---     addi $s1, $zero, 1
   --     x"20120002",    ---     addi $s2, $zero, 2
   --     x"20130003",    ---     addi $s3, $zero, 3 
   --     x"20140004",    ---     addi $s4, $zero, 4
   --     x"12740001",    ---     beq $s3, $s4, L1     # if i==j goto L1
   --     x"02328020",    ---     add $s0, $s1, $s2    # f = g + h = 1 + 2 = 3
   --     x"02138022",    ---L1:	sub $s0, $s0, $s3    # f = f - i = 3 - 3 = 0
   --     x"00000000"
   -- );

   --- Third Algorithm         WORKING         
   --type t_RAM is array ( 0 to 2 ) of std_logic_vector( 31 downto 0 );
	--signal INST	:	t_RAM := (
    --    x"20100001",    ---main:addi $s0, $zero, 1
    --    x"22100002",    ---loop:addi $s0, $s0, 2
    --    x"08100001"     ---     j    loop
    --    
    --);
	 
	 --- First Algorithm        WORKING       
	--type t_RAM is array ( 0 to 7 ) of std_logic_vector( 31 downto 0 );
	--signal INST	:	t_RAM := (
   --     x"08100005",		---		j   main
								---leaf_example:
	--	  x"00854020",		---		add $t0, $a0, $a1   # $t0 = g + h
	--	  x"00c74820",		---		add $t1, $a2, $a3   # $t1 = i + j
	--	  x"01091022",		---		sub $v0, $t0, $t1   # f = $t0 - $t1
	--	  x"03e00008",		---		jr  $ra             # retorna do procedimento
	--	  x"20040004",		---main:	addi $a0, $zero, 4  # inicializa 1º parâmetro (g)
	--	  x"20050003",		---		addi $a1, $zero, 3  # inicializa 2º parâmetro (h)
	--	  x"20060002",		---		addi $a2, $zero, 2  # inicializa 3º parâmetro (i)
	--	  x"20070001",		---		addi $a3, $zero, 1  # inicializa 4º parâmetro (j)
	--	  x"0c100001",		---		jal leaf_example    # chama o procedimento
	--	  x"00000000"		---		nop             	  # não faz nada. $v0 tem o resultado do procedimento
   -- );

	begin

    ---Reference:
    --- .text (0x00400000, or 0d4194304) <- offset
    ---                               ^ reset when 0 or 4, 0 is 0x003FFFFC

    o_INS_OUT <=  INST(( to_integer(unsigned(i_ADDR(21 downto 2)))));
                --XXXXXXXXXX0000000000000000000000

end ARCH_1;
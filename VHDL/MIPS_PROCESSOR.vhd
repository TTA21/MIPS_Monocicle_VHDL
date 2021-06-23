library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MIPS_PROCESSOR is

port(

    i_CLOCK     :   in std_logic;
    i_RESET     :   in std_logic;
    o_REGF_OUT_1    :   out std_logic_vector(31 downto 0);
    o_REGF_OUT_2    :   out std_logic_vector(31 downto 0)
	
);

end MIPS_PROCESSOR;

architecture ARCH_1 of MIPS_PROCESSOR is

    component MAIN_CONTROL is

        port(
        
            i_opcode		:	in std_logic_vector(5 downto 0);
            i_JR_JUMP		:	in std_logic;
	
            o_REG_DST	:	out std_logic;
            o_ALU_SRC	:	out std_logic;
            o_MEMtoREG	:	out std_logic;
            o_wREG		:	out std_logic;
            o_rMEM		:	out std_logic;
            o_wMEM		:	out std_logic;
            o_BRANCH		:	out std_logic;
            o_INCON_BRANCH	:	out std_logic;
            o_ALU_OP		:	out std_logic_vector(1 downto 0);
            o_LOAD_IMM		:	out std_logic;
            o_OR_IMM		:	out std_logic;
            o_SLT_IMM		:	out std_logic;
            o_JAL_JUMP		:	out std_logic
        
        );
        
    end component;

    component ALU_CONTROL is

        port(
        
            i_ALU_OP		:	in std_logic_vector(1 downto 0);
            i_FUNCT		:	in std_logic_vector(5 downto 0);	--only using first 4
            i_LOAD_IMM	:	in std_logic;   ---LUI
            i_OR_IMM	:	in std_logic;   ---ORI
            i_SLT_IMM	:	in std_logic;   ---SLTI
            
            o_JR_JUMP	:	out std_logic;	---if 1, jr
            o_OPERATION	:	out std_logic_vector(2 downto 0)
        
        );
        
    end component;

    component ALU is

        port(
        
            i_A			:	in std_logic_vector(31 downto 0);
            i_B			:	in std_logic_vector(31 downto 0);
            i_OPERATION	:	in std_logic_vector(2 downto 0);
            
            o_OUT			:	out std_logic_vector(31 downto 0);
            o_ZERO_FLAG	:	out std_logic
            
            --MISSING OVERFLOW AND CARRY FOR NOW
            
            
        );
        
    end component;

    component SIGN_EXT_16_32 is

        port(
        
            i_INPUT_16  :   in std_logic_vector(15 downto 0);
            o_OUT_32    :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component SHIFT_2_LEFT_32_32 is

        port(
        
            i_INPUT_32  :   in std_logic_vector(31 downto 0);
            o_OUT_32    :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component MUX_2_32_32 is

        port(
        
            i_INPUT_1_32    :   in std_logic_vector(31 downto 0);
            i_INPUT_2_32    :   in std_logic_vector(31 downto 0);
            i_SEL_2         :   in std_logic;
            o_OUT_32        :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component REGISTER_FILE is

        port(
        
            i_CLK       :   in std_logic;
        
            i_ADDR_RD_1 :   in std_logic_vector(4 downto 0);    ---Address linked to DOUT1
            i_ADDR_RD_2 :   in std_logic_vector(4 downto 0);    ---Address linked to DOUT2
            i_ADDR_WR   :   in std_logic_vector(4 downto 0);    ---Check for writing to $zero
            i_DIN       :   in std_logic_vector(31 downto 0);   ---Vector input
            i_wREG      :   in std_logic;  ---Almost didnt see it, could use better looking diagram
            i_JAL_JUMP  :   in std_logic;   ---if 1, forget i_ADDR_WR, $31 until jump is over

            o_DOUT_1    :   out std_logic_vector(31 downto 0);
            o_DOUT_2    :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component MUX_2_5_5 is

        port(
        
            i_INPUT_1_5    :   in std_logic_vector(4 downto 0);
            i_INPUT_2_5    :   in std_logic_vector(4 downto 0);
            i_SEL_2         :   in std_logic;
            o_OUT_5        :   out std_logic_vector(4 downto 0)
        
        );
        
    end component;

    component DATA_MEMORY is

        port(
        
            i_CLK       :   in std_logic;
            i_rMEM      :   in std_logic;
            i_wMEM      :   in std_logic;
        
            i_ADDR      :   in std_logic_vector(31 downto 0);
            i_DATA_IN   :   in std_logic_vector(31 downto 0);
            o_OUT       :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component INSTRUCTION_MEMORY is

        port(
        
            i_CLOCK     :   in std_logic;
            i_ADDR      :   in std_logic_vector(31 downto 0);
            o_INS_OUT   :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component PROGRAM_COUNTER_ADDER is

        port(
        
            i_INPUT_32    :   in std_logic_vector(31 downto 0);
            o_OUT_32      :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;
    
    component SIMPLE_32_ADDER is

        port(
        
            i_INPUT_1_32    :   in std_logic_vector(31 downto 0);
            i_INPUT_2_32    :   in std_logic_vector(31 downto 0);
            o_OUT_32      :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component CONCATONATE_28_4_32 is

        port(
        
            i_INPUT_1_28    :   in std_logic_vector(27 downto 0);
            i_INPUT_2_4    :   in std_logic_vector(3 downto 0);
            o_OUT_32      :   out std_logic_vector(31 downto 0)
        
        );
        
    end component;

    component PROGRAM_COUNTER is

        port(
            i_CLK   :   in std_logic;
            i_CLK_RESET_n   :   in std_logic;
            i_PC    :   in std_logic_vector(31 downto 0);
            o_PC    :   out std_logic_vector(31 downto 0)
        );
        
    end component;

    component SHIFT_2_LEFT_26_28 is

        port(
        
            i_INPUT_26  :   in std_logic_vector(25 downto 0);
            o_OUT_28    :   out std_logic_vector(27 downto 0)
        
        );
        
    end component;

    ---1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18

    ---CONTROLE
    signal s_REG_DST, s_ALU_SRC, s_MEMtoREG, s_wREG, s_rMEM, s_wMEM, s_BRANCH, s_INCON_BRANCH, s_LOAD_IMM, s_OR_IMM, s_SLT_IMM, s_JAL_JUMP : std_logic;
    signal s_ALU_OP     :   std_logic_vector(1 downto 0) := "00";

    ---MEMORIA DE INSTRUÇÕES
    signal s_ADDR   :   std_logic_vector(31 downto 0) := x"00400000";  ---From PC
    signal s_INS    :   std_logic_vector(31 downto 0) := x"00000000";  ---From Inst Memory

    ---MULTIPLEXER INST
    signal s_OUT_5  :   std_logic_vector(4 downto 0) := "00000";

    ---SIGNAL EXTENDER
    signal s_OUT_32_EXT :   std_logic_vector(31 downto 0) := x"00000000";

    ---REGISTER FILE
    signal s_DIN    :   std_logic_vector(31 downto 0) := x"00000000";
    signal s_DOUT_1 :   std_logic_vector(31 downto 0) := x"00000000";
    signal s_DOUT_2 :   std_logic_vector(31 downto 0) := x"00000000";

    ---ALU CONTROL
    signal s_OPERATION	:	std_logic_vector(2 downto 0) := "000";
    signal s_JR_JUMP    :   std_logic := '0';

    ---MUX BETWEE ALU AND REG FILE
    signal s_OUT_MUX_32    :   std_logic_vector(31 downto 0) := x"00000000";

    ---ALU
    signal s_OUT_ALU    :	std_logic_vector(31 downto 0) := x"00000000";
    signal s_ZERO_FLAG	:	std_logic := '0';

    ---DATA MEMORY
    signal s_OUT_DATA_MEM   :   std_logic_vector(31 downto 0) := x"00000000";

    ---Desl a esq
    signal o_OUT_32_SHIFT   :   std_logic_vector(31 downto 0) := x"00000000";

    ---PC SHIFT ADDER
    signal o_OUT_PC_SHIFT_ADD   :   std_logic_vector(31 downto 0) := x"00000000";

    --PC +4 ADDER
    signal o_OUT_PC_FOUR_ADD    :   std_logic_vector(31 downto 0) := x"00400000";

    ---14 MUX
    signal s_FOURTEEN_MUX_OUT   :   std_logic_vector(31 downto 0) := x"00400000";

    ---INST SHIFT
    signal s_INST_SHIFT_OUT     :   std_logic_vector(27 downto 0) := x"0000000";

    ---CONCATENATOR
    signal s_CONCAT_OUT         :   std_logic_vector(31 downto 0) := x"00400000";

    ---CONDITIONAL BRANCH MUX
    signal s_COND_BRANCH_MUX_OUT    :   std_logic_vector(31 downto 0) := x"00000000";
    signal s_COND_SEL               :   std_logic := '0';  ---VHDL back at it again with the bulls&*#

    ---JAL BRANCH
    signal s_ENTRY_TO_REGIST        :   std_logic_vector(31 downto 0) := x"00000000";

    ---JR BRANCH
    signal s_ENTRY_MUX_INCOND       :   std_logic_vector(31 downto 0) := x"00000000";

	begin

    controle :   MAIN_CONTROL port map( --18
        i_opcode    =>  s_INS(31 downto 26),
        i_JR_JUMP   =>  s_JR_JUMP,
            
        o_REG_DST   =>  s_REG_DST,  --
        o_ALU_SRC   =>  s_ALU_SRC,  --
        o_MEMtoREG  =>  s_MEMtoREG, --
        o_wREG      =>  s_wREG,     --
        o_rMEM      =>  s_rMEM,     --
        o_wMEM      =>  s_wMEM,     --
        o_BRANCH    =>  s_BRANCH,   -- also know as DvC, or desvio condicional
        o_INCON_BRANCH  =>  s_INCON_BRANCH,
        o_ALU_OP    =>  s_ALU_OP,   --
        o_LOAD_IMM  =>  s_LOAD_IMM,
        o_OR_IMM    =>  s_OR_IMM,
        o_SLT_IMM   =>  s_SLT_IMM,
        o_JAL_JUMP  =>  s_JAL_JUMP
    );

    memoria_de_instrucoes   :   INSTRUCTION_MEMORY port map(    --1
        i_CLOCK     =>  i_CLOCK,
        i_ADDR      =>  s_ADDR,
        o_INS_OUT   =>  s_INS
    );

    mux_inst    :   MUX_2_5_5 port map( --3
        i_INPUT_1_5 =>  s_INS(20 downto 16),
        i_INPUT_2_5 =>  s_INS(15 downto 11),
        i_SEL_2     =>  s_REG_DST,
        o_OUT_5     =>  s_OUT_5
    );

    sign_ext    :   SIGN_EXT_16_32 port map(    --5
        i_INPUT_16  =>  s_INS(15 downto 0),
        o_OUT_32    =>  s_OUT_32_EXT
    );

    banc_de_regist  :   REGISTER_FILE port map( --4
        i_CLK       =>  i_CLOCK,

        i_ADDR_RD_1 =>  s_INS(25 downto 21),
        i_ADDR_RD_2 =>  s_INS(20 downto 16),
        i_ADDR_WR   =>  s_OUT_5,
        i_DIN       =>  s_ENTRY_TO_REGIST,
        i_wREG      =>  s_wREG,
        i_JAL_JUMP  =>  s_JAL_JUMP,

        o_DOUT_1    =>  s_DOUT_1,
        o_DOUT_2    =>  s_DOUT_2
    );

    operacao_da_UAL :   ALU_CONTROL port map(   --6
        i_ALU_OP    =>  s_ALU_OP,
        i_FUNCT     =>  s_INS(5 downto 0),
        i_LOAD_IMM  =>  s_LOAD_IMM,
        i_OR_IMM    =>  s_OR_IMM,
        i_SLT_IMM   =>  s_SLT_IMM,
        
        o_JR_JUMP   =>  s_JR_JUMP,
        o_OPERATION =>  s_OPERATION
    );

    mux_in_alu  :   MUX_2_32_32 port map(   --7
        i_INPUT_1_32    =>  s_DOUT_2,
        i_INPUT_2_32    =>  s_OUT_32_EXT,
        i_SEL_2         =>  s_ALU_SRC,
        o_OUT_32        =>  s_OUT_MUX_32
    );

    ual :   ALU port map(       --8
        i_A             =>  s_DOUT_1,
        i_B             =>  s_OUT_MUX_32,
        i_OPERATION     =>  s_OPERATION,
        
        o_OUT           =>  s_OUT_ALU,
        o_ZERO_FLAG     =>  s_ZERO_FLAG
    );

    memoria_de_dados    :   DATA_MEMORY port map(   --9
        i_CLK       =>  i_CLOCK,
        i_rMEM      =>  s_rMEM,
        i_wMEM      =>  s_wMEM,

        i_ADDR      =>  s_OUT_ALU,
        i_DATA_IN   =>  s_DOUT_2,
        o_OUT       =>  s_OUT_DATA_MEM
    );

    mux_out_data_mem  :   MUX_2_32_32 port map(   --10
        i_INPUT_1_32    =>  s_OUT_ALU,
        i_INPUT_2_32    =>  s_OUT_DATA_MEM,
        i_SEL_2         =>  s_MEMtoREG,
        o_OUT_32        =>  s_DIN
    );

    desl_esq_extend :   SHIFT_2_LEFT_32_32 port map(    --11
        i_INPUT_32  =>  s_OUT_32_EXT,
        o_OUT_32    =>  o_OUT_32_SHIFT
    );

    pc_shift_adder    :   SIMPLE_32_ADDER port map(   --12
        i_INPUT_1_32    =>  o_OUT_PC_FOUR_ADD,
        i_INPUT_2_32    =>  o_OUT_32_SHIFT,
        o_OUT_32        =>  o_OUT_PC_SHIFT_ADD
    );

    prog_count  :   PROGRAM_COUNTER port map(   --2
        i_CLK   =>  i_CLOCK,
        i_CLK_RESET_n   =>  i_RESET,
        i_PC    =>  s_FOURTEEN_MUX_OUT,
        o_PC    =>  s_ADDR
    );

    pc_plus_four    :   PROGRAM_COUNTER_ADDER port map( --17
        i_INPUT_32  =>  s_ADDR,
        o_OUT_32    =>  o_OUT_PC_FOUR_ADD
    );

    inst_shift  :   SHIFT_2_LEFT_26_28 port map(    --16
        i_INPUT_26  =>  s_INS(25 downto 0),
        o_OUT_28    =>  s_INST_SHIFT_OUT
    );

    concatenate :   CONCATONATE_28_4_32 port map(   --15
        i_INPUT_1_28    =>  s_INST_SHIFT_OUT,
        i_INPUT_2_4     =>  o_OUT_PC_FOUR_ADD(31 downto 28),
        o_OUT_32        =>  s_CONCAT_OUT
    );

    s_COND_SEL  <=  (s_BRANCH and s_ZERO_FLAG);

    conditional_branch  :   MUX_2_32_32 port map(   --13
        i_INPUT_1_32    =>  o_OUT_PC_FOUR_ADD,
        i_INPUT_2_32    =>  o_OUT_PC_SHIFT_ADD,
        i_SEL_2         =>  s_COND_SEL,
        o_OUT_32        =>  s_COND_BRANCH_MUX_OUT
    );

    inconditional_branch    :   MUX_2_32_32 port map( --14
        i_INPUT_1_32    =>  s_COND_BRANCH_MUX_OUT,
        i_INPUT_2_32    =>  s_ENTRY_MUX_INCOND,
        i_SEL_2         =>  s_INCON_BRANCH,
        o_OUT_32        =>  s_FOURTEEN_MUX_OUT
    );

    jal_branch    :   MUX_2_32_32 port map( --extra, 18
        i_INPUT_1_32    =>  s_DIN,
        i_INPUT_2_32    =>  o_OUT_PC_FOUR_ADD,  ---if s_JAL_JUMP, this
        i_SEL_2         =>  s_JAL_JUMP,
        o_OUT_32        =>  s_ENTRY_TO_REGIST
    );

    jr_branch    :   MUX_2_32_32 port map( --extra, 19
        i_INPUT_1_32    =>  s_CONCAT_OUT,
        i_INPUT_2_32    =>  s_DOUT_1,   ---if s_JR_JUMP, this
        i_SEL_2         =>  s_JR_JUMP,
        o_OUT_32        =>  s_ENTRY_MUX_INCOND
    );


    o_REGF_OUT_1    <=  s_DOUT_1;
    o_REGF_OUT_2    <=  s_DOUT_2;
	
end ARCH_1;
library IEEE;
use IEEE.std_logic_1164.all;
entity Mydesign is
  port( CLK, reset_neg : in std_logic );
end Mydesign;

architecture design of Mydesign is

--- 4 input multiplexer
component Mux4 is
  port( -- input
        input_1    : in std_logic_vector(31 downto 0);
        input_2    : in std_logic_vector(31 downto 0):="00000000000000000000000000000100";
        input_3    : in std_logic_vector(31 downto 0);
        input_4    : in std_logic_vector(31 downto 0);
        mux_select : in std_logic_vector(1 downto 0);

        -- output
        output     : out std_logic_vector(31 downto 0) );
component Mux4;


---ALU
component ALU is
port(
	input1 : in STD_LOGIC_VECTOR(31 downto 0); --first 32bit input
    input2 : in STD_LOGIC_VECTOR(31 downto 0); --second 32bit input
    output : out STD_LOGIC_VECTOR(31 downto 0); -- output value 
   opcode : in STD_LOGIC_VECTOR(3 downto 0);
    carryin : IN STD_LOGIC;
    flags : out std_logic_vector(3 downto 0);
    
    );
component ALU;


component Mux2_4 is
  port( -- input
        input_1    : in std_logic_vector(3 downto 0);
        input_2    : in std_logic_vector(3 downto 0);
        mux_select : in std_logic;

        -- output
        output     : out std_logic_vector(3 downto 0) );
component Mux2_4;



component Memory is
port(
--inputs
CLK : in std_logic;
address : in std_logic_vector(31 downto 0);
Memwrite : in std_logic;
Memwritedata: in std_logic_vector(31 downto 0);

--outputs
Memreaddata: out std_logic_vector(31 downto 0));
component Memory;


component Registerfile is
  port( -- input
        CLK          : in std_logic;
        reset_neg    : in std_logic;
        address_1 : in std_logic_vector(3 downto 0);
        address_2 : in std_logic_vector(3 downto 0);
        writeaddress    : in std_logic_vector(3 downto 0);

        writedatatoregister   : in std_logic_vector(31 downto 0);
        Registerwrite     : in std_logic;  -- signal control

        -- output
        output_1   : out std_logic_vector(31 downto 0);
        output_2   : out std_logic_vector(31 downto 0) );
component Registerfile;


component Instructionregister is
  GENERIC(n : integer := 32);
  port( -- input
        CLK             : in std_logic;
        reset_neg       : in std_logic;
        IRWrite         : in std_logic;
        input  : in std_logic_vector(31 downto 0);

        -- output
        output : out std_logic_vector(31 downto 0) );
component Instructionregister;




component Programcounter is
port( -- input
      CLK        : in  std_logic;
      reset_neg  : in  std_logic;
      input      : in  std_logic_vector(31 downto 0);
      PW  : in  std_logic;

      -- output
      output : out std_logic_vector(31 downto 0) );
component Programcounter;


component Dataregister is
  port( -- inputs
        CLK        : in std_logic;
        reset_neg  : in std_logic;
        input      : in std_logic_vector(31 downto 0);    -- from MemDataOut
        DW         : in std_logic;
        -- output
        output     : out std_logic_vector(31 downto 0) ); -- to mux
component Dataregister;

component A_B_RES is
  port( -- input
        CLK         : in std_logic;
        reset_neg   : in std_logic;
        Ainput    : in std_logic_vector (31 downto 0);
        Binput: in std_logic_vector (31 downto 0);
        RESinput  : in std_logic_vector (31 downto 0);
        AW       : in std_logic;
        BW       : in std_logic;
        RESW      : in std_logic;
        -- output
          Aoutput  : out std_logic_vector(31 downto 0);
          Boutput   : out std_logic_vector(31 downto 0);
          RESoutput : out std_logic_vector(31 downto 0) );
component A_B_RES;


component conditionchecker is
port(--inputs
  clk : in std_logic;
  reset_neg : in std_logic;
  instruction : in std_logic_vector(3 downto 0);
  input : in std_logic_vector(3 downto 0);
  --outputs
  output : out std_logic);
component conditionchecker;


component flag is
port( --inputs
    clk : in std_logic;
    reset_neg : In std_logic;
    Fset : in std_logic;
    input : in std_logic_vector(3 downto 0);
    --outputs
    output : out std_logic_vector(3 downto 0));
component flag;

component Mux2 is
  port( -- input
        input_1    : in std_logic_vector(31 downto 0);
        input_2    : in std_logic_vector(31 downto 0);
        mux_select : in std_logic;

        -- output
        output     : out std_logic_vector(31 downto 0) );
component Mux2;


component Mux2_1 is
  port( -- input
        input_1    : in std_logic_vector(31 downto 0);
        input_2    : in std_logic_vector(31 downto 0);
        mux_select : in std_logic;

        -- output
        output     : out std_logic_vector(31 downto 0) );
component Mux2_1;


component Mux2_2 is
  port( -- input
        input_1    : in std_logic_vector(31 downto 0);
        input_2    : in std_logic_vector(31 downto 0);
        mux_select : in std_logic;

        -- output
        output     : out std_logic_vector(31 downto 0) );
component Mux2_2;

component Decoder is
 Port (
    instruction : in word;
    instr_class : out instr_class_type;
    operation : out optype;
    DP_subclass : out DP_subclass_type;
    DP_operand_src : out DP_operand_src_type;
    load_store : out load_store_type;
    DT_offset_sign : out DT_offset_sign_type
);
component Decoder;



-----signals


  signal PC_out, MuxToAddress, MemDataOut, MemoryDataRegOut, InstructionRegOut, MuxToWriteData, ReadData1ToA, ReadData2ToB, RegAToMux, RegBOut, SignExtendOut, ShiftLeft1ToMux4, MuxToAlu, Mux4ToAlu, AluResultOut, AluOutToMux, JumpAddress, MuxToPC : std_logic_vector(31 downto 0);
  
  
  signal ZeroCarry_TL, ALUSrcA_TL, RegWrite_TL, RegDst_TL, PCWriteCond_TL, PCWrite_TL, IorD_TL, MemRead_TL, MemWrite_TL, MemToReg_TL, IRWrite_TL, ANDtoOR, ORtoPC : std_logic;
 
 signal MuxToWriteRegister : std_logic_vector(4 downto 0);
 
 signal ALUControltoALU : std_logic_vector(3 downto 0);
 
 signal PCsource_TL, ALUSrcB_TL, ALUOp_TL : std_logic_vector(1 downto 0);


begin

  ANDtoOR <= ZeroCarry_TL and PCWriteCond_TL;
  ORtoPC <= ANDtoOR or PCWrite_TL;
  JumpAddress(31 downto 28) <= PC_out(31 downto 28);

  A_Logic_Unit : ALU                 port map(MuxToAlu, Mux4ToALU, ALUControltoALU, AluResultOut, ZeroCarry_TL);
  ALU_CONTROL  : ALUControl          port map(ALUOp_TL, InstructionRegOut(5 downto 0), ALUControltoALU);
  CTRL_UNIT    : ControlUnit         port map(CLK, reset_neg, InstructionRegOut(31 downto 26), PCWriteCond_TL, PCWrite_TL, IorD_TL, MemRead_TL, MemWrite_TL, MemToReg_TL, IRWrite_TL, PCsource_TL, ALUOp_TL, ALUSrcB_TL, ALUSrcA_TL, RegWrite_TL, RegDst_TL);
  INSTR_REG    : InstructionRegister port map(CLK, reset_neg, IRWrite_TL, MemDataOut, InstructionRegOut);
  MEM          : Memory              port map(CLK, reset_neg, MuxToAddress, MemWrite_TL, MemRead_TL, RegBOut, MemDataOut);
  MEM_DATA_REG : MemoryDataRegister  port map(CLK, reset_neg, MemDataOut, MemoryDataRegOut);
  MUX_1        : Mux2                port map(PC_out, AluOutToMux, IorD_TL, MuxToAddress);
  MUX_2        : Mux2_5              port map(InstructionRegOut(20 downto 16), InstructionRegOut(15 downto 11), RegDst_TL, MuxToWriteRegister);
  MUX_3        : Mux2                port map(AluOutToMux, MemoryDataRegOut, MemToReg_TL, MuxToWriteData);
  MUX_4        : Mux2                port map(PC_out, RegAToMux, ALUSrcA_TL, MuxToAlu);
  MUX_5        : Mux4                port map(RegBOut, PC_increment, SignExtendOut, ShiftLeft1ToMux4, ALUSrcB_TL, Mux4ToAlu);
  MUX_6        : Mux3                port map(AluResultOut, AluOutToMux, JumpAddress, PCsource_TL, MuxToPC);
  PC           : ProgramCounter      port map(CLK, reset_neg, MuxToPC, ORtoPC, PC_out);
  REG          : Registers           port map(CLK, reset_neg, InstructionRegOut(25 downto 21), InstructionRegOut(20 downto 16), MuxToWriteRegister, MuxToWriteData, RegWrite_TL, ReadData1ToA, ReadData2ToB);
  SE           : SignExtend          port map(InstructionRegOut(15 downto 0), SignExtendOut);
  SLL1         : ShiftLeft           port map(SignExtendOut, ShiftLeft1ToMux4);
  SLL2         : ShiftLeft2          port map(InstructionRegOut(25 downto 0), JumpAddress(27 downto 0));
  TEMP_REG     : TempRegisters       port map(CLK, reset_neg, ReadData1ToA, ReadData2ToB, AluResultOut, RegAToMux, RegBOut, AluOutToMux);

end Behavioral;











































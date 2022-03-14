library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
  port( -- input
        i_clk         : in std_logic;
        reset       : in std_logic;
        input       : in std_logic_vector(11 downto 0);

        -- output (control signals)
        PW : out std_logic;
        RW     : out std_logic;
        IorD        : out std_logic;
        DW     : out std_logic;
        MW    : out std_logic;
        Rsrc    : out std_logic;
        IW     : out std_logic;
        Fset     : out std_logic;
        M2R   : out std_logic;
        Asrc1      : out std_logic;
        Asrc2     : out std_logic_vector(1 downto 0);
        AW     : out std_logic;
        BW    :out std_logic;
        ReW   :out std_logic;
        op  :out std_logic_vector(3 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

  type state is( state0,state1,state2,state3,state4,state5,state6,state7,state8 );

  signal current_state, next_state : state;
  signal ctrl_signal : std_logic_vector(14 downto 0) := (others => '0');

begin

  process(i_clk, reset, input)
  begin
    if reset = '0' then
      current_state <= state0;
    elsif rising_edge(i_clk) then
      current_state <= next_state;
    end if;

    case current_state is

      when state0  => next_state <= state1;

      when state1 => if input(7 downto 6) = "00" then 
                                  next_state <= state2;   --DP instruction
                                elsif input(7 downto 6) = "01"  then 
                                  next_state <= state3;      --DT instruction
                                elsif input(7 downto 6) = "10" then 
                                  next_state <= state4;    --Branch instruction
                                end if;

      when state2 =>  next_state <= state5;
      when state5 =>  next_state <= state0;
      when state3 =>  if input(0) = '0' then 
                                  next_state <= state6;   --str instruction
                                elsif input(0) = '1'  then 
                                  next_state <= state7;      --ldr instruction
                                  end if;
       when state6 =>  next_state <= state0;
       when state7 =>  next_state <= state8;
       when state8 =>  next_state <= state0;
       when state4 =>  next_state <= state0;
      
    end case;
  end process;

  with current_state select
	    ctrl_signal <= "100000100001001" when state0,
                  "010000000000110" when state1,
                  "000000001010111" when state2,
                  "000001000000000" when state3,
                  "000000000011000" when state4,
                  "010000000000000" when state5,
                  "001010000000000" when state6,
                  "001100000000000" when state7,
                  "010000001000000" when state8,
                  "000000000000000" when others;

 
        PW   <= ctrl_signal(14);
        RW    <= ctrl_signal(13); 
        IorD  <= ctrl_signal(12);    
        DW   <= ctrl_signal(11); 
        MW    <= ctrl_signal(10);
        Rsrc  <= ctrl_signal(9);  
        IW     <= ctrl_signal(8);
        Fset   <= ctrl_signal(7);
        M2R   <= ctrl_signal(6);
        Asrc1 <= ctrl_signal(5);    
        Asrc2 <= ctrl_signal(4 downto 3);    
        AW    <= ctrl_signal(2); 
        BW    <= ctrl_signal(1);
        ReW   <= ctrl_signal(0);
        
        op <=  input(5 downto 2);
end Behavioral;



library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Instr_reg is
  GENERIC(n : integer := 32);
  port( -- input
        i_clk             : in std_logic;
        reset       : in std_logic;
        IRWrite         : in std_logic;
        input  : in std_logic_vector(31 downto 0);

        -- output
        output : out std_logic_vector(31 downto 0) );
end Instr_reg;

architecture design of Instr_reg is
  type IR_type is array (0 to 0) of std_logic_vector(31 downto 0);
  signal inputto : IR_type := ((others => (others => '0')));

begin
  process(i_clk)
  begin
    if reset = '0' then -- reset
      inputto(0) <= (others => '0');
    else if rising_edge(i_clk) and IRWrite = '1' then
      inputto(0) <= input;
    end if;
    end if;
  end process;

  output <= inputto(0);  -- instruction

end design;



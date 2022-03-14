library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity p_counter is
port( -- input
      i_clk        : in  std_logic;
      reset  : in  std_logic;
      input      : in  std_logic_vector(31 downto 0);
      PW  : in  std_logic;  --control signal 

      -- output
      output : out std_logic_vector(31 downto 0) );
end p_counter;

architecture behav_counter of p_counter is

begin

  process(i_clk)
  begin
    if reset = '0' then
      output <= (others => '0' );
    elsif (rising_edge(i_clk) and (PW = '1')) then
      output <= input;
    end if;
  end process;

end behav_counter;


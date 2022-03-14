
-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
  port( -- input
        input_1    : in std_logic_vector(31 downto 0);
        input_2    : in std_logic_vector(31 downto 0);
        mux_signal : in std_logic; --control signal

        -- output
        output     : out std_logic_vector(31 downto 0) );
end mux;

architecture design of mux is
begin
  with mux_signal select
    output <= input_1 when '0', input_2 when others;

end design;


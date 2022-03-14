library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity DR is
  port( -- inputs
        i_clk        : in std_logic;
        reset  : in std_logic;
        input      : in std_logic_vector(31 downto 0);    -- from MemDataOut
        DW         : in std_logic; -- control signal 
        -- output
        output     : out std_logic_vector(31 downto 0) ); -- to mux
end DR;

architecture design of DR is
  type  data_reg_type is array (0 downto 0) of std_logic_vector(31 downto 0);
  signal inputto:data_reg_type := ((others => (others => '0'))); --signal for stroring dta_reg_type array


begin
  process(i_clk)
  begin
    if reset = '0' then -- reset
       inputto(0) <= (others => '0');
    else if (rising_edge(i_clk) and DW='1')
    then
    inputto(0) <= input;
    end if;
    end if;
  end process;

  output <=  inputto(0);

end design;


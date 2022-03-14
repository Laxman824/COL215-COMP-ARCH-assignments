
------------------------------------------
--Data memory
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity datamemory is 
 port( 
     read:   in std_logic_vector(31 downto 0) 
     write: out std_logic;
     data_in: in std_logic
     enable: in std_logic

);
end datamemory;

architecture Behavioral of datamemory is

type PROGMEM is array(63 downto 0) of unsigned(31 downto 0);

begin

process (i_clk)
begin
	if rising_edge(i_clk) then
		o_data <= s_pm(to_integer(read));
	end if;
end process;

end Behavioral;

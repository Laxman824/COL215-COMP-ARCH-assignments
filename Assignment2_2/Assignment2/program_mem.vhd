library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Contains the program instructions
entity ProgramMemory is
port ( 
	i_clk:			in std_logic;
	read:			in std_logic_vector(5 downto 0);
	o_data:			out std_logic_vector(31 downto 0)
	
);
end ProgramMemory;

architecture Behavioral of ProgramMemory is

type PROGMEM is array(63 downto 0) of std_logic_vector(31 downto 0);
signal mem : PROGMEM:= (X"00000002",
X"00000004",
others => X"00000000");




begin

process (i_clk)
begin
	if rising_edge(i_clk) then
		o_data <= mem(to_integer(unsigned(read)));
	end if;
end process;

end Behavioral;

















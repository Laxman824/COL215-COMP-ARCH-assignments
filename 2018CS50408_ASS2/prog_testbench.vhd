library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity testbench is 
end entity;


architecture register_part of testbench is 
component ProgramMemory is
port ( 
	i_clk:			in std_logic;
	read:			in std_logic_vector(5 downto 0);
	o_data:			out std_logic_vector(31 downto 0));
end component;
signal i_clk : std_logic;
signal read:	 std_logic_vector(5 downto 0):= "000000";
signal o_data:	 std_logic_vector(31 downto 0);
	
begin 
	uut: ProgramMemory port map(i_clk => i_clk ,read => read, o_data => o_data);
process begin 


   read <= "010000";
    wait for 50 ns;
   read <= "001000";
    wait for 10ns;
    
   end process;
end;

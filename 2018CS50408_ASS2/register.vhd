library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Responsible to provide general-purpose registers R0..R31, I/O memory and RAM.
entity RegisterFile_RAM is
port ( 
	i_clk:			in std_logic;
	-- control path
	i_we1:			in std_logic; -- write enable
	

	-- data path 
	write: 			in std_logic_vector (3 downto 0);
	data: 			in std_logic_vector(31 downto 0);--input
	read_1 :   		in std_logic_vector(3 downto 0);
	read_2 :   		in std_logic_vector(3 downto 0);
	data_1:			out std_logic_vector(31 downto 0);--output
	data_2:			out std_logic_vector(31 downto 0)
);
end RegisterFile_RAM;

architecture Behavioral of RegisterFile_RAM is

type REGS_ARRAY is array(15 downto 0) of std_logic_vector(31 downto 0);
signal rgstr:  REGS_ARRAY := (others => (others => '0'));


begin



process (i_clk)
begin
	if rising_edge(i_clk) then  
	
	data_1 <= rgstr(to_integer(unsigned(read_1)));
	data_2 <= rgstr(to_integer(unsigned(read_2)));

	if i_we1='1' then  --as given 
		rgstr(to_integer(unsigned(write))) <= data;
	if read_1  = write then data_1 <= data;
	    end if ;
	if read_2 = write then data_2 <= data;
	  end if;
	end if;
 end if ;
end process;

end Behavioral;





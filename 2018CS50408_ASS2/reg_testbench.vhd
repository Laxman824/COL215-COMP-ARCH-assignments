library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;



entity testbench is 
end entity;


architecture register_part of testbench is 
component RegisterFile_RAM is
port ( 
	i_clk:			in std_logic;
	i_we1:			in std_logic; -- write enable
	write: 			in std_logic_vector (3 downto 0);
	data: 			in std_logic_vector(31 downto 0);--input
	read_1 :   		in std_logic_vector(3 downto 0);
	read_2 :   		in std_logic_vector(3 downto 0);
	data_1:			out std_logic_vector(31 downto 0);--output
	data_2:			out std_logic_vector(31 downto 0)
);
end component;

signal i_clk: std_logic:= '0';
signal i_we1 : std_logic:= '1';
signal write:    std_logic_vector(3 downto 0):= "0000";
signal data:     std_logic_vector(31 downto 0):= (others =>'0');
signal read_1 :  std_logic_vector(3 downto 0):= "0000";
signal read_2 :  std_logic_vector(3 downto 0):= "0000";
signal data_1: std_logic_vector(31 downto 0);--output
signal data_2:	 std_logic_vector(31 downto 0);

 begin 
	uut: RegisterFile_RAM port map(i_clk => i_clk,i_we1 => i_we1,write => write,data => data,read_1=> read_1 ,read_2=> read_2,data_1 => data_1,data_2 => data_2);
process begin 


    i_clk <= '1';
    data <= X"00000004";
    write <= "0010";
    read_1 <= "0010";
    wait for 10ns;
    i_clk <= '0';
    wait for 10ns;
    
   end process;
end register_part;
    

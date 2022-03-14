
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.ALL;
 
entity testbench is
--empty
end testbench;

architecture tb of testbench is
	
component alu
port(
	r1 : in STD_LOGIC_VECTOR(31 downto 0); --first 32bit input
    r2 : in STD_LOGIC_VECTOR(31 downto 0); --second 32bit input
    output : out STD_LOGIC_VECTOR(31 downto 0); -- output value 
    flags : out std_logic_vector(3 downto 0);
    func : in STD_LOGIC_VECTOR(3 downto 0);
    
    carry : in STD_LOGIC;
 --   carry_out : out STD_LOGIC
    );
end component;
    
  signal r1 : std_logic_vector(31 downto 0) := (others => '0');
   signal r2 : std_logic_vector(31 downto 0) := (others => '0');
   signal flags : std_logic_vector (3 downto 0);
   signal func : std_logic_vector(3 downto 0) := (others => '0');
   signal carry : std_logic:='0';
   --signal carry_out :std_logic;

  --Outputs
   signal output : std_logic_vector(31 downto 0);
   
begin
	uut: ALU PORT MAP (
          r1 => r1,
          r2 => r2,
          func => func,
          output => output,
          carry =>carry
  --        carry_out => carry_out
        );
process
begin
	r1 <= x"00000003";
    r2 <= x"00000004";
    func <= x"0";
    wait for 100ns;
 for i in 0 to 15 loop
 	func <= func + x"1";
    wait for 100ns;
   end loop;
   		r1<= x"000000F6";
        r2<= x"0000000A";
        wait;
       end process;
end;
       
        
    
    
    
	
   	
   
   
   
   
   

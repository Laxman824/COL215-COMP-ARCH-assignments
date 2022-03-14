
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.ALL;

entity alu is
port(
    r1 : in STD_LOGIC_VECTOR(31 downto 0); --first 32bit input
    r2 : in STD_LOGIC_VECTOR(31 downto 0); --second 32bit input
     
    flags : out std_logic_vector(3 downto 0);
    func : in STD_LOGIC_VECTOR(3 downto 0);
    
    carry : IN STD_LOGIC;
    output : out STD_LOGIC_VECTOR(31 downto 0); -- output value 
    
    );
end alu;

architecture behavioral of alu is 

signal temp_result : STD_LOGIC_VECTOR(32 downto 0);

begin
	process(r1,r2,func)
begin
	case func is
    --and
    	when "0000" => 
        	temp_result <= ('0' & r1) and ('0' & r2);
    --eor
        when "0001" =>
        	temp_result <= ('0' & r1) xor ('0' & r2);
    --sub
    	when "0010" => 
        	temp_result <= ('0' & r1) + (not ('0' & r2)) +'1';
    --rsb
    	when "0011" =>
        	temp_result <= (not ('0' &r1)) + ('0' & r2) + '1';
   -- add
    	when "0100" =>
        	temp_result <= ('0' & r1) + ('0' & r2);
    --adc
    	when "0101" =>
        	temp_result <= ('0' & r1) + ('0' & r2) + carry;
    --sbc
    	when "0110" =>
        	temp_result <= ('0' & r1) + (not ('0' & r2)) + carry;
    --rsc 
    	when "0111" =>
        	temp_result <= (not ('0' & r1)) + ('0' & r2) + carry;
    --tst
    	when "1000" => 
        	temp_result <= ('0' & r1) and ('0' & r2);
    --teq
    	when "1001" =>
        	temp_result <= ('0' & r1) xor ('0' & r2);
    --cmp
    	when "1010" =>
        	temp_result <= ('0' & r1) + (not ('0' & r2)) +'1';
    --cmn
    	when "1011" =>
        	temp_result <= ('0' & r1) + ('0' & r2);
    --orr
    	when "1100" =>
        	temp_result <= ('0' & r1) or ('0' & r2);
    --mov 
    	when "1101" =>
        	temp_result <= ('0' & r2);
    --bic
    	when "1110" =>
        	temp_result <= ('0' & r1) and (not ('0' & r2));
    --mvn
    	when "1111" =>
        	temp_result <= ('0' & not r2);
            
        when others => temp_result <= ('0' & r1) + ('0' & r2);
    end case;
    end process;
output <= temp_result(31 downto 0);
				--instead of flags we have assigned 
flags(3) <=temp_result(32);
flags(0) <=temp_result(31);
flags(1) <= not(temp_result(31) or temp_result(30) or temp_result(29) or temp_result(28) or temp_result(27) or  temp_result(26) or  temp_result(25) or  temp_result(24) or  temp_result(23) or temp_result(22) or   temp_result(21) or  temp_result(20) or  temp_result(19) or  temp_result(18) or  temp_result(17) or  temp_result(16) or  temp_result(15) or  temp_result(14) or  temp_result(13) or  temp_result(12) or  temp_result(11) or  temp_result(10) or  temp_result(9) or  temp_result(8) or  temp_result(7) or  temp_result(6) or  temp_result(5) or  temp_result(4) or  temp_result(3) or  temp_result(2) or  temp_result(1) or  temp_result(0) );
flags(2) <='0';
end behavioral;
            












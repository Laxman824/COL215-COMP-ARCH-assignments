library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Alu is
port ( a: in std_logic_vector(31 downto 0);
       b: in std_logic_vector(31 downto 0);
      res: out std_logic_vector(31 downto 0);
      opcode: in std_logic_vector(3 downto 0);
--	clk: in std_logic;
	cin: in std_logic; --carry in 
	cout: out std_logic); --carry out 
    
	
end Alu;	

architecture alu_part of Alu is 
signal temp1 : std_logic_vector(32 downto 0);
signal temp2  : std_logic_vector(32 downto 0);
signal temp3  : std_logic_vector(32 downto 0); 
begin

temp1 <='0' & a;

temp2 <='0' & b;
  --this is for result
process(a, b, opcode, cin)  is begin

case opcode is



when "0000" =>

res <= a xor b ;


when "0001" =>
res <= a xor  b; 


when "0010" =>
res <= a +(not  b )+1;


when "0011" =>
res <= (not a )+  b+1;

 
when "0100" =>
res <= a +  b;


when "0101" =>
res <= a +  b+cin;



when "0110" =>
res <= a + ( not b)+cin;


when "0111" =>
res <= (not a) +b+cin;

--when "1000" =>

--res <= a and  b ;



when "1000" =>

res <= a and  b ;


when "1001" =>
res <= a xor  b ;


when "1010" =>
res <= a +( not  b)+1;



when "1011" =>

res <= a +  b ;

when "1100" =>

res <= a or  b ;


when "1101" =>
res <= b;

when "1110"=>
res <= a and (not b);       

when "1111" =>
res <= (not b);

when others =>
res <=  "00000000000000000000000000000000";

end case;

end process;

end alu_part;

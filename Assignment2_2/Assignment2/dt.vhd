library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity dt is 
port(   a: in std_logic_vector(31 downto 0);
	b: in std_logic_vector(31 downto 0);
	Ubit: in std_logic;

	);

end dt;

architecture dt_part of dt is 
--signal temp : std_logic_vector(32 downto 0);
signal Instr : std_logic_vector(31 downto 0);
signal Ubit :std_logic;
signal predicate: std_logic;

begin 

Ubit <= Instr (23);


-- DT instructions ldr, str
when "ldr" =>
if (Ubit = '1') then
a +b ;
else
a+ not b+1;
end if;

when "str" =>
if (Ubit = '1') then
a +b ;
else
a+ not b+1;
end if;


-- Branch instructions b, beq, bne


when "10" =>
if (predicate = '1') then
-- This assignment to PC would override earlier assignment
PC <= std_logic_vector (signed(PC) + signed(S_ext & S_offset & "00") + 8);



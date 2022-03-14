Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity program_counter is port(
	d : in std_logic_vector(31 downto 0); --inp here d is data  
	clk: in std_logic ;	--clock 
	q   : out std_logic_vector(31 downto 0));   
end program_counter;


architecture pc of program_counter is 
signal  Zflag, predicate : std_logic;
signal Instr : std_logic_vector (31 downto 0);
signal F, OP, Cond : std_logic_vector (1 downto 0);
signal Offset : std_logic_vector (11 downto 0);
signal S_ext : std_logic_vector (5 downto 0);  --sign

begin 
	process(clk)
	begin 
		S_ext <= "111111" when (Instr(23) = '1') else "000000";
		F <= Instr (27 downto 26);
		Cond <= Instr (29 downto 28);
		 with Cond select
			predicate <= '1' when "10",
			Zflag when "00",
			not Zflag when "01",
			'0' when others;

if rising_edge(clk) then 
	out  <=  std_logic_vector(signed(in)+4);
	if (F ="10") then 
		if (predicate='1') then 
			out <= std_logic_vector (signed(PC) + signed(S_ext & S_offset & "00") + 8);
	else 
		in <= out + x"4";
		out <= in;
	     end if ;
          end process;
end pc;
		

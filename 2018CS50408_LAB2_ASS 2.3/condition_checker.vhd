library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity cond_check is
port(--inputs
 i_clk : in std_logic;
  reset : in std_logic;
  instr : in std_logic_vector(3 downto 0);
  inp_ : in std_logic_vector(3 downto 0);
  --outputs
  out_ : out std_logic);
  end cond_check;
  Architecture design of cond_check is
   begin
   process(input,instr)
   begin
 case instr is 
when "0000"  => output <='1' when input(1)='1';
when "0001"  => output <= '1' when input(1)='0';--here input(1) means zflag
when others  =>  output <='0' ; 
end case;
  end process;
 end design;          
  


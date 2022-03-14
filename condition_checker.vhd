library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity cond_check is
port(--inputs
  i_clk : in std_logic;
  reset : in std_logic;
  instruction : in std_logic_vector(3 downto 0);
  input : in std_logic_vector(3 downto 0);
  --outputs
  output : out std_logic);
  end cond_check;
  
  
  Architecture design of cond_check is
   begin
   process(input,instruction)
   begin
 case instruction is 
when "0000"  => output <='1' when input(1)='1';
when "0001"  => output <= '1' when input(1)='0';
when others  =>  output <='0' ; 
end case;
  end process;
 end design;  
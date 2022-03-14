library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity flags_all is
port( --inputs
    i_clk : in std_logic;
    reset : In std_logic;
    Flgset : in std_logic;
    inp : in std_logic_vector(3 downto 0);
    --outputs
    output : out std_logic_vector(3 downto 0));
end flags_all;

Architecture flag_part of flags_all is
signal temp:std_logic_vector(3 downto 0);
begin 
process(i_clk)
begin 
  if reset ='0' then
     temp <= "0000";
   else if (rising_edge(i_clk) and Flgset='1') then
    temp <= inp;
    end if;
    end if;
    end process;
    output <=temp;
    end flag_part;

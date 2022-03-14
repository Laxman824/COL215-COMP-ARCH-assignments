library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity extn is
  port( -- input
        input  : in std_logic_vector(11 downto 0);

        -- output
        output : out std_logic_vector(31 downto 0) );
end extn ;

architecture design of extn is
begin

 output <= "00000000000000000000" & input ;
           

end design;

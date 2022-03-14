library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extn is
  port( -- input
        input  : in std_logic_vector(23 downto 0);

        -- output
        output : out std_logic_vector(31 downto 0) );
end sign_extn ;

architecture design of sign_extn is
begin

 output <= "00000000" & input when (input(15) = '0') else
           "11111111" & input;

end design;

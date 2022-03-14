library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity Decoder is
 Port (
    instruction : in std_logic_vector(31 downto 0);
    input1 : out std_logic_vector(11 downto 0);
  input2 : out  std_logic_vector(3 downto 0);
    input3 : out  std_logic_vector(3 downto 0);
    input4: out  std_logic_vector(3 downto 0);
  input5 : out  std_logic_vector(11 downto 0);
   input6: out  std_logic_vector(23 downto 0);
);
end Decoder;

architecture design of Decoder is
begin
input1 <=  instruction(31 downto 20);
input2 <=   instruction(19 downto 16);
input3 <=    instruction(3 downto 0);
input4  <=    instruction(15 downto 12);
input5  <=    instruction(11 downto 0);
input6  <=    instruction(23 downto 0);
end design;

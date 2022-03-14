library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component Alu is
port(
  a: in std_logic_vector(31 downto 0);
  b: in std_logic_vector(31 downto 0);
  res: out std_logic_vector(31 downto 0);
  opcode: in std_logic_vector(3 downto 0);
 -- clk: in std_logic;
  cin: in std_logic;
  cout: out std_logic);       --carry out
 
end component;

signal  a_in,b_in,res_out : std_logic_vector(31 downto 0);
signal  opcode_in : std_logic_vector(3 downto 0);
signal cin_in,cout_out:std_logic;
begin
-- Connect DUT
  DUT: Alu port map(a_in, b_in, res_out,opcode_in,cin_in,cout_out);

  process
  begin
    a_in <= "00000000000000011000000000000000";
    b_in <= "00100000000000000000000000000000";
    opcode_in <= "0100";
    
    wait for 1 ns;
    assert(res_out ="00100000000000011000000000000000") report "Fail 0/0" severity error;
  
    
    -- Clear inputs
  --  a_in <= ;"00000000000000000000000000010000";
  --  b_in <= "00000000000000000000000001100000";

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;

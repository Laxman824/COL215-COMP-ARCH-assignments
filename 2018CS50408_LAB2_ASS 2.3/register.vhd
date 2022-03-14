
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Registerfile_RAM is
  port( -- input
        i_clk          : in std_logic;
        reset    : in std_logic;
        addr1 : in std_logic_vector(3 downto 0);
        addr2 : in std_logic_vector(3 downto 0);
        writeaddress    : in std_logic_vector(3 downto 0);

        w_data_register   : in std_logic_vector(31 downto 0);
        rgstr_write     : in std_logic;  -- signal control

        -- output
        out_1   : out std_logic_vector(31 downto 0);
        out_2   : out std_logic_vector(31 downto 0) );
end Registerfile_RAM;

architecture design of Registerfile_RAM is
  type  registerfile_type  is array (0 to 15) of std_logic_vector(31 downto 0);
  signal input : registerfile_type := (others => (others => '0'));

begin

  process(i_clk)
  begin
    if reset = '0' then -- reset
     input(to_integer(unsigned(writeaddress))) <= (others => '0');
      else if rising_edge(i_clk) and rgstr_write = '1' then
        input(to_integer(unsigned(writeaddress))) <= w_data_register;
      end if;
    end if;
  end process;

 out_1 <= input(to_integer(unsigned(addr1)));  -- read in address 1
 out_2 <=input(to_integer(unsigned(addr2)));  -- read in address 2

end design;



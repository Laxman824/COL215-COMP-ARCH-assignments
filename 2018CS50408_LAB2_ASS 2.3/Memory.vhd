library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Mem_processor DESIGN  

entity Mem_processor is
port(
--inputs
i_clk : in std_logic;
addr : in std_logic_vector(31 downto 0);
Memwrite : in std_logic;--just a single 
Memwrite_data: in std_logic_vector(31 downto 0);

--outputs
Memread_data: out std_logic_vector(31 downto 0));
end Mem_processor;


Architecture design of Mem_processor is

type Mem_processor_type is array(0 to 63) of std_logic_vector(7 downto 0);
signal mem_part :Mem_processor_type :=(



others => "00000000" );






begin

  process(CLK)
  begin
   
    if rising_edge(CLK) and Memwrite = '1' then
      mem_part(to_integer(unsigned(addr)))     <= Memwrite_data(31 downto 24);
      mem_part(to_integer(unsigned(addr) + 1)) <= Memwrite_data(23 downto 16);
      mem_part(to_integer(unsigned(addr) + 2)) <= Memwrite_data(15 downto 8);
      mem_part(to_integer(unsigned(addr) + 3)) <= Memwrite_data(7  downto 0);
    end if;
  end process;
  
  process(CLK)
  begin
   
    if rising_edge(CLK) and Memwrite = '0' then

  Memreaddata<= mem_part(to_integer(unsigned(addr))) & 
             mem_part(to_integer(unsigned(addr) + 1)) &
             mem_part(to_integer(unsigned(addr) + 2)) &
               mem_part(to_integer(unsigned(addr) + 3)) ;
   end if;
  end process;

end design;



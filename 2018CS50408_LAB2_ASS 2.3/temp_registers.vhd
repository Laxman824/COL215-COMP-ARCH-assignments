library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity temp_rgstr is
  port( -- input
        i_clk         : in std_logic;
        reset   : in std_logic;
        A_inp    : in std_logic_vector (31 downto 0);
        B_inp: in std_logic_vector (31 downto 0);
        RES_inp  : in std_logic_vector (31 downto 0);
        AW       : in std_logic;
        BW       : in std_logic;
        RESW      : in std_logic;
        -- output
          A_out  : out std_logic_vector(31 downto 0);
          B_out   : out std_logic_vector(31 downto 0);
          RES_out : out std_logic_vector(31 downto 0) );
end temp_rgstr;

architecture temp_ of temp_rgstr is
  type registers is array (0 to 2) of std_logic_vector(31 downto 0);
  signal data : registers := ((others => (others => '0')));

begin
  process(i_clk)
  begin
    if reset = '0' then -- reset
      data <= ((others => (others => '0')));
    else if rising_edge(i_clk)  then
      data(0) <= A_inp;
      data(1) <= B_inp;
      data(2) <= RES_inp;
    end if;
    end if;
  end process;

 A_out   <= data(0);
 B_out   <= data(1);
 RES_out <= data(2);

end  temp_;



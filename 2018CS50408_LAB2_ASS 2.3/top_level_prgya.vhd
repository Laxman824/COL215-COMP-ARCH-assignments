ibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity top_level is 
Port (
    clk,reset: in std_logic;  
);
end top_level; 
architecture Behavioral of top_level is   
----Now in this main component, we have an edge triggered process, which changes the state of FSM and also performs assignments to A, B, IR, etc.

--In same architecture, we also have concurrent assignments of some local signals which take care of the "glue code" or the multiplexing logic, connecting different components.

--The multiplexing logic here would also depend on the current state of the FSM, right?  For eg, in the first state, the read address of the data memory will be output of PC, whereas in other states it would come from RES.


A,B,IR,DR,RES. 
type state_type is (s0, s1,s2, s3, s4, s5, s6, s7, s8,s9); 
signal yfsm : state_type;
signal A,B ,IR,DR,RES: std_logic_vector(31 downto 0);
component pc is
    Port ( 
	d : in std_logic_vector(31 downto 0); --inp here d is data  
	clk: in std_logic ;	--clock 
	q   : out std_logic_vector(31 downto 0));            
       
       );
    
end component;
component Mem is
    Port (  
       
       );
    
end component;

component Register is
    Port (  
	i_clk:			in std_logic;
	-- control path
	i_we1:			in std_logic; -- write enable
	

	-- data path 
	write: 			in std_logic_vector (3 downto 0);
	data: 			in std_logic_vector(31 downto 0);--input
	read_1 :   		in std_logic_vector(3 downto 0);--Rm   
	read_2 :   		in std_logic_vector(3 downto 0);
	data_1:			out std_logic_vector(31 downto 0);--output
	data_2:			out std_logic_vector(31 downto 0);
       
       );
    
end component;
component ALU is
    Port (   a: in std_logic_vector(31 downto 0);
       b: in std_logic_vector(31 downto 0);
      res: out std_logic_vector(31 downto 0);
      opcode: in std_logic_vector(3 downto 0);
--	clk: in std_logic;
	cin: in std_logic; --carry in 
	cout: out std_logic); --carry out 

       
       );
    
end component;
component flags  is
    Port (  i_carryin : in std_logic;	
	i_carryout: in std_logic;	
	o_res        : out std_logic_vector(31 downto 0);
	o_v        : out std_logic;--this are the flags 
	o_z        : out std_logic;
	o_n        : out std_logic;
       
       );
    
end component;
component mux2_1  is
    Port (  
        
       
       );
    
end component;
component mux4_1  is
    Port (  
       
       );
    
end component;
component S2  is
    Port (  
           
       );
    
end component;
component ex is
    Port (  
       
       );
    
end component;
component InstructionRegister is 
port(
    CLK   : in std_logic;
    reset: in std_logic;
    IRwrite: in std_logic;
    in_instruction : in std_logic
)



end Behavioral

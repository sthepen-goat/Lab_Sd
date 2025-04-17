LIBRARY IEEE;
use ieee.std_logic_1164.all;

entity FlipFlop_dataflow is
	port( clock: in std_logic;
		  D: in std_logic;
	      Q: out std_logic
	    );
end FlipFlop_dataflow;

architecture dataflow of FlipFlop_dataflow is
signal temp : std_logic;
begin
Q <= D when rising_edge(clock);
end dataflow;
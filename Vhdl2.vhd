library ieee;
use ieee.std_logic_1164.all;

entity Door_opener is
port ( 
	pino_c,pino_h,pino_p	: in std_logic;
	pino_f			: out std_logic
     );
end Door_opener;

architecture dataflow of Door_opener is
begin
	pino_f <= not(pino_c) and (pino_h or pino_p) ;

end dataflow;
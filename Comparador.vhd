library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity comparador is

generic
	(
		DATA_WIDTH : natural := 16
	);

	port 
	(
		a	: in std_logic_vector	((DATA_WIDTH-1) downto 0);
		b	: in std_logic_vector	((DATA_WIDTH-1) downto 0);
		maior	: out std_logic;
		menor	: out std_logic;
		igual	: out std_logic
	);


end comparador;

architecture teste of comparador is

	-- Declarations (optional)
signal A_signed, B_signed : signed(DATA_WIDTH-1 downto 0);
signal A_abs, B_abs : signed(DATA_WIDTH-1 downto 0);

begin

A_signed <= signed(a);
B_signed <= signed(b);

A_abs <= -A_signed when A_signed(DATA_WIDTH-1 downto 0) = '1' else A_signed;
B_abs <= -B_signed when B_signed(DATA_WIDTH-1 downto 0) = '1' else B_signed;

maior_comparador : maior <= 
	'1' when A_abs<B_abs else
	'0'; -- when A=B else

menor_comparador : menor <= 
	'1' when A_abs>B_abs else
	'0'; -- when A=B else
	
igual_comparador : igual <= 
	'1' when A_abs=B_abs else
	'0';
end teste;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_Door_opener is
end tb_Door_opener;

architecture teste of tb_Door_opener is

component Door_opener is
port ( 
	pino_c,pino_h,pino_p	: in std_logic;
	pino_f			: out std_logic
     );
end component;

signal fio_c, fio_h, fio_p, fio_f: std_logic;

begin

instancia_door_opener: Door_opener port map(pino_c=>fio_c, pino_h=>fio_h, pino_p=>fio_p, pino_f=>fio_f);

fio_c <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;
fio_h <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns;
fio_p <= '0', '1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '0' after 200 ns, '1' after 250 ns,
         '0' after 300 ns, '1' after 350 ns, '0' after 400 ns;

end teste;
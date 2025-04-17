library IEEE;
use IEEE.std_logic_1164.all;

entity tb_fulladder is
end tb_fulladder;

architecture TB of tb_fulladder is
    signal x, y, Cin : std_logic := '0';
    signal s, Cout   : std_logic;
begin
    uut: entity work.fulladder
        port map (
            x => x,
            y => y,
            Cin => Cin,
            s => s,
            Cout => Cout
        );

    x <= not x after 2.5 ns;
    y <= not y after 5 ns;
    Cin <= not Cin after 10 ns;

    process
    begin
        wait for 40 ns;
        assert false report "Fim da simulação" severity note;
        wait;
    end process;
end TB;
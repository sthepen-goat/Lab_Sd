library IEEE;
use IEEE.std_logic_1164.all;

entity tb_Somador4Bits is
end tb_Somador4Bits;

architecture TB of tb_Somador4Bits is
    signal A, B   : std_logic_vector(3 downto 0);
    signal S      : std_logic_vector(3 downto 0);
    signal Cin, Cout : std_logic;
begin
    uut: entity work.Somador4Bits
        port map (
            A => A,
            B => B,
            Cin => Cin,
            S => S,
            Cout => Cout
        );

    process
    begin
        A <= "0001"; B <= "0010"; Cin <= '0';
        wait for 10 ns;

        A <= "0101"; B <= "0011"; Cin <= '1';
        wait for 10 ns;

        A <= "1111"; B <= "0001"; Cin <= '0';
        wait for 10 ns;

        wait;
    end process;
end TB;
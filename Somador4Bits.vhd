library IEEE;
use IEEE.std_logic_1164.all;

entity Somador4Bits is
    port (
        A    : in std_logic_vector(3 downto 0);
        B    : in std_logic_vector(3 downto 0);
        Cin  : in std_logic;
        S    : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end Somador4Bits;

architecture Estrutural of Somador4Bits is
    component fulladder
        port (
            Cin  : in std_logic;
            x    : in std_logic;
            y    : in std_logic;
            s    : out std_logic;
            Cout : out std_logic
        );
    end component;

    signal C : std_logic_vector(3 downto 0); -- C(0) = Cin, C(4) = Cout

begin
    C(0) <= Cin;

    FA0: fulladder port map (Cin => C(0), x => A(0), y => B(0), s => S(0), Cout => C(1));
    FA1: fulladder port map (Cin => C(1), x => A(1), y => B(1), s => S(1), Cout => C(2));
    FA2: fulladder port map (Cin => C(2), x => A(2), y => B(2), s => S(2), Cout => C(3));
    FA3: fulladder port map (Cin => C(3), x => A(3), y => B(3), s => S(3), Cout => Cout);

end Estrutural;
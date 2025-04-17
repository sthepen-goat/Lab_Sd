library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladder is
    port (
        Cin  : in std_logic;
        x    : in std_logic;
        y    : in std_logic;
        s    : out std_logic;
        Cout : out std_logic
    );
end fulladder;

architecture Comportamental of fulladder is
begin
    process(x, y, Cin)
        variable soma : unsigned(1 downto 0);
    begin
        soma := ("0" & x) + ("0" & y) + ("0" & Cin); 
        s    <= soma(0);  
        Cout <= soma(1);  
    end process;
end Comportamental;
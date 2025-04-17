library IEEE;
use IEEE.std_logic_1164.all;

entity tb_RegW is
end tb_RegW;

architecture TB of tb_RegW is
    constant W : integer := 4;

    signal clock : std_logic := '0';
    signal reset : std_logic;
    signal load  : std_logic;
    signal D     : std_logic_vector(W-1 downto 0);
    signal Q     : std_logic_vector(W-1 downto 0);

begin
    -- Instancia do DUT (Device Under Test)
    uut: entity work.RegW
        generic map (W => W)
        port map (
            clock => clock,
            reset => reset,
            load  => load,
            D     => D,
            Q     => Q
        );

    -- Geração do clock: alterna a cada 5 ns
    clock <= not clock after 5 ns;

    -- Estímulos
    stimulus: process
    begin
        reset <= '0';
        load  <= '0';
        D     <= "0000";
        wait for 10 ns;

        reset <= '1';  -- desativa reset
        D     <= "1010";
        load  <= '1';  -- ativa load
        wait for 10 ns;

        load  <= '0';  -- desativa load (mantém valor)
        D     <= "1111";
        wait for 10 ns;

        load  <= '1';  -- ativa load de novo
        wait for 10 ns;

        -- Finaliza simulação
        wait for 20 ns;
        assert false report "Fim da simulação" severity note;
        wait;
    end process;

end TB;
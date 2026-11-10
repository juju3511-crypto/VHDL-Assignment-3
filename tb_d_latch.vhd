library ieee;
use ieee.std_logic_1164.all;

entity tb_d_latch is
end entity;

architecture sim of tb_d_latch is
    signal d, en, q, qn : std_logic := '0';
begin
    uut : entity work.d_latch port map(d => d, en => en, q => q, qn => qn);

    process
    begin
        en <= '1'; d <= '1'; wait for 10 ns;   -- follow : Q=1
        d <= '0';            wait for 10 ns;   -- follow : Q=0
        d <= '1';            wait for 10 ns;   -- follow : Q=1
        en <= '0';           wait for 10 ns;   -- close the gate
        d <= '0';            wait for 10 ns;   -- hold : Q stays 1
        en <= '1';           wait for 10 ns;   -- follow : Q=0
        en <= '0';           wait for 10 ns;   -- close the gate
        d <= '1';            wait for 10 ns;   -- hold : Q stays 0
        wait;
    end process;
end architecture;
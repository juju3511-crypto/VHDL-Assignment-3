library ieee;
use ieee.std_logic_1164.all;

entity tb_rs_latch is
end entity;

architecture sim of tb_rs_latch is
    signal s, r, q, qn : std_logic := '0';
begin
    uut : entity work.rs_latch port map(s => s, r => r, q => q, qn => qn);

    process
    begin
        s <= '1'; r <= '0'; wait for 10 ns;   -- Set
        s <= '0'; r <= '0'; wait for 10 ns;   -- Hold (Q=1)
        s <= '0'; r <= '1'; wait for 10 ns;   -- Reset
        s <= '0'; r <= '0'; wait for 10 ns;   -- Hold (Q=0)
        s <= '1'; r <= '1'; wait for 10 ns;   -- Forbidden (Q=Qn=0)
        s <= '1'; r <= '0'; wait for 10 ns;   -- Recover by Set
        wait;
    end process;
end architecture;
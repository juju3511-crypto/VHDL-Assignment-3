library ieee;
use ieee.std_logic_1164.all;

entity tb_jk_ff is
end entity;

architecture sim of tb_jk_ff is
    signal j, k, clk, q, qn : std_logic := '0';
begin
    uut : entity work.jk_ff port map(j => j, k => k, clk => clk, q => q, qn => qn);

    -- clock : period 20 ns, rising edges at 10, 30, 50, 70, 90, 110 ns
    clk_gen : process
    begin
        for i in 1 to 6 loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;

    -- J, K change while clk is low
    stim : process
    begin
        j <= '1'; k <= '0'; wait for 20 ns;   -- edge 10  : Set    -> Q=1
        j <= '0'; k <= '0'; wait for 20 ns;   -- edge 30  : Hold   -> Q=1
        j <= '0'; k <= '1'; wait for 20 ns;   -- edge 50  : Reset  -> Q=0
        j <= '1'; k <= '1';                   -- edge 70, 90, 110 : Toggle
        wait;
    end process;
end architecture;
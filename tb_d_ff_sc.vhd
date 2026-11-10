library ieee;
use ieee.std_logic_1164.all;

entity tb_d_ff_sc is
end entity;

architecture sim of tb_d_ff_sc is
    signal d, clk, set, clr, q, qn : std_logic := '0';
begin
    uut : entity work.d_ff_sc
        port map(d => d, clk => clk, set => set, clr => clr, q => q, qn => qn);

    -- clock : period 20 ns, rising edges at 10, 30, 50, 70, 90, 110 ns
    clk_gen : process
    begin
        for i in 1 to 6 loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;

    stim : process
    begin
        d <= '1';              wait for 20 ns;   --   0 : edge 10 -> Q=1 (normal)
        d <= '0';              wait for 15 ns;   --  20 : edge 30 -> Q=0 (normal)
        set <= '1';            wait for 10 ns;   --  35 : async set -> Q=1 at once
        set <= '0';            wait for 10 ns;   --  45 : edge 50 (d=0) -> Q=0
        d <= '1';              wait for 20 ns;   --  55 : edge 70 -> Q=1
        clr <= '1';            wait for 10 ns;   --  75 : async clear -> Q=0 at once
        set <= '1';            wait for 10 ns;   --  85 : set=clr=1 -> clear wins, Q=0
        clr <= '0';            wait for 5 ns;    --  95 : only set=1 -> Q=1
        set <= '0'; d <= '0';                    -- 100 : edge 110 -> Q=0 (normal)
        wait;
    end process;
end architecture;
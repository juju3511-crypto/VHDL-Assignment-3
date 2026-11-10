library ieee;
use ieee.std_logic_1164.all;

entity tb_d_ff is
end entity;

architecture sim of tb_d_ff is
    signal d, clk, q, qn : std_logic := '0';
begin
    uut : entity work.d_ff port map(d => d, clk => clk, q => q, qn => qn);

    -- clock : period 20 ns, rising edges at 10, 30, 50, 70 ns
    clk_gen : process
    begin
        for i in 1 to 4 loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;

    -- input d changes at various times
    stim : process
    begin
        d <= '0'; wait for 5 ns;
        d <= '1'; wait for 10 ns;   --  5 ns : d=1 before edge -> Q waits
        d <= '0'; wait for 10 ns;   -- 15 ns : clk=1, d=0 -> ignored
        d <= '1'; wait for 2 ns;    -- 25 ns : short pulse while clk=0
        d <= '0'; wait for 18 ns;   -- 27 ns : back to 0 before edge
        d <= '1';                   -- 45 ns
        wait;
    end process;
end architecture;
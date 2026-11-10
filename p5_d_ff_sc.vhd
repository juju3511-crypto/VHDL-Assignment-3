library ieee;
use ieee.std_logic_1164.all;

-- Positive-edge D flip-flop with asynchronous set / clear
--   clr = '1'             : Q <= '0' immediately (highest priority)
--   set = '1' (clr = '0') : Q <= '1' immediately
--   otherwise             : normal D flip-flop
entity d_ff_sc is
    port(
        d, clk   : in  std_logic;
        set, clr : in  std_logic;
        q, qn    : out std_logic
    );
end entity d_ff_sc;

architecture bhv of d_ff_sc is
    signal q_i : std_logic := '0';
begin
    process(clk, set, clr)
    begin
        if clr = '1' then              -- checked first -> clear has priority
            q_i <= '0';
        elsif set = '1' then
            q_i <= '1';
        elsif rising_edge(clk) then
            q_i <= d;
        end if;
    end process;

    q  <= q_i;
    qn <= not q_i;
end architecture bhv;
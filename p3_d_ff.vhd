library ieee;
use ieee.std_logic_1164.all;

-- Positive-edge-triggered D flip-flop
entity d_ff is
    port(
        d, clk : in  std_logic;
        q, qn  : out std_logic
    );
end entity d_ff;

architecture bhv of d_ff is
    signal q_i : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then   -- only at the 0 -> 1 moment of clk
            q_i <= d;
        end if;
    end process;

    q  <= q_i;
    qn <= not q_i;
end architecture bhv;
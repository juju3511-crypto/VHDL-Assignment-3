library ieee;
use ieee.std_logic_1164.all;

-- RS latch : two cross-coupled NOR gates
entity rs_latch is
    port(
        s, r  : in  std_logic;
        q, qn : out std_logic
    );
end entity rs_latch;

architecture bhv of rs_latch is
    signal q_i  : std_logic := '0';
    signal qn_i : std_logic := '1';
begin
    q_i  <= r nor qn_i;   -- upper NOR : Q  = (R + Q')'
    qn_i <= s nor q_i;    -- lower NOR : Q' = (S + Q)'

    q  <= q_i;
    qn <= qn_i;
end architecture bhv;
library ieee;
use ieee.std_logic_1164.all;

-- D latch with enable (level triggered)
entity d_latch is
    port(
        d, en : in  std_logic;
        q, qn : out std_logic
    );
end entity d_latch;

architecture bhv of d_latch is
    signal q_i : std_logic := '0';
begin
    process(d, en)
    begin
        if en = '1' then
            q_i <= d;        -- en=1 : transparent, Q follows D
        end if;              -- en=0 : no assignment -> keeps old value
    end process;

    q  <= q_i;
    qn <= not q_i;
end architecture bhv;
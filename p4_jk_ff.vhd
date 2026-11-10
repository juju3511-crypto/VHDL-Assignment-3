library ieee;
use ieee.std_logic_1164.all;

-- Positive-edge-triggered JK flip-flop
--   JK = 00 Hold, 01 Reset, 10 Set, 11 Toggle
entity jk_ff is
    port(
        j, k, clk : in  std_logic;
        q, qn     : out std_logic
    );
end entity jk_ff;

architecture bhv of jk_ff is
    signal q_i : std_logic := '0';
    signal jk  : std_logic_vector(1 downto 0);
begin
    jk <= j & k;               -- combine J and K into 2 bits

    process(clk)
    begin
        if rising_edge(clk) then
            case jk is
                when "00"   => q_i <= q_i;       -- Hold
                when "01"   => q_i <= '0';       -- Reset
                when "10"   => q_i <= '1';       -- Set
                when "11"   => q_i <= not q_i;   -- Toggle
                when others => q_i <= q_i;
            end case;
        end if;
    end process;

    q  <= q_i;
    qn <= not q_i;
end architecture bhv;
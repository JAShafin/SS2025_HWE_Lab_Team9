library ieee;
use ieee.std_logic_1164.all;

entity tb_XORGATTER is
end entity;

architecture behavior of tb_XORGATTER is
    signal X, Y : std_logic := '0';
    signal Z    : std_logic;
begin
    -- Instantiate the XOR gate
    uut: entity work.ExampleXORGATTER
        port map (
            X => X,
            Y => Y,
            Z => Z
        );

    -- Stimulus process
    stim_proc: process
    begin
        X <= '0'; Y <= '0'; wait for 2000 us;
        X <= '0'; Y <= '1'; wait for 2000 us;
        X <= '1'; Y <= '0'; wait for 2000 us;
        X <= '1'; Y <= '1'; wait for 2000 us;
        wait;
    end process;
end architecture;


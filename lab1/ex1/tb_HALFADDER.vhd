library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_HALFADDER is
end entity;

architecture behavior of tb_HALFADDER is
    signal A, B : std_logic := '0';
    signal S, C : std_logic;
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.HALFADDER
        port map (
            A => A,
            B => B,
            S => S,
            C => C
        );

    -- Stimulus process
    stim_proc: process
    begin
        A <= '0'; B <= '0'; wait for 2 us;
        A <= '0'; B <= '1'; wait for 2 us;
        A <= '1'; B <= '0'; wait for 2 us;
        A <= '1'; B <= '1'; wait for 2 us;
        wait;
    end process;
end architecture;


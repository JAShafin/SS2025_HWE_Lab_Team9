library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MY_HALFADDER is
end TB_MY_HALFADDER;

architecture sim of TB_MY_HALFADDER is
    -- Component declaration
    component MY_HALFADDER is
        port (
            A, B : in std_logic;
            S, C : out std_logic
        );
    end component;

    -- Signals to connect to the half adder
    signal A, B : std_logic := '0';
    signal S, C : std_logic;
begin
    -- Instantiate the half adder
    UUT: MY_HALFADDER
        port map (
            A => A,
            B => B,
            S => S,
            C => C
        );

    -- Test process
    stim_proc: process
    begin
        -- Test case 1: A = 0, B = 0
        A <= '0'; B <= '0';
        wait for 10 ns;

        -- Test case 2: A = 0, B = 1
        A <= '0'; B <= '1';
        wait for 10 ns;

        -- Test case 3: A = 1, B = 0
        A <= '1'; B <= '0';
        wait for 10 ns;

        -- Test case 4: A = 1, B = 1
        A <= '1'; B <= '1';
        wait for 10 ns;

        wait;
    end process;
end sim;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MY_FULLADDER is
    port (
        A, B, Cin : in std_logic;
        Sum, Cout : out std_logic
    );
end entity;

architecture Structural of MY_FULLADDER is
    signal S1, C1, C2 : std_logic;

    component MY_HALFADDER
        port (
            A, B : in std_logic;
            S, C : out std_logic
        );
    end component;

begin
    HA1: MY_HALFADDER port map(A => A, B => B, S => S1, C => C1);
    HA2: MY_HALFADDER port map(A => S1, B => Cin, S => Sum, C => C2);
    Cout <= C1 or C2;
end architecture;


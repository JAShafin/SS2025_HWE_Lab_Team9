library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RIPPLE4_ADDER is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Cin  : in std_logic;
        Sum  : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end entity;

architecture structure of RIPPLE4_ADDER is
    signal C : std_logic_vector(4 downto 0);
    component MY_FULLADDER
        port (
            A, B, Cin : in std_logic;
            Sum, Cout : out std_logic
        );
    end component;
begin
    C(0) <= Cin;

    FA0: MY_FULLADDER port map(A => A(0), B => B(0), Cin => C(0), Sum => Sum(0), Cout => C(1));
    FA1: MY_FULLADDER port map(A => A(1), B => B(1), Cin => C(1), Sum => Sum(1), Cout => C(2));
    FA2: MY_FULLADDER port map(A => A(2), B => B(2), Cin => C(2), Sum => Sum(2), Cout => C(3));
    FA3: MY_FULLADDER port map(A => A(3), B => B(3), Cin => C(3), Sum => Sum(3), Cout => C(4));

    Cout <= C(4);
end architecture;


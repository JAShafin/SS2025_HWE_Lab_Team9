library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GENERIC_RIPPLE_ADDER is
    generic (
        N : integer := 4  -- You can change N to 8, 16, etc.
    );
    port (
        A, B : in std_logic_vector(N-1 downto 0);
        Cin  : in std_logic;
        Sum  : out std_logic_vector(N-1 downto 0);
        Cout : out std_logic
    );
end entity;

architecture structure of GENERIC_RIPPLE_ADDER is
    signal C : std_logic_vector(N downto 0);

    component MY_FULLADDER
        port (
            A, B, Cin : in std_logic;
            Sum, Cout : out std_logic
        );
    end component;
begin
    C(0) <= Cin;

    GEN: for i in 0 to N-1 generate
        FA: MY_FULLADDER port map(
            A => A(i),
            B => B(i),
            Cin => C(i),
            Sum => Sum(i),
            Cout => C(i+1)
        );
    end generate;

    Cout <= C(N);
end architecture;


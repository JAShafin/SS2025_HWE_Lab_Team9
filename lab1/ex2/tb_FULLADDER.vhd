library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_FULLADDER is
end entity;

architecture behavior of tb_FULLADDER is
    signal A, B, Cin : std_logic := '0';
    signal Sum, Cout : std_logic;

    -- Component declaration
    component FULLADDER
        port (
            A, B, Cin : in std_logic;
            Sum, Cout : out std_logic
        );
    end component;

begin
    -- Instantiate Full Adder
    UUT: FULLADDER port map(
        A => A,
        B => B,
        Cin => Cin,
        Sum => Sum,
        Cout => Cout
    );

    -- Test all input combinations
    stim_proc: process
    begin
        A <= '0'; B <= '0'; Cin <= '0'; wait for 20 ns;
        A <= '0'; B <= '0'; Cin <= '1'; wait for 20 ns;
        A <= '0'; B <= '1'; Cin <= '0'; wait for 20 ns;
        A <= '0'; B <= '1'; Cin <= '1'; wait for 20 ns;
        A <= '1'; B <= '0'; Cin <= '0'; wait for 20 ns;
        A <= '1'; B <= '0'; Cin <= '1'; wait for 20 ns;
        A <= '1'; B <= '1'; Cin <= '0'; wait for 20 ns;
        A <= '1'; B <= '1'; Cin <= '1'; wait for 20 ns;
        wait;
    end process;
end architecture;


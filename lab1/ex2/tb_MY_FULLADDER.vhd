library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MY_FULLADDER is
end TB_MY_FULLADDER;

architecture sim of TB_MY_FULLADDER is
    -- Component declaration for the full adder
    component MY_FULLADDER
        port (
            A, B, Cin : in std_logic;
            Sum, Cout : out std_logic
        );
    end component;

    -- Signals to connect to the full adder
    signal A, B, Cin : std_logic := '0';
    signal Sum, Cout : std_logic;
begin
    -- Instantiate the full adder
    UUT: MY_FULLADDER
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- 000
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- 001
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;

        -- 010
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;

        -- 011
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        -- 100
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- 101
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;

        -- 110
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;

        -- 111
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        wait;
    end process;
end sim;


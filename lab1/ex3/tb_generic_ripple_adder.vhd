library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_generic_ripple_adder is
end entity;

architecture behavior of tb_generic_ripple_adder is

    constant N : integer := 4;  -- Change this to 8, 16, etc.

    signal A, B : std_logic_vector(N-1 downto 0);
    signal Cin  : std_logic;
    signal Sum  : std_logic_vector(N-1 downto 0);
    signal Cout : std_logic;

    component GENERIC_RIPPLE_ADDER
        generic (
            N : integer := 4
        );
        port (
            A, B : in std_logic_vector(N-1 downto 0);
            Cin  : in std_logic;
            Sum  : out std_logic_vector(N-1 downto 0);
            Cout : out std_logic
        );
    end component;

begin
    UUT: GENERIC_RIPPLE_ADDER
        generic map (
            N => N
        )
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    stim_proc: process
    begin
        -- Test 1: 0001 + 0010 = 0011
        A <= "0001"; B <= "0010"; Cin <= '0';
        wait for 10 ns;

        -- Test 2: 0101 + 0101 = 1010
        A <= "0101"; B <= "0101"; Cin <= '0';
        wait for 10 ns;

        -- Test 3: 1111 + 0001 = 0000 (with carry)
        A <= "1111"; B <= "0001"; Cin <= '0';
        wait for 10 ns;

        -- Test 4: 1010 + 0101 + Cin = 1111
        A <= "1010"; B <= "0101"; Cin <= '1';
        wait for 10 ns;

        wait;
    end process;

end behavior;


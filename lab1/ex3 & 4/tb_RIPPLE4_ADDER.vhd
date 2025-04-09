library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ripple4_adder is
end entity;

architecture behavior of tb_ripple4_adder is
    signal A, B : std_logic_vector(3 downto 0);
    signal Cin  : std_logic;
    signal Sum  : std_logic_vector(3 downto 0);
    signal Cout : std_logic;

    component RIPPLE4_ADDER
        port (
            A, B : in std_logic_vector(3 downto 0);
            Cin  : in std_logic;
            Sum  : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );
    end component;

begin
    UUT: RIPPLE4_ADDER
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    stim_proc: process
    begin
        A <= "0001"; B <= "0010"; Cin <= '0'; wait for 10 ns;
        A <= "0101"; B <= "0101"; Cin <= '0'; wait for 10 ns;
        A <= "1111"; B <= "0001"; Cin <= '0'; wait for 10 ns;
        A <= "1010"; B <= "0101"; Cin <= '1'; wait for 10 ns;
        wait;
    end process;
end behavior;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_adder_subtractor is
end entity;

architecture behavior of tb_adder_subtractor is
    signal A, B   : std_logic_vector(3 downto 0);
    signal Mode   : std_logic;
    signal Result : std_logic_vector(3 downto 0);
    signal Cout   : std_logic;

    component Adder_Subtractor_4bit
        port (
            A, B     : in std_logic_vector(3 downto 0);
            Mode     : in std_logic;
            Result   : out std_logic_vector(3 downto 0);
            Cout     : out std_logic
        );
    end component;

begin
    UUT: Adder_Subtractor_4bit
        port map (
            A => A,
            B => B,
            Mode => Mode,
            Result => Result,
            Cout => Cout
        );

    stim_proc: process
    begin
        -- ADD: 0101 + 0011 = 1000
        A <= "0101"; B <= "0011"; Mode <= '0'; wait for 10 ns;

        -- SUB: 0101 - 0011 = 0010
        A <= "0101"; B <= "0011"; Mode <= '1'; wait for 10 ns;

        -- ADD: 1111 + 0001 = 0000 + carry
        A <= "1111"; B <= "0001"; Mode <= '0'; wait for 10 ns;

        -- SUB: 0001 - 0010 = 1111 (2?s complement)
        A <= "0001"; B <= "0010"; Mode <= '1'; wait for 10 ns;

        wait;
    end process;
end architecture;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_counter3bit is
end tb_counter3bit;

architecture test of tb_counter3bit is
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal q   : STD_LOGIC_VECTOR(2 downto 0);

    component counter3bit
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               q   : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

begin
    uut: counter3bit
        port map(clk => clk, rst => rst, q => q);

    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;

    stim_proc: process
    begin
        rst <= '1'; wait for 15 ns;
        rst <= '0'; wait for 185 ns;
        wait;
    end process;
end test;

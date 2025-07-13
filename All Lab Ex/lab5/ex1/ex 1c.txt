library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register8Bit is
    Port (
        clk     : in STD_LOGIC;
        rst     : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR(7 downto 0);
        data_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end Register8Bit;

architecture Structural of Register8Bit is
    -- Component declaration of the D flip-flop
    component D_FlipFlop
        Port (
            clk     : in STD_LOGIC;
            rst     : in STD_LOGIC;
            D       : in STD_LOGIC;
            Q       : out STD_LOGIC
        );
    end component;

    -- Generate 8 flip-flops for the 8-bit register
begin
    gen: for i in 0 to 7 generate
        flipflop: D_FlipFlop port map(
            clk => clk,
            rst => rst,
            D   => data_in(i),
            Q   => data_out(i)
        );
    end generate;
end Structural;
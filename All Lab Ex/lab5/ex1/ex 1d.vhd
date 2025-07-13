library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister8Bit is
    Port (
        clk     : in STD_LOGIC;
        rst     : in STD_LOGIC;
        serial_in : in STD_LOGIC;            -- Serial input for the leftmost bit
        data_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end ShiftRegister8Bit;

architecture Structural of ShiftRegister8Bit is
    -- Component declaration of the D flip-flop
    component D_FlipFlop
        Port (
            clk     : in STD_LOGIC;
            rst     : in STD_LOGIC;
            D       : in STD_LOGIC;
            Q       : out STD_LOGIC
        );
    end component;

    signal internal_data: STD_LOGIC_VECTOR(7 downto 0); -- Internal connections between flip-flops

begin
    -- Create the first flip-flop, which takes the external serial input
    flipflop0: D_FlipFlop port map(
        clk => clk,
        rst => rst,
        D   => serial_in,
        Q   => internal_data(7)
    );

    -- Create flip-flops 1 through 7, where each takes input from the previous flip-flop's output
    gen: for i in 1 to 7 generate
        flipflop: D_FlipFlop port map(
            clk => clk,
            rst => rst,
            D   => internal_data(8 - i),  -- Connect to the output of the previous flip-flop
            Q   => internal_data(7 - i)
        );
    end generate;

    -- Output assignment
    data_out <= internal_data;
end Structural;
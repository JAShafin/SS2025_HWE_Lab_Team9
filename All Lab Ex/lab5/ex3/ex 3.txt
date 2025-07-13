library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for the 3-bit asynchronous counter
entity AsyncCounter_3Bit is
    Port (
        CLK   : in  STD_LOGIC;   -- Asynchronous input clock
        RESET : in  STD_LOGIC;   -- Asynchronous reset
        Q     : out STD_LOGIC_VECTOR (2 downto 0)  -- 3-bit counter output
    );
end AsyncCounter_3Bit;

-- Architecture body
architecture Behavioral of AsyncCounter_3Bit is
    -- Internal signals for flip-flops
    signal Q0, Q1, Q2 : STD_LOGIC;
    signal nQ0, nQ1, nQ2 : STD_LOGIC;

    -- Instantiate three JK flip-flops
    component JK_FlipFlop
        Port (
            J   : in  STD_LOGIC;
            K   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            nQ  : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate first JK flip-flop
    FF0: JK_FlipFlop
        port map (
            J   => '1',
            K   => '1',
            CLK => CLK,
            Q   => Q0,
            nQ  => nQ0
        );

    -- Instantiate second JK flip-flop
    FF1: JK_FlipFlop
        port map (
            J   => '1',
            K   => '1',
            CLK => Q0, -- Clock input from the output of the first flip-flop
            Q   => Q1,
            nQ  => nQ1
        );

    -- Instantiate third JK flip-flop
    FF2: JK_FlipFlop
        port map (
            J   => '1',
            K   => '1',
            CLK => Q1, -- Clock input from the output of the second flip-flop
            Q   => Q2,
            nQ  => nQ2
        );

    -- Assign the counter output
    Q <= Q2 & Q1 & Q0;

    -- Handle asynchronous reset
    process (RESET)
    begin
        if RESET = '1' then
            Q0 <= '0';
            Q1 <= '0';
            Q2 <= '0';
        end if;
    end process;

end Behavioral;
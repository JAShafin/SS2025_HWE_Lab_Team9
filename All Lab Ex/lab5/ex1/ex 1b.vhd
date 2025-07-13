library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity (no ports)
entity D_FlipFlop_TB is
end D_FlipFlop_TB;

architecture test of D_FlipFlop_TB is
    -- Signal declarations
    signal tb_clk   : STD_LOGIC := '0';
    signal tb_rst   : STD_LOGIC := '0';
    signal tb_D     : STD_LOGIC := '0';
    signal tb_Q     : STD_LOGIC;

    -- Component under test
    component D_FlipFlop
        Port (
            clk     : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            D       : in  STD_LOGIC;
            Q       : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate the D Flip-Flop
    uut: D_FlipFlop port map (
        clk => tb_clk,
        rst => tb_rst,
        D   => tb_D,
        Q   => tb_Q
    );

    -- Clock process (generates a clock with a 10 ns period)
    clocking_process : process
    begin
        tb_clk <= '0';
        wait for 5 ns;  -- Half period
        tb_clk <= '1';
        wait for 5 ns;  -- Half period
    end process;

    -- Test process
    test_process: process
    begin
        -- Test 1: Reset the flip-flop
        tb_rst <= '1';
        wait for 10 ns;  -- Hold reset for a while
        tb_rst <= '0';

        -- Test 2: Set D to '1' and capture on rising edge
        tb_D <= '1';
        wait for 10 ns;

        -- Test 3: Change D to '0' before next clock edge
        tb_D <= '0';
        wait for 10 ns;

        -- Test 4: Check if D remains at previous captured value
        wait for 10 ns;

        -- Test 5: Set and reset during the same clock cycle
        tb_D <= '1';
        tb_rst <= '1';
        wait for 5 ns;  -- Apply reset during high clock
        tb_rst <= '0';
        wait for 5 ns;  -- Remove reset before next rising edge
        wait for 10 ns;

        -- Test 6: Ensure D holds the previous state (reset clears it)
        wait for 10 ns;

        -- Complete the simulation
        wait;
    end process;
end test;
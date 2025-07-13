library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for the 3-bit asynchronous counter
entity tb_AsyncCounter_3Bit is
end tb_AsyncCounter_3Bit;

architecture Behavioral of tb_AsyncCounter_3Bit is
    -- Component declaration for the unit under test (UUT)
    component AsyncCounter_3Bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signals for the testbench
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal Q     : STD_LOGIC_VECTOR (2 downto 0);

    -- Clock period constant
    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the unit under test (UUT)
    UUT: AsyncCounter_3Bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            Q     => Q
        );

    -- Clock generation process
    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stimulus_process : process
    begin
        -- Apply reset
        RESET <= '1';
        wait for 20 ns;
        RESET <= '0';

        -- Wait and observe counter operation
        wait for 100 ns;

        -- Apply reset again
        RESET <= '1';
        wait for 20 ns;
        RESET <= '0';

        -- Wait and observe counter operation
        wait for 100 ns;

        -- Finish simulation
        wait;
    end process;

end Behavioral;
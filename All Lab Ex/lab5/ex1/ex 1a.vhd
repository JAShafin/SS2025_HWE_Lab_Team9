library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop is
    Port (
        clk     : in  STD_LOGIC;   -- Clock input
        rst     : in  STD_LOGIC;   -- Asynchronous reset input
        D       : in  STD_LOGIC;   -- Data input
        Q       : out STD_LOGIC    -- Output
    );
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is
begin
    -- Process block for D flip-flop with asynchronous reset
    process (clk, rst)
    begin
        if rst = '1' then
            Q <= '0'; -- Asynchronously reset the output to 0
        elsif rising_edge(clk) then
            Q <= D;  -- Capture the value of D at the rising edge of the clock
        end if;
    end process;

end Behavioral;
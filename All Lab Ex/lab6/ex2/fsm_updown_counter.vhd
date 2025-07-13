-- fsm_updown_counter.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_updown_counter is
    Port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        up    : in  std_logic;
        down  : in  std_logic;
        q     : out std_logic_vector (2 downto 0)
    );
end entity;

architecture Behavioral of fsm_updown_counter is
    type state_type is range 0 to 7;
    signal state, next_state : state_type := 0;
begin
    -- State register
    process(clk, rst)
    begin
        if rst = '1' then
            state <= 0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    -- Next state logic
    process(state, up, down)
    begin
        if up = '1' and down = '0' then
            if state = 7 then
                next_state <= 0;
            else
                next_state <= state + 1;
            end if;
        elsif up = '0' and down = '1' then
            if state = 0 then
                next_state <= 7;
            else
                next_state <= state - 1;
            end if;
        else
            next_state <= state;
        end if;
    end process;

    -- Output logic
    q <= std_logic_vector(to_unsigned(state, 3));
end architecture;

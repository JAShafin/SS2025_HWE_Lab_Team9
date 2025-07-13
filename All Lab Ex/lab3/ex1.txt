library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_switch is
    Port ( sw : in STD_LOGIC;
           led : out STD_LOGIC);
end led_switch;

architecture Behavioral of led_switch is
begin
    led <= sw;
end Behavioral;

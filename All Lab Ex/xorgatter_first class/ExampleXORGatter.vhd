library ieee;
use ieee.std_logic_1164.all;

entity ExampleXORGATTER is
    port (
        X, Y : in std_logic;
        Z    : out std_logic
    );
end entity;

architecture Data of ExampleXORGATTER is
begin
    Z <= X xor Y;
end architecture;


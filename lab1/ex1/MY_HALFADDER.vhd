library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MY_HALFADDER is
    port (
        A, B : in std_logic;
        S, C : out std_logic
    );
end entity;

architecture behavior of MY_HALFADDER is
begin
    S <= A xor B;
    C <= A and B;
end architecture;

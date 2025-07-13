library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder_Subtractor_4bit is
    port (
        A, B     : in std_logic_vector(3 downto 0);
        Mode     : in std_logic;  -- 0 = Add, 1 = Subtract
        Result   : out std_logic_vector(3 downto 0);
        Cout     : out std_logic
    );
end entity;

architecture Structure of Adder_Subtractor_4bit is
    signal B_mod : std_logic_vector(3 downto 0);
    signal Cin   : std_logic;

    component RIPPLE4_ADDER
        port (
            A, B    : in std_logic_vector(3 downto 0);
            Cin     : in std_logic;
            Sum     : out std_logic_vector(3 downto 0);
            Cout    : out std_logic
        );
    end component;

begin
    -- Invert B when Mode = 1 (subtraction)
    B_mod <= B xor (Mode & Mode & Mode & Mode);
    Cin   <= Mode;

    UUT: RIPPLE4_ADDER
        port map (
            A => A,
            B => B_mod,
            Cin => Cin,
            Sum => Result,
            Cout => Cout
        );
end architecture;


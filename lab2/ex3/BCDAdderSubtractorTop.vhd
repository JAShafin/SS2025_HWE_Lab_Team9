library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCDAdderSubtractorTop is
    Port (
        A, B     : in  STD_LOGIC_VECTOR(3 downto 0);
        Mode     : in  STD_LOGIC; -- 0: Add, 1: Subtract
        seg_tens  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_units : out STD_LOGIC_VECTOR(6 downto 0)
    );
end BCDAdderSubtractorTop;

architecture Structural of BCDAdderSubtractorTop is

    signal Result : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout   : STD_LOGIC;
    signal Full_Sum : STD_LOGIC_VECTOR(4 downto 0); -- 5-bit result

    signal BCD_tens  : STD_LOGIC_VECTOR(3 downto 0);
    signal BCD_units : STD_LOGIC_VECTOR(3 downto 0);

    component Adder_Subtractor_4bit
        port (
            A, B     : in std_logic_vector(3 downto 0);
            Mode     : in std_logic;
            Result   : out std_logic_vector(3 downto 0);
            Cout     : out std_logic
        );
    end component;

    component BinaryToBCD_Convertor
        Port (
            binary_in : in  STD_LOGIC_VECTOR(4 downto 0);
            BCD_tens  : out STD_LOGIC_VECTOR(3 downto 0);
            BCD_units : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component BCDto7Segment
        Port (
            BCD_in : in  STD_LOGIC_VECTOR(3 downto 0);
            seg    : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

begin

    U1: Adder_Subtractor_4bit port map (
        A => A, B => B, Mode => Mode,
        Result => Result,
        Cout => Cout
    );

    Full_Sum <= Cout & Result;

    U2: BinaryToBCD_Convertor port map (
        binary_in => Full_Sum,
        BCD_tens => BCD_tens,
        BCD_units => BCD_units
    );

    U3: BCDto7Segment port map (
        BCD_in => BCD_units,
        seg => seg_units
    );

    U4: BCDto7Segment port map (
        BCD_in => BCD_tens,
        seg => seg_tens
    );

end Structural;


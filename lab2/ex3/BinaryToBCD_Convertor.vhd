library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BinaryToBCD_Convertor is
    Port (
        binary_in : in  STD_LOGIC_VECTOR(4 downto 0); -- 5-bit input
        BCD_tens  : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_units : out STD_LOGIC_VECTOR(3 downto 0)
    );
end BinaryToBCD_Convertor;

architecture Behavioral of BinaryToBCD_Convertor is
begin
    process(binary_in)
        variable binary_val : integer;
    begin
        binary_val := to_integer(unsigned(binary_in));
        BCD_tens  <= std_logic_vector(to_unsigned(binary_val / 10, 4));
        BCD_units <= std_logic_vector(to_unsigned(binary_val mod 10, 4));
    end process;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_BinaryToBCD_Convertor is
end tb_BinaryToBCD_Convertor;

architecture behavior of tb_BinaryToBCD_Convertor is

    signal binary_in : STD_LOGIC_VECTOR(3 downto 0);
    signal BCD_tens  : STD_LOGIC_VECTOR(3 downto 0);
    signal BCD_units : STD_LOGIC_VECTOR(3 downto 0);

    component BinaryToBCD_Convertor
        Port (
            binary_in : in  STD_LOGIC_VECTOR(3 downto 0);
            BCD_tens  : out STD_LOGIC_VECTOR(3 downto 0);
            BCD_units : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

begin

    -- Connect DUT
    uut: BinaryToBCD_Convertor port map (
        binary_in => binary_in,
        BCD_tens  => BCD_tens,
        BCD_units => BCD_units
    );

    -- Stimulus process
    stim_proc: process
    begin
        for i in 0 to 15 loop
            binary_in <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        wait;
    end process;

end behavior;


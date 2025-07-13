-- seven_segment_decoder.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_decoder is
    Port (
        num  : in  std_logic_vector (2 downto 0);
        seg  : out std_logic_vector (6 downto 0) -- a,b,c,d,e,f,g
    );
end entity;

architecture Behavioral of seven_segment_decoder is
begin
    process(num)
    begin
        case num is
            when "000" => seg <= "1000000"; -- 0
            when "001" => seg <= "1111001"; -- 1
            when "010" => seg <= "0100100"; -- 2
            when "011" => seg <= "0110000"; -- 3
            when "100" => seg <= "0011001"; -- 4
            when "101" => seg <= "0010010"; -- 5
            when "110" => seg <= "0000010"; -- 6
            when "111" => seg <= "1111000"; -- 7
            when others => seg <= "1111111"; -- blank
        end case;
    end process;
end architecture;

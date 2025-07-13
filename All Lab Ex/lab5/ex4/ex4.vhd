library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter3bit is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           q   : out STD_LOGIC_VECTOR (2 downto 0));
end counter3bit;

architecture Behavioral of counter3bit is
    signal count : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= "000";
        elsif rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;
    q <= count;
end Behavioral;

-- clock_divider.vhd
entity clock_divider is
    generic (N : integer := 10); -- Divide by N (change as needed)
    port (
        clk    : in bit;
        reset  : in bit;
        clk_N  : out bit
    );
end entity;

architecture behavior of clock_divider is
    signal count : integer := 0;
    signal clk_int : bit := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            clk_int <= '0';
        elsif rising_edge(clk) then
            if count = (N/2 - 1) then
                clk_int <= not clk_int;
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    clk_N <= clk_int;
end architecture;

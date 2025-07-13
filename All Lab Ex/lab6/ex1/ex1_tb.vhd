-- tb_clock_divider.vhd
entity tb_clock_divider is
end entity;

architecture test of tb_clock_divider is
    signal clk    : bit := '0';
    signal reset  : bit := '1';
    signal clk_N  : bit;
begin
    -- Instantiate the clock divider
    uut: entity work.clock_divider
        generic map (N => 4) -- divide by 4 for easy simulation
        port map (
            clk    => clk,
            reset  => reset,
            clk_N  => clk_N
        );

    -- Generate clock
    clk_process: process
    begin
        while now < 200 ns loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus
    process
    begin
        reset <= '1'; wait for 12 ns;
        reset <= '0';
        wait;
    end process;
end architecture;

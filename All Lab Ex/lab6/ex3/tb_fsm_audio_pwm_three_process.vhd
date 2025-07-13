library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_fsm_audio_pwm_three_process is
end entity;

architecture test of tb_fsm_audio_pwm_three_process is
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '1';
    signal sw       : std_logic_vector(15 downto 0) := (others => '0');
    signal aud_pwm  : std_logic;
    signal aud_sd   : std_logic;
begin
    uut: entity work.fsm_audio_pwm_three_process
        port map (
            clk      => clk,
            reset    => reset,
            sw       => sw,
            aud_pwm  => aud_pwm,
            aud_sd   => aud_sd
        );

    -- 100 MHz clock generator (10 ns period)
    clk_process: process
    begin
        while now < 200 us loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        reset <= '1'; wait for 100 ns;
        reset <= '0'; wait for 50 ns;
        sw(0) <= '1'; wait for 30 us;  -- Play first tone
        sw(0) <= '0'; sw(5) <= '1'; wait for 30 us; -- Play another tone
        sw := (others => '0'); wait for 30 us; -- Mute
        reset <= '1'; wait for 20 ns; -- Reset again
        reset <= '0';
        wait;
    end process;
end architecture;

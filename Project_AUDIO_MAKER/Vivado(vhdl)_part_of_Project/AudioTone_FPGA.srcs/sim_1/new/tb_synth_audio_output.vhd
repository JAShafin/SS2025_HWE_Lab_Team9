library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_synth_audio_output is
end tb_synth_audio_output;

architecture behavior of tb_synth_audio_output is

    component synth_audio_output
        Port (
            CLK100MHZ : in STD_LOGIC;
            RESET     : in STD_LOGIC;
            SW        : in STD_LOGIC_VECTOR (15 downto 0);
            AUD_PWM   : out STD_LOGIC;
            AUD_SD    : out STD_LOGIC
        );
    end component;

    signal CLK100MHZ : STD_LOGIC := '0';
    signal RESET     : STD_LOGIC := '1';
    signal SW        : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal AUD_PWM   : STD_LOGIC;
    signal AUD_SD    : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin

    uut: synth_audio_output
        port map (
            CLK100MHZ => CLK100MHZ,
            RESET     => RESET,
            SW        => SW,
            AUD_PWM   => AUD_PWM,
            AUD_SD    => AUD_SD
        );

    clk_process : process
    begin
        while true loop
            CLK100MHZ <= '0';
            wait for CLK_PERIOD/2;
            CLK100MHZ <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    stim_proc: process
    begin
        wait for 100 ns;
        RESET <= '0';

        SW(0) <= '1';
        wait for 2 ms;

        SW(0) <= '0';
        SW(5) <= '1';
        wait for 2 ms;

        SW(5) <= '0';
        wait for 2 ms;

        wait;
    end process;

end behavior;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity synth_audio_output is
    Port (
        CLK100MHZ : in STD_LOGIC;
        RESET     : in STD_LOGIC;
        SW        : in STD_LOGIC_VECTOR (15 downto 0);
        AUD_PWM   : out STD_LOGIC;
        AUD_SD    : out STD_LOGIC
    );
end synth_audio_output;

architecture Behavioral of synth_audio_output is
    signal pwm_counter : unsigned(31 downto 0) := (others => '0');
    signal pwm_limit   : unsigned(31 downto 0);
    signal pwm_out     : STD_LOGIC := '0';
begin

    process(CLK100MHZ)
    begin
        if rising_edge(CLK100MHZ) then
            if RESET = '1' then
                pwm_counter <= (others => '0');
                pwm_out <= '0';
                pwm_limit <= to_unsigned(0, 32); -- Optional: mute after reset
            else
                -- Frequency selection based on switches
                if SW(0) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 400 / 2, 32);
                elsif SW(1) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 500 / 2, 32);
                elsif SW(2) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 600 / 2, 32);
                elsif SW(3) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 700 / 2, 32);
                elsif SW(4) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 800 / 2, 32);
                elsif SW(5) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 900 / 2, 32);
                elsif SW(6) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1000 / 2, 32);
                elsif SW(7) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1100 / 2, 32);
                elsif SW(8) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1200 / 2, 32);
                elsif SW(9) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1300 / 2, 32);
                elsif SW(10) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1400 / 2, 32);
                elsif SW(11) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1500 / 2, 32);
                elsif SW(12) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1600 / 2, 32);
                elsif SW(13) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1700 / 2, 32);
                elsif SW(14) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1800 / 2, 32);
                elsif SW(15) = '1' then
                    pwm_limit <= to_unsigned(100_000_000 / 1900 / 2, 32);
                else
                    pwm_limit <= to_unsigned(0, 32); -- No tone
                end if;

                -- PWM generation
                if pwm_limit = 0 then
                    pwm_out <= '0'; -- Mute output
                else
                    if pwm_counter < pwm_limit then
                        pwm_counter <= pwm_counter + 1;
                        if pwm_counter < (pwm_limit / 200) then
                            pwm_out <= '1';
                        else
                            pwm_out <= '0';
                        end if;
                    else
                        pwm_counter <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    AUD_PWM <= pwm_out;
    AUD_SD  <= '1'; -- Always on
end Behavioral;

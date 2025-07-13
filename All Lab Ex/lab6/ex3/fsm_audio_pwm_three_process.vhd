library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm_audio_pwm_three_process is
    Port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        sw       : in  std_logic_vector(15 downto 0);
        aud_pwm : out std_logic;
        aud_sd  : out std_logic
    );
end entity;

architecture Behavioral of fsm_audio_pwm_three_process is
    -- Define state type
    type state_type is (MUTE, TONE_SELECT, PLAYING);
    signal state, next_state : state_type := MUTE;
    signal tone_idx, next_tone_idx : integer range 0 to 15 := 0;

    -- PWM parameters
    type freq_array is array (0 to 15) of integer;
    constant freq_limits : freq_array := (
        124999, 111111, 99999, 90909, 83333, 76923, 71429, 66667,
        62500, 58824, 55556, 52632, 50000, 47619, 45455, 43478
    );
    signal pwm_limit : integer := 124999;
    signal counter   : integer := 0;
    signal pwm_out   : std_logic := '0';
begin
    -- PROCESS 1: State register (sequential)
    process(clk, reset)
    begin
        if reset = '1' then
            state <= MUTE;
            tone_idx <= 0;
        elsif rising_edge(clk) then
            state <= next_state;
            tone_idx <= next_tone_idx;
        end if;
    end process;

    -- PROCESS 2: Next state logic (combinational)
    process(state, sw)
    variable found : boolean := false;
    variable idx : integer := 0;
    begin
        -- Find first active switch (lowest index)
        found := false;
        idx := 0;
        for i in 0 to 15 loop
            if sw(i) = '1' then
                found := true;
                idx := i;
                exit;
            end if;
        end loop;

        case state is
            when MUTE =>
                if found then
                    next_state <= TONE_SELECT;
                    next_tone_idx <= idx;
                else
                    next_state <= MUTE;
                    next_tone_idx <= 0;
                end if;
            when TONE_SELECT =>
                if found then
                    next_state <= PLAYING;
                    next_tone_idx <= idx;
                else
                    next_state <= MUTE;
                    next_tone_idx <= 0;
                end if;
            when PLAYING =>
                if not found then
                    next_state <= MUTE;
                    next_tone_idx <= 0;
                else
                    next_state <= PLAYING;
                    next_tone_idx <= idx;
                end if;
        end case;
    end process;

    -- PROCESS 3: Output and PWM logic (combinational + sequential)
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            pwm_out <= '0';
        elsif rising_edge(clk) then
            if state = PLAYING then
                pwm_limit <= freq_limits(tone_idx);
                if counter < pwm_limit then
                    counter <= counter + 1;
                else
                    counter <= 0;
                    pwm_out <= not pwm_out;
                end if;
            else
                counter <= 0;
                pwm_out <= '0';
            end if;
        end if;
    end process;

    -- Drive outputs
    aud_pwm <= pwm_out;
    aud_sd  <= '1' when state = PLAYING else '0';
end architecture;

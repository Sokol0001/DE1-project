-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Tue, 22 Apr 2025 17:41:02 GMT
-- Request id : cfwk-fed377c2-6807d4ae1299d

library ieee;
use ieee.std_logic_1164.all;

entity tb_power_play is
end tb_power_play;

architecture tb of tb_power_play is

    component power_play
        port (clk   : in std_logic;
              SW0   : in std_logic;
              SW1   : in std_logic;
              BTNU  : in std_logic;
              BTND  : in std_logic;
              SW8   : in std_logic;
              SW5   : in std_logic;
              SW15  : in std_logic;
              SW13  : in std_logic;
              LED10 : out std_logic;
              LED11 : out std_logic;
              LED12 : out std_logic;
              LED13 : out std_logic;
              LED14 : out std_logic;
              LED1  : out std_logic;
              LED2  : out std_logic;
              LED3  : out std_logic;
              LED4  : out std_logic;
              LED5  : out std_logic);
    end component;

    signal clk   : std_logic;
    signal SW0   : std_logic;
    signal SW1   : std_logic;
    signal BTNU  : std_logic;
    signal BTND  : std_logic;
    signal SW8   : std_logic;
    signal SW5   : std_logic;
    signal SW15  : std_logic;
    signal SW13  : std_logic;
    signal LED10 : std_logic;
    signal LED11 : std_logic;
    signal LED12 : std_logic;
    signal LED13 : std_logic;
    signal LED14 : std_logic;
    signal LED1  : std_logic;
    signal LED2  : std_logic;
    signal LED3  : std_logic;
    signal LED4  : std_logic;
    signal LED5  : std_logic;

    constant TbPeriod : time := 1 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : power_play
    port map (clk   => clk,
              SW0   => SW0,
              SW1   => SW1,
              BTNU  => BTNU,
              BTND  => BTND,
              SW8   => SW8,
              SW5   => SW5,
              SW15  => SW15,
              SW13  => SW13,
              LED10 => LED10,
              LED11 => LED11,
              LED12 => LED12,
              LED13 => LED13,
              LED14 => LED14,
              LED1  => LED1,
              LED2  => LED2,
              LED3  => LED3,
              LED4  => LED4,
              LED5  => LED5);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        SW0 <= '0';
        SW1 <= '0';
        BTNU <= '0';
        BTND <= '0';
        SW8 <= '0';
        SW5 <= '0';
        SW15 <= '0';
        SW13 <= '0';

        -- Reset generation
        --  ***EDIT*** Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        SW13 <= '1';
        wait for 10 ns;
        SW13 <= '0';
        
        wait for 10 ns;
        SW15 <= '1';
        --BTNU <= '1';
        BTND <= '1';
        SW0 <= '1';
        
        wait for 30 ns;
        SW15 <= '0';
        --BTNU <= '0';
        BTND <= '0';
        SW0 <= '0';
        
        wait for 20ns;
        SW15 <= '1';
        SW5 <= '1';
        
        
        
        
        
        -- ***EDIT*** Add stimuli here
        wait for 10000000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_power_play of tb_power_play is
    for tb
    end for;
end cfg_tb_power_play;
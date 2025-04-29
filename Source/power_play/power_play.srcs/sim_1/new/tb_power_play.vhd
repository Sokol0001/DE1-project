-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Tue, 22 Apr 2025 17:11:27 GMT
-- Request id : cfwk-fed377c2-6807cdbfcbd65

library ieee;
use ieee.std_logic_1164.all;

entity tb_top_level is
end tb_top_level;

architecture tb of tb_top_level is

    component top_level
        port (CLK100MHZ : in std_logic;
              SW4       : in std_logic;
              BTNC      : in std_logic;
              BTNL      : in std_logic;
              BTNR      : in std_logic;
              SW14      : in std_logic;
              SW15      : in std_logic;
              CA        : out std_logic;
              CB        : out std_logic;
              CC        : out std_logic;
              CD        : out std_logic;
              CE        : out std_logic;
              CF        : out std_logic;
              CG        : out std_logic;
              AN        : out std_logic_vector (7 downto 0);
              LED16_B   : out std_logic;
              LED16_G   : out std_logic;
              LED16_R   : out std_logic;
              LED17_G   : out std_logic;
              LED17_B   : out std_logic;
              LED17_R   : out std_logic;
              SW0       : in std_logic;
              SW1       : in std_logic;
              BTNU      : in std_logic;
              BTND      : in std_logic;
              SW8       : in std_logic;
              SW5       : in std_logic;
              SW13      : in std_logic;
              LED10     : out std_logic;
              LED11     : out std_logic;
              LED12     : out std_logic;
              LED13     : out std_logic;
              LED14     : out std_logic;
              LED1      : out std_logic;
              LED2      : out std_logic;
              LED3      : out std_logic;
              LED4      : out std_logic;
              LED5      : out std_logic);
    end component;

    signal CLK100MHZ : std_logic;
    signal SW4       : std_logic;
    signal BTNC      : std_logic;
    signal BTNL      : std_logic;
    signal BTNR      : std_logic;
    signal SW14      : std_logic;
    signal SW15      : std_logic;
    signal CA        : std_logic;
    signal CB        : std_logic;
    signal CC        : std_logic;
    signal CD        : std_logic;
    signal CE        : std_logic;
    signal CF        : std_logic;
    signal CG        : std_logic;
    signal AN        : std_logic_vector (7 downto 0);
    signal LED16_B   : std_logic;
    signal LED16_G   : std_logic;
    signal LED16_R   : std_logic;
    signal LED17_G   : std_logic;
    signal LED17_B   : std_logic;
    signal LED17_R   : std_logic;
    signal SW0       : std_logic;
    signal SW1       : std_logic;
    signal BTNU      : std_logic;
    signal BTND      : std_logic;
    signal SW8       : std_logic;
    signal SW5       : std_logic;
    signal SW13      : std_logic;
    signal LED10     : std_logic;
    signal LED11     : std_logic;
    signal LED12     : std_logic;
    signal LED13     : std_logic;
    signal LED14     : std_logic;
    signal LED1      : std_logic;
    signal LED2      : std_logic;
    signal LED3      : std_logic;
    signal LED4      : std_logic;
    signal LED5      : std_logic;

    constant TbPeriod : time := 1000 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top_level
    port map (CLK100MHZ => CLK100MHZ,
              SW4       => SW4,
              BTNC      => BTNC,
              BTNL      => BTNL,
              BTNR      => BTNR,
              SW14      => SW14,
              SW15      => SW15,
              CA        => CA,
              CB        => CB,
              CC        => CC,
              CD        => CD,
              CE        => CE,
              CF        => CF,
              CG        => CG,
              AN        => AN,
              LED16_B   => LED16_B,
              LED16_G   => LED16_G,
              LED16_R   => LED16_R,
              LED17_G   => LED17_G,
              LED17_B   => LED17_B,
              LED17_R   => LED17_R,
              SW0       => SW0,
              SW1       => SW1,
              BTNU      => BTNU,
              BTND      => BTND,
              SW8       => SW8,
              SW5       => SW5,
              SW13      => SW13,
              LED10     => LED10,
              LED11     => LED11,
              LED12     => LED12,
              LED13     => LED13,
              LED14     => LED14,
              LED1      => LED1,
              LED2      => LED2,
              LED3      => LED3,
              LED4      => LED4,
              LED5      => LED5);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that CLK100MHZ is really your main clock signal
    CLK100MHZ <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        SW4 <= '0';
        BTNC <= '0';
        BTNL <= '0';
        BTNR <= '0';
        SW14 <= '0';
        SW15 <= '0';
        SW0 <= '0';
        SW1 <= '0';
        BTNU <= '0';
        BTND <= '0';
        SW8 <= '0';
        SW5 <= '0';
        SW13 <= '0';

        -- Reset generation
        --  ***EDIT*** Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        wait for 10ns;
        SW0 <= '1';
        BTNU <= '1';
        BTND <= '1';
        
        wait for 50ns;
        SW0 <= '0';
        BTNU <= '0';
        BTND <= '0';
        
        wait for 10ns;
        SW0 <= '1';
        BTNU <= '1';
        BTND <= '1';

        -- ***EDIT*** Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_level of tb_top_level is
    for tb
    end for;
end cfg_tb_top_level;

        

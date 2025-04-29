-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Fri, 18 Apr 2025 22:52:12 GMT
-- Request id : cfwk-fed377c2-6802d79c25af4

library ieee;
use ieee.std_logic_1164.all;

entity tb_power_play is
end tb_power_play;

architecture tb of tb_power_play is

    component power_play
        port (clk       : in std_logic;
              sec_pulse : in std_logic;
              SW0       : in std_logic;
              BTNU      : in std_logic;
              SW8       : in std_logic;
              LED10     : out std_logic;
              LED11     : out std_logic);
    end component;

    signal clk       : std_logic;
    signal sec_pulse : std_logic;
    signal SW0       : std_logic;
    signal BTNU      : std_logic;
    signal SW8       : std_logic;
    signal LED10     : std_logic;
    signal LED11     : std_logic;

    constant TbPeriod : time := 1000 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : power_play
    port map (clk       => clk,
              sec_pulse => sec_pulse,
              SW0       => SW0,
              BTNU      => BTNU,
              SW8       => SW8,
              LED10     => LED10,
              LED11     => LED11);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        sec_pulse <= '0';
        SW0 <= '0';
        BTNU <= '0';
        SW8 <= '0';

       wait for 10ns;
        SW0 <= '1';
        BTNU <= '1';
        
        wait for 30ns;
        SW0 <= '0';
        BTNU <= '0';
        
        wait for 30ns;
        SW0 <= '1';
        BTNU <= '1';
        
        wait for 30ns;
        SW0 <= '0';
        BTNU <= '0';
       
        wait for 30ns;
        
        -- ***EDIT*** Add stimuli here
        wait for 1000000 * TbPeriod;

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
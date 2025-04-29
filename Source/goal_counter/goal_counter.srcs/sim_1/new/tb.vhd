library ieee;
use ieee.std_logic_1164.all;

entity tb_goal_counter is
end tb_goal_counter;

architecture tb of tb_goal_counter is

    component goal_counter
        port (
            clk    : in std_logic;
            SW14   : in std_logic;
            rst    : in std_logic;
            BTNL   : in std_logic;
            BTNR   : in std_logic;
            unit1 : out std_logic_vector (3 downto 0);
            ten1 : out std_logic_vector (3 downto 0);
            unit2 : out std_logic_vector (3 downto 0);
            ten2 : out std_logic_vector (3 downto 0)
        );
    end component;

    signal clk    : std_logic := '0';
    signal SW14   : std_logic := '0';
    signal rst    : std_logic := '0';
    signal BTNL   : std_logic := '0';
    signal BTNR   : std_logic := '0';
    signal unit1 : std_logic_vector (3 downto 0);
    signal ten1 : std_logic_vector (3 downto 0);
    signal unit2 : std_logic_vector (3 downto 0);
    signal ten2 : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 1 ns;
    signal TbSimEnded : std_logic := '0';

begin

    dut : goal_counter
    port map (
        clk    => clk,
        SW14   => SW14,
        rst    => rst,
        BTNL   => BTNL,
        BTNR   => BTNR,
        unit1 => unit1,
        ten1 => ten1,
        ten2 => ten2,
        unit2 => unit2
    );

    -- 100% funkčný clock generator pomocou 'after'
    clk <= not clk after TbPeriod / 2 when TbSimEnded = '0' else '0';

    -- Stimuli process
    stimuli : process
    begin
        -- Reset
        rst <= '1';
        SW14 <= '0';
        wait for  10ns;

        rst <= '0';
        wait for 10ns;

 
        -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
        wait for 10ns;
        SW14 <= '1';
        
        -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNR <= '1';
        wait for 10ns;
        BTNR <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
         -- BTNR (B+1)
        BTNL <= '1';
        wait for 10ns;
        BTNL <= '0';
        wait for 10ns;
        
        
        
        
        
        
        wait for 1 ms; -- nechaj ešte nejaký čas simulácie
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Konfigurácia pre simulátory (napr. Vivado)
configuration cfg_tb_goal_counter of tb_goal_counter is
    for tb
    end for;
end cfg_tb_goal_counter;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity power_play is
    Port ( BTNU : in STD_LOGIC; -- presilovka tim 1
           clk  : in STD_LOGIC;
           BTND : in STD_LOGIC; -- presilovka tim 2
           SW8 : in STD_LOGIC; -- zrusenie poslednej presilovky(okrem 5 min) (padol gol) tim 1
           SW5 : in STD_LOGIC; -- zrusenie poslednej presilovky (okrem 5 min) (padol gol) tim 2
           SW1 : in STD_LOGIC; -- 5 minutova presilovka
           SW0 : in STD_LOGIC; -- 2 minutova presilovka
           SW13 : in STD_LOGIC; -- uplny reset
           SW15 : in STD_LOGIC; -- stopnutie
           sec_pulse : in std_logic; -- sekundove pulzy
           LED1 : out STD_LOGIC; -- tim 2 honota sa meni
           LED2 : out STD_LOGIC;-- tim 2  honota sa meni
           LED3 : out STD_LOGIC; -- tim 2 honota sa NEmeni
           LED4 : out STD_LOGIC;-- tim 2  honota sa NEmeni
           LED5 : out STD_LOGIC; -- tim 2  honota sa NEmeni
           LED14 : out STD_LOGIC;-- tim 1  honota sa NEmeni
           LED13 : out STD_LOGIC;-- tim 1  honota sa NEmeni
           LED12 : out STD_LOGIC;-- tim 1  honota sa NEmeni
           LED11 : out STD_LOGIC;-- tim 1  honota sa meni
           LED10 : out STD_LOGIC);-- tim 1  honota sa meni
end power_play;

architecture Behavioral of power_play is
signal PP_5min_1 : integer range 0 to 25 := 0;
signal PP_5min_2 : integer range 0 to 25 := 0;
signal PP_2min_1 : integer range 0 to 25 := 0;
signal PP_2min_2 : integer range 0 to 25 := 0;

signal btnu_prev : std_logic := '0';
signal btnd_prev : std_logic := '0';
signal btnu_edge : std_logic := '0';
signal btnd_edge : std_logic := '0';

signal SW8_prev : std_logic := '0';
signal SW5_prev : std_logic := '0';
signal SW8_edge : std_logic := '0';
signal SW5_edge : std_logic := '0';

signal SW0_prev : std_logic := '0';
signal SW1_prev : std_logic := '0';
signal SW0_edge : std_logic := '0';
signal SW1_edge : std_logic := '0';

signal timer_2min_1 : integer range 0 to 120 := 0;
signal timer_2min_2 : integer range 0 to 120 := 0;
signal timer_5min_1 : integer range 0 to 300 := 0;
signal timer_5min_2 : integer range 0 to 300 := 0;

signal LED10_i : std_logic := '1'; -- default
signal LED11_i : std_logic := '1'; -- default
signal LED2_i : std_logic := '1'; -- default
signal LED1_i : std_logic := '1'; -- default

signal stored_time_2min_1 : integer range 0 to 120 := 0;
signal stored_time_2min_2 : integer range 0 to 120 := 0;
signal stored_time_5min_1 : integer range 0 to 120 := 0;
signal stored_time_5min_2 : integer range 0 to 120 := 0;

begin

LED14 <= '1';
LED13 <= '1';
LED12 <= '1';

LED5 <= '1';
LED4 <= '1';
LED3 <= '1';




process(clk)
begin
    
  if rising_edge(clk) then
    SW8_edge <= SW8 and not SW8_prev;
    SW5_edge <= SW5 and not SW5_prev;

    SW8_prev <= SW8;
    SW5_prev <= SW5;
    
    SW1_edge <= SW1 and not SW1_prev;
    SW0_edge <= SW0 and not SW0_prev;

    SW1_prev <= SW1;
    SW0_prev <= SW0;
    
    btnu_edge <= BTNU and not btnu_prev;
    btnd_edge <= BTND and not btnd_prev;

    btnu_prev <= BTNU;
    btnd_prev <= BTND;
    
  end if;
end process;

process(clk)is

begin
if rising_edge(clk) then
    
    if SW13 = '1' then
        PP_2min_1 <= 0;
        PP_2min_2 <= 0;
        PP_5min_1 <= 0;
        PP_5min_2 <= 0;
        
  
    else
        if SW0_edge = '1' or SW0 = '1' then -- 2 minuty
            if btnu_edge = '1' and btnd_edge = '1' then
                
                if PP_2min_1 < 25 then
                    PP_2min_1 <= PP_2min_1 + 1;
                end if;
                
                if PP_2min_2 < 25 then
                    PP_2min_2 <= PP_2min_2 + 1;    
                end if;     
            elsif btnu_edge = '1' then -- tim 1
                
                if PP_2min_1 < 25 then
                    PP_2min_1 <= PP_2min_1 + 1;
                end if;   
            
            elsif btnd_edge = '1' then -- tim 2
                
                if PP_2min_2 < 25 then    
                    PP_2min_2 <= PP_2min_2 + 1;
                end if; 
            end if;
        
        elsif SW1_edge = '1' or SW1 = '1' then -- 5 minut           
            if btnu_edge = '1' and btnd_edge = '1' then
                
                if PP_5min_1 < 25 then
                    PP_5min_1 <= PP_5min_1 + 1;
                end if;
                
                if PP_5min_2 < 25 then
                    PP_5min_2 <= PP_5min_2 + 1;    
                end if;
                     
            elsif btnu_edge = '1' then -- tim 1
                
                if PP_5min_1 < 25 then
                    PP_5min_1 <= PP_5min_1 + 1;
                end if; 
            
            elsif btnd_edge = '1' then -- tim 2
                
                if PP_5min_2 < 25 then -- ochrana proti preteceniu
                    PP_5min_2 <= PP_5min_2 + 1; 
                end if;  
            
            end if;
        end if;
            
        if SW8_edge = '1' or timer_2min_1 = 120 then -- odcitanie tim 1, 2min
            if PP_2min_1 > 0 then -- ochrana proti podteceniu
                PP_2min_1 <= PP_2min_1 - 1;
            end if;
        end if;
            
        if SW5_edge = '1' or timer_2min_2 = 120 then -- odcitanie tim 2, 2 min
            if PP_2min_2 > 0 then -- ochrana proti podteceniu
                PP_2min_2 <= PP_2min_2 - 1;
            end if;
        end if;
            
        if timer_5min_1 = 300 then -- odcitanie tim 1, 5 min
            if PP_5min_1 > 0 then -- ochrana proti podteceniu
                PP_5min_1 <= PP_5min_1 - 1;
            end if;
        end if;
        
        if timer_5min_2 = 300 then -- odcitanie tim 2, 5min
            if PP_5min_2 > 0 then -- ochrana proti podteceniu
                PP_5min_2 <= PP_5min_2 - 1;
            end if;
        end if;
            
            
      
     end if;        

end if;
end process;

process(clk) is
begin
if rising_edge(clk) then
    
        LED10_i <= '1';  -- defaultná hodnota
        LED11_i <= '1';
        LED1_i <= '1';  -- defaultná hodnota
        LED2_i <= '1';
        
  if SW13 = '1' then
    
    LED1_i <= '1';
    LED2_i <= '1';
    LED10_i <= '1';
    LED11_i <= '1';
  
  else  
    case PP_2min_1 + PP_5min_1 is --tim 1
        when 0 =>
            LED1_i <= '1';
            LED2_i <= '1';
        
        when 1 =>
            LED1_i <= '0';
            LED2_i <= '1';
        
        when others =>
            LED1_i <= '0';
            LED2_i <= '0';       
     end case;
     
     case PP_2min_2 + PP_5min_2 is --tim 2
        when 0 =>
            LED10_i <= '1';
            LED11_i <= '1';
        
        when 1 =>
            LED10_i <= '0';
            LED11_i <= '1';
        
        when others =>
            LED10_i <= '0';
            LED11_i <= '0';       
     end case;
  end if;
end if;
end process;

LED1 <= LED1_i;
LED2 <= LED2_i;
LED10 <= LED10_i;
LED11 <= LED11_i;
    

process(sec_pulse) is
begin

if rising_edge(sec_pulse) then
    
 if SW15 = '0' then   
    if PP_2min_1 > 0 then -- 1 tim 2 min
        timer_2min_1 <= timer_2min_1 + 1;
        
        if SW8_edge = '1' or timer_2min_1 = 120 then
           timer_2min_1 <= 0;  
        
        end if;
     end if;
     
     if PP_2min_2 > 0 then -- 2 tim 2 min
        timer_2min_2 <= timer_2min_2 + 1;
        
        if SW5_edge = '1' or timer_2min_2 = 120 then          
                timer_2min_2 <= 0;
        end if;
     end if;
     
     if PP_5min_1 > 0 then -- 1 tim 5 min
        timer_5min_1 <= timer_5min_1 + 1;
        
        if timer_5min_1 = 300 then 
                timer_5min_1 <= 0;
            
        end if;
     end if;
     
     if PP_5min_2 > 0 then -- 2 tim 5 min
        timer_5min_2 <= timer_5min_2 + 1;
        
        if timer_5min_2 = 300 then 
                timer_5min_2 <= 0;
        end if;
     end if;
         
  end if;
end if;

end process;

end Behavioral;

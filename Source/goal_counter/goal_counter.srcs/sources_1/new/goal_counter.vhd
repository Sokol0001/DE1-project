----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2025 22:23:56
-- Design Name: 
-- Module Name: goal_counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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

entity goal_counter is
    Port ( clk : in STD_LOGIC;
           SW14 : in STD_LOGIC;
           rst : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           unit1 : out STD_LOGIC_VECTOR (3 downto 0);
           ten1 : out STD_LOGIC_VECTOR (3 downto 0);
           unit2 : out STD_LOGIC_VECTOR (3 downto 0);
           ten2 : out STD_LOGIC_VECTOR (3 downto 0));
end goal_counter;

architecture Behavioral of goal_counter is

signal score_a : unsigned(6 downto 0) := (others => '0'); -- 0 až 99
signal score_b : unsigned(6 downto 0) := (others => '0'); -- 0 až 99
signal btnl_prev : std_logic := '0';  
signal btnr_prev : std_logic := '0';
signal btnl_edge : std_logic := '0';
signal btnr_edge : std_logic := '0';


begin

process(clk)
begin
    
    if rising_edge(clk) then    
        btnl_edge <= BTNL and not(btnl_prev);
        btnr_edge <= BTNR and not(btnr_prev);
        btnl_prev <= BTNL;
        btnr_prev <= BTNR;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            score_a <= (others => '0'); 
            score_b <= (others => '0');
        else
            -- Tím A
            if btnl_edge = '1' then
                if SW14 = '0' then  -- pricitanie
                    if score_a < 99 then
                        score_a <= score_a + 1;
                    else
                        score_a <= (others => '0');-- ak nastane 99 dalsi stav 00
                    end if;
                else  -- odcitanie
                    if score_a > 0 then
                        score_a <= score_a - 1;
                    else
                        score_a <= (others => '0');-- ak je stav 00 tak aj 00 ostane
                    end if;
                end if;
            end if;

            -- Tím B
            if btnr_edge = '1' then
                if SW14 = '0' then -- pricitanie
                    if score_b < 99 then
                        score_b <= score_b + 1;  
                    else
                        score_b <= (others => '0'); -- ak nastane 99 dalsi stav 00
                    end if;
                else-- odcitanie
                    if score_b > 0 then 
                        score_b <= score_b - 1;
                    else
                        score_b <= (others => '0');-- ak je stav 00 tak aj 00 ostane
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;



-- Výstupy: rozdelenie na desiatky a jednotky
unit1 <= std_logic_vector(to_unsigned(to_integer(score_a) mod 10, 4)); -- jednotky prvy tim
ten1 <= std_logic_vector(to_unsigned(to_integer(score_a) / 10, 4));   -- desiatky prvy tim
unit2 <= std_logic_vector(to_unsigned(to_integer(score_b) mod 10, 4)); -- jednotky druhy tim
ten2 <= std_logic_vector(to_unsigned(to_integer(score_b) / 10, 4)); -- desiatky druhy tim

end Behavioral;

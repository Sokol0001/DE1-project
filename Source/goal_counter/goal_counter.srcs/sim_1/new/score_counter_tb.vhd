    stimuli : process
    begin
        -- Inicializácia
        SW14 <= '0';
        BTNL <= '0';
        BTNR <= '0';
        rst  <= '1';
        wait for 2 * TbPeriod;

        rst <= '0';
        wait for 2 * TbPeriod;

        -- BTNL (tím A +1)
        BTNL <= '1';
        wait for TbPeriod / 2;  -- aby sa stihlo zachytiť na nábehovej hrane clk
        BTNL <= '0';
        wait for 2 * TbPeriod;

        -- BTNR (tím B +1)
        BTNR <= '1';
        wait for TbPeriod / 2;
        BTNR <= '0';
        wait for 2 * TbPeriod;

        -- BTNL (tím A +1) -> spolu 2
        BTNL <= '1';
        wait for TbPeriod / 2;
        BTNL <= '0';
        wait for 2 * TbPeriod;

        -- Prepneme SW14 na '1' → režim mínus
        SW14 <= '1';
        wait for 2 * TbPeriod;

        -- BTNL (tím A -1) -> teraz 1
        BTNL <= '1';
        wait for TbPeriod / 2;
        BTNL <= '0';
        wait for 2 * TbPeriod;

        -- BTNR (tím B -1) -> teraz 0
        BTNR <= '1';
        wait for TbPeriod / 2;
        BTNR <= '0';
        wait for 2 * TbPeriod;

        -- Ešte raz BTNR (tím B -1, pod nulu) → reset na 0
        BTNR <= '1';
        wait for TbPeriod / 2;
        BTNR <= '0';
        wait for 2 * TbPeriod;

        -- Ešte raz BTNL (tím A -1, bude 0)
        BTNL <= '1';
        wait for TbPeriod / 2;
        BTNL <= '0';
        wait for 2 * TbPeriod;

        -- BTNL (tím A -1, už 0 → reset na 0)
        BTNL <= '1';
        wait for TbPeriod / 2;
        BTNL <= '0';
        wait for 2 * TbPeriod;

        -- BTNL (tím A -1, ešte raz z nuly → reset znova)
        BTNL <= '1';
        wait for TbPeriod / 2;
        BTNL <= '0';
        wait for 2 * TbPeriod;

        -- Ukončenie simulácie po dlhšom čase
        wait for 1 ms;
        TbSimEnded <= '1';
        wait;
    end process;


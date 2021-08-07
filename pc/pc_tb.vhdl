library ieee;
use ieee.std_logic_1164.all;

entity pc_tb is
end pc_tb;


architecture test of pc_tb is
    signal clk    : std_logic;
    signal reset  : std_logic;
    signal PC_cur     : std_logic_vector(31 downto 0);
    signal PCNext : std_logic_vector(31 downto 0);
    begin
        inst_pc : entity work.pc(rtl)
                    port map(PC_cur => PC_cur, PCNext => PCNext, clk => clk, reset => reset);
        process begin
            reset <= '1';
            wait for 5 ns;
            reset <= '0';
            clk <= '1';
            PCNext <= "00001111010110101111000000111100";
            wait for 5 ns;
            clk <= '0';
            PCNext <= "00001111010110101111000000111000";
            wait for 5 ns;
            reset <= '1';
            clk <= '1';
            PCNext <= "00001111010110101111000000111100";
            wait for 5 ns;
            reset <= '0';
            clk <= '1';
            PCNext <= "00001111010110101111000000111001";
            wait;
            end process;
    end test;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_cycle_tb is
end single_cycle_tb;

architecture test of single_cycle_tb is

    signal clk : std_logic;
    signal reset : std_logic;
    signal instr : std_logic_vector(31 downto 0);

    begin

        inst_single_cycle : entity work.single_cycle(rtl)
            port map(
                clk => clk,
                reset => reset,
                instr => instr
            );
        
        process begin
            reset <= '1';
            clk <= '0';
            wait for 5 ns;
            reset <= '0';
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait;
        end process;
    end test;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memr_tb is
end data_memr_tb;

architecture test of data_memr_tb is

    signal addr_port : std_logic_vector(31 downto 0) := (others => '0');
    signal write_data : std_logic_vector(31 downto 0) := (others => '0');
    signal clk : std_logic := '0';
    signal write_en : std_logic := '0';
    signal read_data : std_logic_vector(31 downto 0) := (others => '0');

    begin
        inst_data_memr : entity work.data_memr(rtl)
                        port map (addr_port => addr_port, write_data => write_data, clk => clk, 
                                  write_en => write_en, read_data => read_data);
        
         process begin
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

        process begin
            write_en <= '1';
            addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0001";
            write_data <= B"0000_1100_0111_0000_1111_0010_0110_1111";

            wait for 20 ns;
            addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0010";
            write_data <= B"0000_1100_0111_0000_1111_0010_0110_1110";
            
            wait for 20 ns;

            write_en <= '0';
            addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0001";
            wait for 20 ns;
            addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0010";
            wait;
        end process;

    end test;
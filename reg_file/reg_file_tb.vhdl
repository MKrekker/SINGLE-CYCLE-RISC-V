library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file_tb is
end reg_file_tb;

architecture test of reg_file_tb is

    signal read_port_addr1 : std_logic_vector(4 downto 0):= (others =>'0');
    signal read_port_addr2 : std_logic_vector(4 downto 0) := (others =>'0');
    signal write_port_addr : std_logic_vector(4 downto 0) := (others =>'0');
    signal write_data : std_logic_vector(31 downto 0) := (others =>'0');
    signal write_en : std_logic := '0';
    signal clk : std_logic := '0';
    signal read_data1 : std_logic_vector(31 downto 0) := (others =>'0');
    signal read_data2 : std_logic_vector(31 downto 0) := (others =>'0');
    
    begin
        inst_reg_file : entity work.reg_file(rtl)
                    port map(read_port_addr1 => read_port_addr1, read_port_addr2 => read_port_addr2, clk => clk,
                    write_port_addr => write_port_addr, write_data => write_data, write_en => write_en,
                    read_data1 => read_data1, read_data2 => read_data2);


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
            write_port_addr <= "00001";
            write_data <= B"0000_1100_0111_0000_1111_0010_0110_1111";

            wait for 20 ns;
            write_port_addr <= "00010";
            write_data <= B"0000_1100_0111_0000_1111_0010_0110_1110";
            
            wait for 20 ns;

            write_en <= '0';
            read_port_addr1 <= "00001";
            read_port_addr2 <= "00010";
            wait for 5 ns;
            wait;
        end process;

    end test;
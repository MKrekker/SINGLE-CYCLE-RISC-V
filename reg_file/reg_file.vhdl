library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file is
    port(
        read_port_addr1 : in std_logic_vector(4 downto 0);
        read_port_addr2 : in std_logic_vector(4 downto 0);
        write_port_addr : in std_logic_vector(4 downto 0);
        write_data : in std_logic_vector(31 downto 0);
        write_en : in std_logic;
        clk : in std_logic;
        read_data1 : out std_logic_vector(31 downto 0);
        read_data2 : buffer std_logic_vector(31 downto 0)
    );
end reg_file;

architecture rtl of reg_file is

    type registers is array (31 downto 0) of std_logic_vector(31 downto 0);

    --Note x0 is hardwired to 0
    signal mem_1 : registers :=(others => (others => '0'));
    begin

        Write_Data_Proc : process(clk)begin
            if rising_edge(clk) then
                if write_port_addr /= "00000" and write_en = '1' then
                    mem_1(to_integer(unsigned(write_port_addr))) <= write_data;
                end if;
            end if;
        end process;

        read_data1 <= mem_1(to_integer(unsigned(read_port_addr1)));
        read_data2 <= mem_1(to_integer(unsigned(read_port_addr2)));


        end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memr is
    port(
        addr_port : in std_logic_vector(31 downto 0);
        write_data : in std_logic_vector(31 downto 0);
        clk : in std_logic;
        write_en : in std_logic;
        read_data : out std_logic_vector(31 downto 0)
    );
end data_memr;

architecture rtl of data_memr is

    type ram_type is array (63 downto 0) of std_logic_vector(31 downto 0);
    
    signal mem : ram_type := (others => (others => '0'));
    
    begin
        process(clk, write_en) begin
                if rising_edge(clk) then
                    if(write_en = '1')then
                        mem(to_integer(unsigned(addr_port(7 downto 2)))) <= write_data;
                    end if;
                end if;
        end process;
        process(addr_port)begin
            read_data <= mem(to_integer(unsigned(addr_port(7 downto 2))));
        end process;
    end rtl;
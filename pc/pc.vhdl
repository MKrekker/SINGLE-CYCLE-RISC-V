library ieee;
use ieee.std_logic_1164.all;

entity pc is
    port(
        PCNext : in std_logic_vector(31 downto 0);
        clk    : in std_logic;
        reset  : in std_logic;
        PC_cur : buffer std_logic_vector(31 downto 0)
    );
end pc;

architecture rtl of pc is
    begin
        process(clk, reset)
            begin
                if (reset = '1')then
                    PC_cur <= (others => '0');
                else if clk'event and clk = '1' then
                        PC_cur <= PCNext;
                    end if;
                end if;
            end process;
    end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extend_tb is
end extend_tb;

architecture test of extend_tb is
    signal ImmSrc      : std_logic_vector(1 downto 0);
    signal instruction : std_logic_vector(31 downto 7);
    signal ImmExt      : std_logic_vector(31 downto 0);

    begin

        inst_extend: entity work.extend(rtl)
                    port map (ImmSrc => ImmSrc, instruction => instruction, ImmExt => ImmExt);

        
       process begin
            ImmSrc <= "00";
            wait for 5 ns;
            ImmSrc <= "01";
            wait for 5 ns;
            ImmSrc <= "10";
            wait for 5 ns;
            ImmSrc <= "11";
            wait for 5 ns;
            ImmSrc <= "00";
            wait for 5 ns;
            ImmSrc <= "01";
            wait for 5 ns;
            ImmSrc <= "10";
            wait for 5 ns;
            ImmSrc <= "11";
            wait;
        end process;

        process begin
        instruction <= B"0000_1100_0111_0000_1111_0010_0";
        wait for 20 ns;
        instruction <= B"0000_1100_0111_0000_1111_0010_1";           
        wait;
        end process;
        

    end test;

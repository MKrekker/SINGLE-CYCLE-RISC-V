library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extend is
    port(
        ImmSrc      : in std_logic_vector(1 downto 0);
        instruction : in std_logic_vector(31 downto 7);
        ImmExt      : buffer std_logic_vector(31 downto 0)
    );
end extend;

architecture rtl of extend is
    begin
        process(ImmSrc, instruction) begin

            case ImmSrc is
                
                --I-Type
                when "00" => ImmExt <= (31 downto 12 => instruction(31)) & instruction(31 downto 20);
                
                --S-Type
                when "01" => ImmExt <= (31 downto 12 => instruction(31)) & instruction(31 downto 25) & instruction(11 downto 7);
                
                --B-Type
                when "10" => ImmExt <= (31 downto 12 => instruction(31)) & instruction(7) & instruction(30 downto 25) & instruction(11 downto 8) & '0'; 
                
                --J-Type(jal)
                when "11" => ImmExt <= (31 downto 20 => instruction(31)) & instruction(19 downto 12) & instruction(20) & instruction(30 downto 21) & '0';
                                    
                when others => ImmExt <= (31 downto 0 => '-');
                
            end case;
        end process;
    end rtl;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Decoder is
    port(
        op5 : in std_logic;
        funct3 : in std_logic_vector(2 downto 0);
        funct7_5 : in std_logic;
        ALUOp : in std_logic_vector(1 downto 0);
        ALUControl : out std_logic_vector(2 downto 0)
    );
end ALU_Decoder;

architecture rtl of ALU_Decoder is
    begin
        process(op5, funct3, funct7_5, ALUOp) begin
            case ALUOp is
                when "00" => ALUControl <= "000"; --add
                when "01" => ALUControl <= "001"; --sub
                when others => case funct3 is
                            when "000" => if ((op5 and funct7_5) = '1') then
                                                ALUControl <= "001"; --sub
                                          else
                                                ALUControl <= "000"; --add
                                          end if;
                            when "010" => ALUControl <= "101"; --slt
                            when "110" => ALUControl <= "011"; --or
                            when "111" => ALUControl <= "010"; --and
                            when others => ALUControl <= "---"; --undefined
                            end case;
            end case;
        end process;
    end rtl;

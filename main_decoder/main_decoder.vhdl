library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_decoder is
    port(
        signal op : in std_logic_vector(6 downto 0);
        signal branch : out std_logic;
        signal MemWrite : out std_logic;
        signal ALUSrc : out std_logic;
        signal ImmSrc : out std_logic_vector(1 downto 0);
        signal RegWrite : out std_logic;
        signal ALUOp : out std_logic_vector(1 downto 0);
        signal ResultSrc : out std_logic
    );
end main_decoder;

architecture rtl of main_decoder is
    signal controls : std_logic_vector(8 downto 0);
    begin
        process(op)begin
            case op is
                when "0000011" => controls <= "100101000"; --lw
                when "0100011" => controls <= "00111-000"; --sw
                when "0110011" => controls <= "1--000010"; --R-type
                when "1100011" => controls <= "01000-101"; --beq
                when "0010011" => controls <= "100100010"; --addi
                when others => controls <= "---------";
            end case;
        end process;

        RegWrite <= controls(8);
        ImmSrc <= controls(7 downto 6);
        ALUSrc <= controls(5);
        MemWrite <= controls(4);
        ResultSrc <= controls(3);
        branch <= controls(2);
        ALUOp <= controls(1 downto 0);
    
    end rtl;


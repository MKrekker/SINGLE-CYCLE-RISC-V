library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Decoder_tb is
end ALU_Decoder_tb;

architecture test of ALU_Decoder_tb is
    
    signal op5 : std_logic;
    signal funct3 : std_logic_vector(2 downto 0);
    signal funct7_5 : std_logic;
    signal ALUOp : std_logic_vector(1 downto 0);
    signal ALUControl : std_logic_vector(2 downto 0);
    
    begin

        inst_ALU_Decoder : entity work.ALU_Decoder(rtl)
                            port map(op5 => op5, funct3 => funct3, funct7_5 => funct7_5, ALUOp => ALUOp, ALUControl => ALUControl);
            
        process begin
            --lw,sw
            ALUOp <= "00";
            funct3 <= "---";
            op5 <= '-';
            funct7_5 <= '-';
            wait for 5 ns;
            --beq
            ALUOp <= "01";
            funct3 <= "---";
            op5 <= '-';
            funct7_5 <= '-';
            wait for 5 ns;
            --add
            ALUOp <= "10";
            funct3 <= "000";
            op5 <= '0';
            funct7_5 <='1';
            wait for 5 ns;
            --sub
            ALUOp <= "10";
            funct3 <= "000";
            op5 <= '1';
            funct7_5 <='1';
            wait for 5 ns;
            --slt
            ALUOp <= "--";
            funct3 <= "010";
            op5 <= '-';
            funct7_5 <= '-';
            wait for 5 ns;
            --or
            ALUOp <= "--";
            funct3 <= "110";
            op5 <= '-';
            funct7_5 <= '-';
            wait for 5 ns;
            ALUOp <= "--";
            funct3 <= "111";
            op5 <= '-';
            funct7_5 <= '-';
            wait for 5 ns;
        wait;
        end process;

    end test;
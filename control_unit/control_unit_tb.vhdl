library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_tb is
end control_unit_tb;

architecture test of control_unit_tb is
    
    signal op : std_logic_vector(6 downto 0);
    signal funct3 : std_logic_vector(2 downto 0);
    signal funct7_5 : std_logic;
    signal Zero : std_logic;
    signal PCSrc : std_logic;
    signal ResultSrc : std_logic;
    signal MemWrite : std_logic;
    signal ALUControl : std_logic_vector(2 downto 0);
    signal ALUSrc : std_logic;
    signal ImmSrc : std_logic_vector(1 downto 0);
    signal RegWrite : std_logic;

    begin

        inst_control_unit : entity work.control_unit(rtl)
                            port map(op => op, funct3 => funct3, funct7_5 => funct7_5, Zero => Zero, PCSrc => PCSrc, ResultSrc => ResultSrc, MemWrite => MemWrite, 
                            ALUControl => ALUControl, ALUSrc => ALUSrc, ImmSrc => ImmSrc, RegWrite => RegWrite);
        process begin
            op <= b"0000_011"; --ALUOp <="00"
            Zero <= '0';
            funct3 <= "---";
            funct7_5 <= '-'; 
            wait for 5 ns;
            op <= b"0100_011"; --ALUOp <="00"
            Zero <= '1';
            funct3 <= "---";
            funct7_5 <= '-';
            wait for 5 ns;
            op <= b"0110_011"; -- ALUOp <= "10"
            Zero <= '0';
            funct3 <= "000";
            funct7_5 <= '0';
            wait for 5 ns;
            op <= b"1100_011"; -- ALUOp <= "01"
            Zero <= '1';
            Zero <= '1';
            funct3 <= "---";
            funct7_5 <= '-';
            wait for 5 ns;
            wait;
        end process;

    end test;
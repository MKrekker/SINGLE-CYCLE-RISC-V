library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
    port(
        signal op : in std_logic_vector(6 downto 0);
        signal funct3 : in std_logic_vector(14 downto 12);
        signal funct7_5 : in std_logic;
        signal Zero : in std_logic;
        signal PCSrc : out std_logic;
        signal ResultSrc : out std_logic;
        signal MemWrite : out std_logic;
        signal ALUControl : out std_logic_vector(2 downto 0);
        signal ALUSrc : out std_logic;
        signal ImmSrc : out std_logic_vector(1 downto 0);
        signal RegWrite : out std_logic
    );
end control_unit;

architecture rtl of control_unit is
    signal branch : std_logic;
    signal ALUOp : std_logic_vector(1 downto 0);
    begin
        inst_main_decoder : entity work.main_decoder(rtl)
                            port map(op => op, branch => branch, ALUOp => ALUOp, ResultSrc => ResultSrc, MemWrite => MemWrite, ALUSrc => ALUSrc, ImmSrc => ImmSrc, RegWrite => RegWrite);
        
        PCSrc <= branch and Zero;

        inst_ALU_Decoder : entity work.ALU_Decoder(rtl)
                            port map(ALUOp =>ALUOp, funct3 => funct3, funct7_5 => funct7_5, ALUControl => ALUControl, op5 => op(5));
        
    end rtl;
        


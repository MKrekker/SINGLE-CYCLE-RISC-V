library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity single_cycle is
    port(
         clk : in std_logic;
         reset : in std_logic;
         instr : buffer std_logic_vector(31 downto 0)
    );
end single_cycle;

architecture rtl of single_cycle is

    signal Zero : std_logic;
    signal PCSrc : std_logic;
    signal ResultSrc : std_logic_vector(1 downto 0);
    signal MemWrite : std_logic;
    signal ALUControl : std_logic_vector(2 downto 0);
    signal ALUSrc : std_logic;
    signal ImmSrc : std_logic_vector(1 downto 0);
    signal RegWrite : std_logic;
    signal PC_buf : std_logic_vector(31 downto 0);
    signal ALUResult, WriteData, ImmExt : std_logic_vector(31 downto 0);


    begin

        inst_control_unit : entity work.control_unit(rtl)
            port map(
                op => instr(6 downto 0),
                funct3 => instr(14 downto 12),
                funct7_5 => instr(30),
                Zero => Zero,
                PCSrc => PCSrc,
                ResultSrc => ResultSrc,
                MemWrite => MemWrite,
                ALUControl => ALUControl,
                ALUSrc => ALUSrc,
                ImmSrc => ImmSrc,
                RegWrite => RegWrite
            );

        inst_datapath : entity work.datapath(rtl)
            port map(
               clk => clk,
               reset => reset,
               PCSrc => PCSrc,
               ALUSrc => ALUSrc,
               ALUControl => ALUControl,
               RegWrite => RegWrite,
               ImmSrc => ImmSrc,
               Instr => instr,
               MemWrite => MemWrite,
               ResultSrc => ResultSrc,
               Zero => Zero
            );
end rtl;

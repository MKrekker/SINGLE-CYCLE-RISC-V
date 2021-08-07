library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
end ALU_tb;

architecture test of ALU_tb is

    signal SrcA : std_logic_vector(31 downto 0);
    signal SrcB : std_logic_vector(31 downto 0);
    signal ALUControl : std_logic_vector(2 downto 0);
    signal Zero : std_logic;
    signal ALUResult : std_logic_vector(31 downto 0);

    begin
        inst_ALU : entity work.ALU(rtl)
                    port map(SrcA => SrcA, SrcB => SrcB, ALUControl => ALUControl, Zero => Zero, ALUresult => ALUResult);
        
        process begin
            ALUControl <= "000";
            wait for 5 ns;
            ALUControl <= "001";
            wait for 5 ns;
            ALUControl <= "010";
            wait for 5 ns;
            ALUControl <= "011";
            wait for 5 ns;
            ALUControl <= "101";
            wait for 5 ns;
            ALUControl <= "111";
            wait for 5 ns;
            wait;
        end process;

        SrcA <= x"00000001";
        SrcB <= x"00000010";

    end test;
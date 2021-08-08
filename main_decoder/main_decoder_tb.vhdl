library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_decoder_tb is
end main_decoder_tb;

architecture test of main_decoder_tb is

    signal op : std_logic_vector(6 downto 0);
    signal branch : std_logic;
    signal MemWrite : std_logic;
    signal ALUSrc : std_logic;
    signal ImmSrc : std_logic_vector(1 downto 0);
    signal RegWrite : std_logic;
    signal ALUOp : std_logic_vector(1 downto 0);
    signal ResultSrc : std_logic;

    begin

        inst_main_decoder : entity work.main_decoder(rtl)
                            port map(op => op, branch => branch, MemWrite => MemWrite, ALUSrc => ALUSrc, ImmSrc => ImmSrc, RegWrite => RegWrite, ALUOp => ALUOp, ResultSrc => ResultSrc);

        process begin
            op <= "0000011";
            wait for 5 ns;
            op <= "0100011";
            wait for 5 ns;
            op <= "0110011";
            wait for 5 ns;
            op <= "1100011";
            wait for 5 ns;
            op <= "0010011";
            wait for 5 ns;
            wait;
            end process;

    end test;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath_tb is
end datapath_tb;

architecture test of datapath_tb is

    signal clk, reset : std_logic;
    signal PCSrc : std_logic;
    signal ALUSrc : std_logic;
    signal ALUControl : std_logic_vector(2 downto 0);
    signal RegWrite : std_logic;
    signal ImmSrc : std_logic_vector(1 downto 0);
    signal PC_buf : std_logic_vector(31 downto 0);
    signal ALUResult, WriteData, ImmExt : std_logic_vector(31 downto 0);
    signal MemWrite : std_logic;
    signal ResultSrc : std_logic;
    signal Zero : std_logic;

    begin

        inst_datapath : entity work.datapath(rtl)
                        port map(clk => clk, reset => reset, PCSrc => PCSrc, ALUSrc => ALUSrc, ALUControl => ALUControl, RegWrite => RegWrite, ImmSrc => ImmSrc,
                                PC_buf => PC_buf, ALUResult => ALUResult, WriteData => WriteData, ImmExt => ImmExt, MemWrite => MemWrite, ResultSrc => ResultSrc, Zero => Zero);
        reset <= '1';
        process begin
            reset <= '0';
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait;
        end process;

        process begin
            PCSrc <= '0';
            ImmSrc <= "00";
            ALUSrc <= '1';
            ALUControl <= "000";
            MemWrite <= '0';
            ResultSrc <= '0';
            wait for 10  ns;
            PCSrc <= '1';
            ImmSrc <= "01";
            ALUSrc <= '0';
            ALUControl <= "000";
            MemWrite <= '1';
            ResultSrc <= '0';
            wait for 10 ns;
            PCSrc <= '0';
            ImmSrc <= "10";
            ALUSrc <= '0';
            ALUControl <= "010";
            MemWrite <= '1';
            ResultSrc <= '1';
            wait;
        end process;

        end test;
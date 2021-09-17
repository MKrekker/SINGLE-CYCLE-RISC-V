library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_mem is
    port(
        addr_instr : in std_logic_vector(31 downto 0);
        rd_instr : buffer std_logic_vector(31 downto 0)
    );
end instr_mem;

architecture rtl of instr_mem is

    type romtype is array (63 downto 0) of std_logic_vector(31 downto 0);
    signal mem: romtype;

    begin
        mem(0) <= x"000002b3"; --addi x2, x0, 2
        mem(1) <= x"00100313"; --addi x3, x0, 5
        mem(2) <= x"00600533"; --add x4, x3, x2
        mem(3) <= x"006282b3"; --sub x4, x4, x2
        mem(4) <= x"00500533"; --sw x4, 38(x3)
        mem(5) <= x"00628333"; --lw x2, 43(x0)
        mem(6) <= x"00600533"; --and x5, x2, x4
        mem(7) <= x"fe0008e3"; --or x6, x5, x2
        --mem(8) <= x"0075be33"; --slt x6, x6, x5
        --mem(9) <= x"000e1663"; --sw x6, 48(x5)
        --mem(10) <= x"407585b3";
        --mem(11) <= x"00536333";
        --mem(12) <= x"01e2d2b3";
        --mem(13) <= x"fe0292e3";
        --mem(14) <= x"00600533";
        --mem(15) <= x"00000063";












        process(addr_instr)begin
            rd_instr <= mem(to_integer(unsigned(addr_instr(31 downto 2))));
        end process;
    end rtl;

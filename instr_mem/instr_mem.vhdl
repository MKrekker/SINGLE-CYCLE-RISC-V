library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_mem is
    port(
        addr_instr : in std_logic_vector(31 downto 0);
        rd_instr : out std_logic_vector(31 downto 0)
    );
end instr_mem;

architecture rtl of instr_mem is

    type romtype is array (63 downto 0) of std_logic_vector(31 downto 0);
    signal mem: romtype;

    begin
        mem(0) <= x"00200113"; --addi x2, x0, 2
        mem(1) <= x"00500193"; --addi x3, x0, 5
        mem(2) <= x"00218233"; --add x4, x3, x2
        mem(3) <= x"40220233"; --sub x4, x4, x2
        mem(4) <= x"0041AB23"; --sw x4, 38(x3)
        mem(5) <= x"01B02103"; --lw x2, 43(x0)
        mem(6) <= x"004172B3"; --and x5, x2, x4
        mem(7) <= x"0022E333"; --or x6, x5, x2
        mem(8) <= x"00532333"; --slt x6, x6, x5
        mem(9) <= x"0262A823"; --sw x6, 48(x5)

        process(addr_instr)begin
            rd_instr <= mem(to_integer(unsigned(addr_instr(31 downto 2))));
        end process;
    end rtl;
library ieee;
use ieee.std_logic_1164.all;

entity instr_mem_tb is
end instr_mem_tb;

architecture test of instr_mem_tb is
    signal addr_instr : std_logic_vector(31 downto 0);
    signal rd_instr : std_logic_vector(31 downto 0);

    begin

        inst_instr_mem : entity work.instr_mem(rtl)
                        port map(addr_instr => addr_instr, rd_instr => rd_instr);
        
        process begin

            addr_instr <= x"00000000";
            wait for 10 ns;
            addr_instr <= x"00000004";
            wait for 10 ns;
            addr_instr <= x"00000008";
            wait for 10 ns;
            addr_instr <= x"0000000C";
            wait for 10 ns;
            addr_instr <= x"00000010";
            wait for 10 ns;
            addr_instr <= x"00000014";
            wait for 10 ns;
            addr_instr <= x"00000018";
            wait for 10 ns;
            addr_instr <= x"0000001C";
            wait for 10 ns;
            addr_instr <= x"00000020";
            wait for 10 ns;
            addr_instr <= x"00000024";
            wait for 10 ns;
            wait;
        end process;

  end test;
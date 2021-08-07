library ieee;
use ieee.std_logic_1164.all;

entity mux_2_tb is
end mux_2_tb;

architecture test of mux_2_tb is
    signal port_in1 :   std_logic_vector(7 downto 0); 
    signal port_in2 :   std_logic_vector(7 downto 0);
    signal sel      :   std_logic;
    signal port_out :   std_logic_vector(7 downto 0);

    begin

    inst_mux_2 : entity work.mux_2(rtl)
                generic map (8)
                port map(port_in1 => port_in1, port_in2 => port_in2, sel => sel, port_out => port_out);

    port_in1 <= B"1100_0010";
    port_in2 <= B"0010_1001";
    sel <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 12 ns;

    end test;

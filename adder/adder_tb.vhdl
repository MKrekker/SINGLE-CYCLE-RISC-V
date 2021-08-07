library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end adder_tb;

architecture test of adder_tb is
    signal a_in : std_logic_vector(31 downto 0);
    signal b_in : std_logic_vector(31 downto 0);
    signal c_out: std_logic_vector(31 downto 0);

    begin 
    
    inst_adder : entity work.adder(rtl)
                port map(a_in => a_in, b_in => b_in, c_out => c_out);
    
    a_in <= B"0000_0011_1100_0000_0000_0000_0000_0000";
    b_in <= std_logic_vector(to_unsigned(4, b_in'length));

    end test;
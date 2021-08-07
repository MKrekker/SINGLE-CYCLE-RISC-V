library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic(numberbits_b : integer := 32);
    port(
        a_in : in std_logic_vector(31 downto 0);
        b_in : in std_logic_vector(numberbits_b-1 downto 0);
        c_out: out std_logic_vector(31 downto 0)
    );
end adder;

architecture rtl of adder is
    begin
    
        c_out <= std_logic_vector(unsigned(a_in) + unsigned(b_in));
    
    end rtl;
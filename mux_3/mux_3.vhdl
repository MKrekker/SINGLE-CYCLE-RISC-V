library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_3 is
  generic(N : integer := 32);
  port (
    a   : in std_logic_vector(N-1 downto 0);
    b   : in std_logic_vector(N-1 downto 0);
    c   : in std_logic_vector(N-1 downto 0);
    sel   : in std_logic_vector(1 downto 0);
    y   : out std_logic_vector(N-1 downto 0)
  );
end mux_3;

architecture rtl of mux_3 is
  begin
    process(sel,a,b,c)
      begin
        case sel is
          when "00" => y <= a;
          when "01" => y <= b;
          when "10" => y <= c;
          when others => y <= (others => '-');
        end case;
      end process;
end rtl;

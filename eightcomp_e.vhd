library ieee;
use ieee.std_logic_1164.all;

entity eightcomp_e is
  port (
    a_i  : in     std_logic_vector(7 downto 0);
    b_i  : in     std_logic_vector(7 downto 0);
    en_i : in     std_logic;
    y_o  : out    std_logic);
end entity eightcomp_e;
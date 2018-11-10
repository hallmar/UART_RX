library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rom_e is
  port (
    char_o   : out    std_logic_vector(7 downto 0);
    clk_i    : in     std_logic;
    en_i     : in     std_logic;
    pass_sel : in     std_logic_vector(1 downto 0);
    rb_i     : in     std_logic);
end entity rom_e;



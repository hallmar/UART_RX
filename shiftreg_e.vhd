library ieee;
use ieee.std_logic_1164.all;

entity shiftreg_e is
  port (
    rx_i         : in     std_logic;
    clk_i        : in     std_logic;
    data_o       : out    std_logic_vector(7 downto 0);
    en_i         : in     std_logic;
    paritydata_o : out    std_logic;
    rb_i         : in     std_logic);
end entity shiftreg_e;



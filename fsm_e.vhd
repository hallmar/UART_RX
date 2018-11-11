library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_e is
  port (
    rx_i      : in     std_logic;
    clk_i     : in     std_logic;
    compare_o : out    std_logic;
    rb_i      : in     std_logic;
    sren_o    : out    std_logic);
end entity fsm_e;

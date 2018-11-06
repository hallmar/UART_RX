library ieee;
use ieee.std_logic_1164.all;

entity UARTrx_e is
  port (
    RX_i     : in     std_logic;
    clk_i    : in     std_logic;
    heartb_o : out    std_logic;
    parity_o : out    std_logic;
    pass_o   : out    std_logic;
    pass_sel : in     std_logic_vector(1 downto 0);
    rb_i     : in     std_logic);
end entity UARTrx_e;
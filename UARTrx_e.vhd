library ieee;
use ieee.std_logic_1164.all;

entity uartrx_e is
  port (
    rx_i     : in     std_logic;
    clk_i    : in     std_logic;
    heartb_o : out    std_logic;
    parity_o : out    std_logic;
    pass_o   : out    std_logic;
    pass_sel_i : in     std_logic_vector(1 downto 0);
    rb_i     : in     std_logic;
	rb_o     : out	 std_logic;
	passsel_o : out	 std_logic_vector(1 downto 0)
	 );
end entity uartrx_e;

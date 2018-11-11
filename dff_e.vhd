library ieee;
use ieee.std_logic_1164.all;

entity dff_e is
port(
	d_i: in std_logic;
	clk_i: in std_logic;
	rb_i: in std_logic;
	en_i: in std_logic;
	q_o: out std_logic
	);
end dff_e;

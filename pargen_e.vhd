library ieee;
use ieee.std_logic_1164.all;

entity pargen_e is
port(
	data_i: 	    in std_logic_vector(7 downto 0);
	paritycheck_o: 	out std_logic);
end pargen_e;

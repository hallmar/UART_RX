library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pargen_e is
port(
	data_i: 	    IN STD_LOGIC_VECTOR(7 downto 0);
	paritycheck_o: 	OUT STD_LOGIC);
end pargen_e;
architecture structure of eightcomp_e is
signal xord_s : std_logic_vector(7 downto 0);
signal y_s : std_logic;

begin
		xord_s <= a_i xor b_i;
		y_s <= '1' when xord_s = "00000000" else
				 '0';
		y_o <= y_s and en_i;
end architecture structure ; -- of eightcomp_e


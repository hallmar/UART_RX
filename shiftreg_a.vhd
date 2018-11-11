architecture shiftreg_a of shiftreg_e is
signal shift_s : std_logic_vector(8 downto 0) := (others => '0');
begin
	process(clk_i, rb_i)
	begin
	if(clk_i'event and clk_i = '1') then
		if(rb_i = '0') then
			shift_s <= (others => '0');
		elsif(en_i = '1') then
			shift_s(7 downto 0) <= shift_s(8 downto 1);
			shift_s(8) <= rx_i;
		end if;
	end if;
	end process;
	data_o <= shift_s(7 downto 0); -- where data_o(0) is the lsb and data_o(7) is msb
	paritydata_o <= shift_s(8);
end architecture shiftreg_a ; -- of shiftreg_e


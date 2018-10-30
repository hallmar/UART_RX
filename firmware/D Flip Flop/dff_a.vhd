architecture dff_a of dff_e is
begin
 dff : process(clk_i)
 begin
	if(clk_i'event and clk_i = '1') then
		if(rb_i = '0') then
		 q_o <= '0';
		elsif(en_i = '1') then
	     q_o <= d_i;
	    end if;
	end if;
 end process dff;
end dff_a;

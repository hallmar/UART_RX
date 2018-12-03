architecture rom_a of rom_e is

constant noth: std_logic_vector(7 downto 0) := "11111111";

type state is (s0,s1,s2,s3,s4,s5);
signal pr_state, nx_state: state;
begin
--evaluate states
	process(en_i, pr_state)
	begin
	nx_state <= pr_state;
		case pr_state is
				
			when s0 =>
				if(en_i = '1') then
					nx_state <= s1;
				end if;
				
			when s1 =>
				if(en_i = '1') then
					nx_state <= s2;
				end if;
				
			when s2 =>
				if(en_i = '1') then
					nx_state <= s3;
				end if;
				
			when s3 =>
				if(en_i = '1') then
					nx_state <= s4;
				end if;
				
			when s4 =>
				if(en_i = '1') then
					nx_state <= s5;
				end if;
				
			when s5 =>
				if(en_i = '1') then
					nx_state <= s0;
				end if;
			when others => 
				if(en_i = '1') then
					nx_state <= s0;
			   end if;
		end case;
	end process;
	
-- output processing
char_o<= 
			-- password one
			a  when (pr_state = s0)and(pass_sel_i="00")else
			b  when (pr_state = s1)and(pass_sel_i="00")else
			c  when (pr_state = s2)and(pass_sel_i="00")else
			d  when (pr_state = s3)and(pass_sel_i="00")else
			-- password two
			e  when (pr_state = s0)and(pass_sel_i="01")else
			f  when (pr_state = s1)and(pass_sel_i="01")else
			g  when (pr_state = s2)and(pass_sel_i="01")else
			h  when (pr_state = s3)and(pass_sel_i="01")else
			-- password three
			i  when (pr_state = s0)and(pass_sel_i="10")else
			j  when (pr_state = s1)and(pass_sel_i="10")else
			k  when (pr_state = s2)and(pass_sel_i="10")else
			l  when (pr_state = s3)and(pass_sel_i="10")else
			-- password four
			m  when (pr_state = s0)and(pass_sel_i="11")else
			n  when (pr_state = s1)and(pass_sel_i="11")else
			o  when (pr_state = s2)and(pass_sel_i="11")else
			p  when (pr_state = s3)and(pass_sel_i="11")else
			
			cr when pr_state = s4 else
			lf when pr_state = s5 else
			noth;
			
-- clock states
process(clk_i, rb_i)
begin
	if(rb_i ='0') then
		pr_state <= s0;
	elsif(rising_edge(clk_i)) then
			pr_state <= nx_state;
	end if;
end process;

end architecture rom_a ; -- of rom_e

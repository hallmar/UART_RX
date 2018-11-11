architecture rom_a of rom_e is

CONSTANT a: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(65, 8)); 
CONSTANT b: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(66, 8)); 
CONSTANT c: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(67, 8)); 
CONSTANT d: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(68, 8)); 
CONSTANT e: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(69, 8)); 
CONSTANT f: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(70, 8)); 
CONSTANT g: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(71, 8)); 
CONSTANT h: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(72, 8));
CONSTANT i: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(73, 8));  
CONSTANT j: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(74, 8)); 
CONSTANT k: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(75, 8)); 
CONSTANT l: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(76, 8));
CONSTANT m: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(77, 8)); 
CONSTANT n: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(78, 8)); 
CONSTANT o: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(79, 8));
CONSTANT p: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(80, 8)); 
CONSTANT q: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(81, 8));
CONSTANT r: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(82, 8));
CONSTANT s: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(83, 8));
CONSTANT t: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(84, 8));     
CONSTANT u: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(85, 8)); 

CONSTANT sp: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(32, 8));  --space
CONSTANT cr: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(13, 8)); --carriage return
CONSTANT lf: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(10, 8)); --line feed
CONSTANT nu: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(00, 8));  --null
CONSTANT noth: STD_LOGIC_VECTOR(7 downto 0) := "11111111";

Type state is (idle_state, s0,s1,s2,s3,s4,s5);
SIGNAL pr_state, nx_state: state;
begin
--Evaluate states
	process(en_i, pr_state)
	begin
	nx_state <= pr_state;
		case pr_state is
			when idle_state =>
				if(en_i = '1') then
					nx_state <= s0;
				end if;
				
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
					nx_state <= idle_state;
				end if;
			when others => 
				if(en_i = '1') then
					nx_state <= idle_state;
			   end if;
		end case;
	end process;
	
-- output processing
char_o<= noth when (pr_state = idle_state) else
			-- password one
			a  when (pr_state = s0)and(pass_sel="00")else
			b  when (pr_state = s1)and(pass_sel="00")else
			c  when (pr_state = s2)and(pass_sel="00")else
			d  when (pr_state = s3)and(pass_sel="00")else
			-- password two
			e  when (pr_state = s0)and(pass_sel="01")else
			f  when (pr_state = s1)and(pass_sel="01")else
			g  when (pr_state = s2)and(pass_sel="01")else
			h  when (pr_state = s3)and(pass_sel="01")else
			-- password three
			i  when (pr_state = s0)and(pass_sel="10")else
			j  when (pr_state = s1)and(pass_sel="10")else
			k  when (pr_state = s2)and(pass_sel="10")else
			l  when (pr_state = s3)and(pass_sel="10")else
			-- password four
			m  when (pr_state = s0)and(pass_sel="11")else
			n  when (pr_state = s1)and(pass_sel="11")else
			o  when (pr_state = s2)and(pass_sel="11")else
			p  when (pr_state = s3)and(pass_sel="11")else
			
			cr when pr_state = s4 else
			lf when pr_state = s5 else
			noth;
			
-- clock states
process(clk_i, rb_i)
begin
	if(rb_i ='0') then
		pr_state <= idle_state;
	elsif(rising_edge(clk_i)) then
			pr_state <= nx_state;
	end if;
end process;

end architecture rom_a ; -- of rom_e

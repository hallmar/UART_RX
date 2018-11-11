architecture div6_a of div6_e is

constant s0: std_logic_vector(3 downto 0) := "0000"; 
constant s1: std_logic_vector(3 downto 0) := "0001"; 
constant s2: std_logic_vector(3 downto 0) := "0010"; 
constant s3: std_logic_vector(3 downto 0) := "1011"; 
constant s4: std_logic_vector(3 downto 0) := "1000";
constant s5: std_logic_vector(3 downto 0) := "1101";
signal state : std_logic_vector(3 downto 0);
begin
-- ---------------------------
divider: process(rb_i, clk_i,en_i)
	begin
	if(rb_i='0') then state <= s0;
	elsif(rising_edge(clk_i))
	 then
	  case state is
	   when s0 => if(en_i='1') then state<=s1; end if;
	   when s1 => if(en_i='1') then state<=s2; end if;
	   when s2 => if(en_i='1') then state<=s3; end if;
	   when s3 => if(en_i='1') then state<=s4; end if;
	   when s4 => if(en_i='1') then state<=s5; end if;
	   when s5 => if(en_i='1') then state<=s0; end if;
	   when others => state <=s0;
        end case; --end the case
	end if; --end the clock if
end process divider; 
-- -----------------------
c_o <= (state(3)) and (state(2)) and not(state(1)) and (state(0)) and en_i;

end div6_a;

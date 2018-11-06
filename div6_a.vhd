architecture div6_a of div6_e is

CONSTANT s0: STD_LOGIC_VECTOR(3 downto 0) := "0000"; 
CONSTANT s1: STD_LOGIC_VECTOR(3 downto 0) := "0001"; 
CONSTANT s2: STD_LOGIC_VECTOR(3 downto 0) := "0010"; 
CONSTANT s3: STD_LOGIC_VECTOR(3 downto 0) := "1011"; 
CONSTANT s4: std_logic_vector(3 downto 0) := "1000";
constant s5: std_logic_vector(3 downto 0) := "1101";
SIGNAL state : STD_LOGIC_VECTOR(3 downto 0);
begin
-- ---------------------------
divider: PROCESS(rb_i, clk_i,en_i)
	BEGIN
	IF(rb_i='0') THEN state <= s0;
	ELSIF(rising_edge(clk_i))
	 THEN
	  CASE state IS
	   WHEN s0 => IF(en_i='1') THEN state<=s1; END IF;
	   WHEN s1 => IF(en_i='1') THEN state<=s2; END IF;
	   WHEN s2 => IF(en_i='1') THEN state<=s3; END IF;
	   WHEN s3 => IF(en_i='1') THEN state<=s4; END IF;
	   when s4 => if(en_i='1') then state<=s5; end if;
	   when s5 => if(en_i='1') then state<=s0; end if;
	   WHEN OTHERS => state <=s0;
        END CASE; --end the case
	END IF; --end the clock if
END PROCESS divider; 
-- -----------------------
c_o <= (state(3)) AND (state(2)) AND NOT(state(1)) AND (state(0)) AND en_i;

end div6_a;

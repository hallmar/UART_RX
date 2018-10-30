architecture div4_a of div4_e is

CONSTANT s0: STD_LOGIC_VECTOR(3 downto 0) := "0000"; 
CONSTANT s1: STD_LOGIC_VECTOR(3 downto 0) := "0001"; 
CONSTANT s2: STD_LOGIC_VECTOR(3 downto 0) := "1010"; 
CONSTANT s3: STD_LOGIC_VECTOR(3 downto 0) := "1011"; 
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
	   WHEN s3 => IF(en_i='1') THEN state<=s0; END IF;
	   WHEN OTHERS => state <=s0;
        END CASE; --end the case
	END IF; --end the clock if
END PROCESS divider; 
-- -----------------------
c_o <= (state(3)) AND NOT(state(2)) AND (state(1)) AND (state(0)) AND en_i;

end div4_a;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY div6_tb IS
END div6_tb;
 
ARCHITECTURE behavior OF div6_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div6_e
    PORT(
         en_i : IN  std_logic;
         clk_i : IN  std_logic;
         rb_i : IN  std_logic;
         c_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal en_i : std_logic;
   signal clk_i : std_logic;
   signal rb_i : std_logic;
	--Output
   signal c_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div6_e PORT MAP (
          en_i => en_i,
          clk_i => clk_i,
          rb_i => rb_i,
          c_o => c_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		rb_i <= '0';
		en_i <= '1';
		wait for 20 ns;
		rb_i <= '1';
		en_i <= '1';
		wait for 100 ns;
		en_i <= '0';
		wait for 100 ns;
		assert(false) severity failure;

		

      -- insert stimulus here 

      wait;
   end process;

END;

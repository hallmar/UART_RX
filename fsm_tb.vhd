
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY fsm_tb IS
END fsm_tb;
 
ARCHITECTURE behavior OF fsm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fsm_e
    PORT(
         RX_i : IN  std_logic;
         clk_i : IN  std_logic;
         compare_o : OUT  std_logic;
         rb_i : IN  std_logic;
         sren_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RX_i : std_logic := '1';
   signal clk_i : std_logic := '0';
   signal rb_i : std_logic;
	

 	--Outputs
   signal compare_o : std_logic;
   signal sren_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fsm_e PORT MAP (
          RX_i => RX_i,
          clk_i => clk_i,
          compare_o => compare_o,
          rb_i => rb_i,
          sren_o => sren_o
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
      wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		
	   wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		
	   wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 520 us;
		RX_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		wait for 104 us;
		RX_i <= '1';
		wait for 208 us;
		wait for 100 us;
		assert(false) severity failure;
      -- insert stimulus here 

      wait;
   end process;

END;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY div25meg_tb IS
END div25meg_tb;
 
ARCHITECTURE behavior OF div25meg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div25meg_e
    PORT(
         clk_i : IN  std_logic;
         div_o : OUT  std_logic;
         rb_i : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rb_i : std_logic;

 	--Outputs
   signal div_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div25meg_e PORT MAP (
          clk_i => clk_i,
          div_o => div_o,
          rb_i => rb_i
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
      wait for 100 ns;
		rb_i <= '1';
		wait for 1000 ms;
		assert(false) severity failure;

      -- insert stimulus here 

      wait;
   end process;

END;

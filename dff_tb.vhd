
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY dff_tb IS
END dff_tb;
 
ARCHITECTURE behavior OF dff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dff_e
    PORT(
         d_i : IN  std_logic;
         clk_i : IN  std_logic;
         rb_i : IN  std_logic;
         en_i : IN  std_logic;
         q_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d_i : std_logic := '0';
   signal clk_i : std_logic := '0';
   signal rb_i : std_logic := '1';
   signal en_i : std_logic := '0';

 	--Outputs
   signal q_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dff_e PORT MAP (
          d_i => d_i,
          clk_i => clk_i,
          rb_i => rb_i,
          en_i => en_i,
          q_o => q_o
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
		wait for 10 ns; --hold an 'uncertain' state for 10ns
	   rb_i <= '0';
      -- hold reset state for 10 ns.
      wait for 20 ns;
		rb_i <= '1';
		d_i <= '0';
		en_i <= '0';
      wait for 20 ns;
		d_i <= '1';
		en_i <= '0';
		wait for 20 ns;
		d_i <= '0';
		en_i <= '1';
		wait for 20 ns;
		d_i <= '1';
		en_i <= '1';
		wait for 10 ns;
		assert(false) severity failure;
		
      -- insert stimulus here 

      wait;
   end process;

END;

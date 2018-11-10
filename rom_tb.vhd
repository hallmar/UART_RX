
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rom_tb IS
END rom_tb;
 
ARCHITECTURE behavior OF rom_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rom_e
    PORT(
         char_o : OUT  std_logic_vector(7 downto 0);
         clk_i : IN  std_logic;
         en_i : IN  std_logic;
         pass_sel : IN  std_logic_vector(1 downto 0);
         rb_i : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal en_i : std_logic := '0';
   signal pass_sel : std_logic_vector(1 downto 0) := (others => '0');
   signal rb_i : std_logic;

 	--Outputs
   signal char_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rom_e PORT MAP (
          char_o => char_o,
          clk_i => clk_i,
          en_i => en_i,
          pass_sel => pass_sel,
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
      wait for 200 ns;	
		rb_i <= '0';
		wait for 190 ns;
		
		rb_i <= '1';
		en_i <= '1';
		wait for 140 ns;
		
		en_i <= '0';
		pass_sel <= "01";
		wait for 20 ns;
		en_i <= '1';
		wait for 140 ns;
		
		en_i <= '0';
		pass_sel <= "10";
		wait for 20 ns;
		en_i <= '1';
		wait for 140 ns;

		en_i <= '0';
		pass_sel <= "11";
		wait for 20 ns;
		en_i <= '1';
		wait for 140 ns;
		en_i <= '0';
		wait for 140 ns;
		assert(false) severity failure;
		

      -- insert stimulus here 

      wait;
   end process;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightcomp_tb IS
END eightcomp_tb;
 
ARCHITECTURE behavior OF eightcomp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT eightcomp_e
    PORT(
         a_i : IN  std_logic_vector(7 downto 0);
         b_i : IN  std_logic_vector(7 downto 0);
         en_i : IN  std_logic;
         y_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a_i : std_logic_vector(7 downto 0) := (others => '0');
   signal b_i : std_logic_vector(7 downto 0) := (others => '0');
   signal en_i : std_logic := '0';

 	--Outputs
   signal y_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: eightcomp_e PORT MAP (
          a_i => a_i,
          b_i => b_i,
          en_i => en_i,
          y_o => y_o
        );
 
   -- Stimulus process
   stim_proc: process
   begin	
		en_i <= '0';
      a_i <= "01010011";
		b_i <= "01011011";
      wait for 100 ns;	
		en_i <= '1';
      wait for 100 ns;
		b_i <= "01010011";
		wait for 100 ns;
		en_i <= '0';
		wait for 100 ns;
	   assert(false) severity failure;

      wait;
   end process;

END;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY pargen_tb IS
END pargen_tb;
 
ARCHITECTURE behavior OF pargen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pargen_e
    PORT(
         data_i : IN  std_logic_vector(7 downto 0);
         paritycheck_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data_i : std_logic_vector(7 downto 0);

 	--Outputs
   signal paritycheck_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pargen_e PORT MAP (
          data_i => data_i,
          paritycheck_o => paritycheck_o
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		data_i <= "01100110";
		wait for 10 ns;
		data_i <= "01110110";
		wait for 10 ns;
		assert(false) severity failure;


      -- insert stimulus here 

      wait;
   end process;

END;

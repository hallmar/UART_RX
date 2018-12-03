
library ieee;
use ieee.std_logic_1164.all;
 
entity pargen_tb is
end pargen_tb;
 
architecture behavior of pargen_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component pargen_e
    port(
         data_i : in  std_logic_vector(7 downto 0);
         paritycheck_o : out  std_logic
        );
    end component;
    

   --inputs
   signal data_s : std_logic_vector(7 downto 0);

 	--outputs
   signal paritycheck_s : std_logic;
   -- no clocks detected in port list. replace <clock> below with 
   -- appropriate port name 
 
 
begin
 
	-- instantiate the unit under test (uut)
   uut: pargen_e port map (
          data_i => data_s,
          paritycheck_o => paritycheck_s
        );

   -- clock process definitions

 

   -- stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		data_s <= "01100110";
		wait for 10 ns;
		data_s <= "01110110";
		wait for 10 ns;
		assert(false) severity failure;


      -- insert stimulus here 

      wait;
   end process;

end;

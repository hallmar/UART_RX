
library ieee;
use ieee.std_logic_1164.all;

entity eightcomp_tb is
end eightcomp_tb;
 
architecture behavior of eightcomp_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component eightcomp_e
    port(
         a_i : in  std_logic_vector(7 downto 0);
         b_i : in  std_logic_vector(7 downto 0);
         en_i : in  std_logic;
         y_o : out  std_logic
        );
    end component;
    

   --inputs
   signal a_i : std_logic_vector(7 downto 0) := (others => '0');
   signal b_i : std_logic_vector(7 downto 0) := (others => '0');
   signal en_i : std_logic := '0';

 	--outputs
   signal y_o : std_logic;
   -- no clocks detected in port list. replace <clock> below with 
   -- appropriate port name 
 

 
begin
 
	-- instantiate the unit under test (uut)
   uut: eightcomp_e port map (
          a_i => a_i,
          b_i => b_i,
          en_i => en_i,
          y_o => y_o
        );
 
   -- stimulus process
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

end;

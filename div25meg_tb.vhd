
library ieee;
use ieee.std_logic_1164.all;
 
entity div25meg_tb is
end div25meg_tb;
 
architecture behavior of div25meg_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component div25meg_e
    port(
         clk_i : in  std_logic;
         div_o : out  std_logic;
         rb_i : in  std_logic
        );
    end component;
    

   --inputs
   signal clk_i : std_logic := '0';
   signal rb_i : std_logic;

 	--outputs
   signal div_o : std_logic;

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: div25meg_e port map (
          clk_i => clk_i,
          div_o => div_o,
          rb_i => rb_i
        );

   -- clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- stimulus process
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

end;

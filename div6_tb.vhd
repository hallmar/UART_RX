
library ieee;
use ieee.std_logic_1164.all;

 
entity div6_tb is
end div6_tb;
 
architecture behavior of div6_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component div6_e
    port(
         en_i : in  std_logic;
         clk_i : in  std_logic;
         rb_i : in  std_logic;
         c_o : out  std_logic
        );
    end component;
    

   --inputs
   signal en_i : std_logic;
   signal clk_i : std_logic;
   signal rb_i : std_logic;
	--output
   signal c_o : std_logic;

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: div6_e port map (
          en_i => en_i,
          clk_i => clk_i,
          rb_i => rb_i,
          c_o => c_o
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

end;

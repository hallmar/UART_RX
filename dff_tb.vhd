
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
 

 
entity dff_tb is
end dff_tb;
 
architecture behavior of dff_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component dff_e
    port(
         d_i : in  std_logic;
         clk_i : in  std_logic;
         rb_i : in  std_logic;
         en_i : in  std_logic;
         q_o : out  std_logic
        );
    end component;
    

   --inputs
   signal d_s : std_logic := '0';
   signal clk_s : std_logic := '0';
   signal rb_s : std_logic := '1';
   signal en_s : std_logic := '0';

 	--outputs
   signal q_o : std_logic;

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: dff_e port map (
          d_i => d_s,
          clk_i => clk_s,
          rb_i => rb_s,
          en_i => en_s,
          q_o => q_o
        );

   -- clock process definitions
   clk_i_process :process
   begin
		clk_s <= '0';
		wait for clk_i_period/2;
		clk_s <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- stimulus process
   stim_proc: process
   begin		
		wait for 10 ns; --hold an 'uncertain' state for 10ns
	   rb_s <= '0';
      -- hold reset state for 10 ns.
      wait for 20 ns;
		rb_s <= '1';
		d_s <= '0';
		en_s <= '0';
      wait for 20 ns;
		d_s <= '1';
		en_s <= '0';
		wait for 20 ns;
		d_s <= '0';
		en_s <= '1';
		wait for 20 ns;
		d_s <= '1';
		en_s <= '1';
		wait for 10 ns;
		assert(false) severity failure;
		
      -- insert stimulus here 

      wait;
   end process;

end;

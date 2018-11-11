
library ieee;
use ieee.std_logic_1164.all;

 
entity fsm_tb is
end fsm_tb;
 
architecture behavior of fsm_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component fsm_e
    port(
         rx_i : in  std_logic;
         clk_i : in  std_logic;
         compare_o : out  std_logic;
         rb_i : in  std_logic;
         sren_o : out  std_logic
        );
    end component;
    

   --inputs
   signal rx_i : std_logic := '1';
   signal clk_i : std_logic := '0';
   signal rb_i : std_logic;
	

 	--outputs
   signal compare_o : std_logic;
   signal sren_o : std_logic;

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: fsm_e port map (
          rx_i => rx_i,
          clk_i => clk_i,
          compare_o => compare_o,
          rb_i => rb_i,
          sren_o => sren_o
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
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		
		wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		
	   wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		
	   wait for 100 ns;	
		rb_i <= '0';
		wait for 190 ns;
		rb_i <= '1';
		wait for  104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 520 us;
		rx_i <= '1';
		wait for 104 us;
		rx_i <= '0';
		wait for 104 us;
		rx_i <= '1';
		wait for 208 us;
		wait for 100 us;
		assert(false) severity failure;
      -- insert stimulus here 

      wait;
   end process;

end;


library ieee;
use ieee.std_logic_1164.all;

 
entity shiftreg_tb is
end shiftreg_tb;
 
architecture behavior of shiftreg_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component shiftreg_e
    port(
         rx_i : in  std_logic;
         clk_i : in  std_logic;
         data_o : out  std_logic_vector(7 downto 0);
         en_i : in  std_logic;
         paritydata_o : out  std_logic;
         rb_i : in  std_logic
        );
    end component;
    

   --inputs
   signal rx_i : std_logic := '0';
   signal clk_i : std_logic := '0';
   signal en_i : std_logic := '0';
   signal rb_i : std_logic;

 	--outputs
   signal data_o : std_logic_vector(7 downto 0);
   signal paritydata_o : std_logic;

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: shiftreg_e port map (
          rx_i => rx_i,
          clk_i => clk_i,
          data_o => data_o,
          en_i => en_i,
          paritydata_o => paritydata_o,
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
      wait for 200 ns;	
		rb_i <= '0'; -- reset
		
		wait for 190 ns;
		rb_i <= '1';
		rx_i <= '1';
		en_i <= '0';
		
		--first bit
		wait for 20 ns;
		rx_i <= '1';
		en_i <= '1';
		wait for 20 ns;
		en_i <= '0';
		rx_i <= '0';
		--second bit
		wait for 200 ns;
		rx_i <= '0';
		en_i <= '1';
		wait for 20 ns;
		en_i <= '0';
		rx_i <= '1';
		--third bit
		wait for 200 ns;
		rx_i <= '1';
		en_i <= '1';
		wait for 20 ns;
		rx_i <= '0';
		en_i <= '0';
		--fourth bit
		wait for 200 ns;
		rx_i <= '0';
		en_i <= '1';
		wait for 20 ns;
		en_i <= '0';
		rx_i <= '1';
		--fith bit
		wait for 200 ns;
		rx_i <= '1';
		en_i <= '1';
		wait for 20 ns;
		rx_i <= '0';
		en_i <= '0';
		--sixth bit
		wait for 200 ns;
		rx_i <= '1';
		en_i <= '1';
		wait for 20 ns;
		rx_i <= '0';
		en_i <= '0';
		--seventh bit
		wait for 200 ns;
		rx_i <= '0';
		en_i <= '1';
		wait for 20 ns;
		rx_i <= '1';
		en_i <= '0';
		--eighth bit
		wait for 200 ns;
		rx_i <= '1';
		en_i <= '1';
		wait for 20 ns;
		rx_i <= '0';
		en_i <= '0';
		--ninth bit
		wait for 200 ns;
		rx_i <= '0';
		en_i <= '1';
		wait for 20 ns;
		en_i <= '0';
		wait for 100 ns;
		assert(false) severity failure;

      wait;
   end process;

end;

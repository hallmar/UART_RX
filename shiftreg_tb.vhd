
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
   signal rx_s : std_logic := '0';
   signal clk_s : std_logic := '0';
   signal en_s : std_logic := '0';
   signal rb_s : std_logic;

 	--outputs
   signal data_s : std_logic_vector(7 downto 0);
   signal paritydata_s : std_logic;

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: shiftreg_e port map (
          rx_i => rx_s,
          clk_i => clk_s,
          data_o => data_s,
          en_i => en_s,
          paritydata_o => paritydata_s,
          rb_i => rb_s
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
      -- hold reset state for 100 ns.
      wait for 200 ns;	
		rb_s <= '0'; -- reset
		
		wait for 190 ns;
		rb_s <= '1';
		rx_s <= '1';
		en_s <= '0';
		
		--first bit
		wait for 20 ns;
		rx_s <= '1';
		en_s <= '1';
		wait for 20 ns;
		en_s <= '0';
		rx_s <= '0';
		--second bit
		wait for 200 ns;
		rx_s <= '0';
		en_s <= '1';
		wait for 20 ns;
		en_s <= '0';
		rx_s <= '1';
		--third bit
		wait for 200 ns;
		rx_s <= '1';
		en_s <= '1';
		wait for 20 ns;
		rx_s <= '0';
		en_s <= '0';
		--fourth bit
		wait for 200 ns;
		rx_s <= '0';
		en_s <= '1';
		wait for 20 ns;
		en_s <= '0';
		rx_s <= '1';
		--fith bit
		wait for 200 ns;
		rx_s <= '1';
		en_s <= '1';
		wait for 20 ns;
		rx_s <= '0';
		en_s <= '0';
		--sixth bit
		wait for 200 ns;
		rx_s <= '1';
		en_s <= '1';
		wait for 20 ns;
		rx_s <= '0';
		en_s <= '0';
		--seventh bit
		wait for 200 ns;
		rx_s <= '0';
		en_s <= '1';
		wait for 20 ns;
		rx_s <= '1';
		en_s <= '0';
		--eighth bit
		wait for 200 ns;
		rx_s <= '1';
		en_s <= '1';
		wait for 20 ns;
		rx_s <= '0';
		en_s <= '0';
		--ninth bit
		wait for 200 ns;
		rx_s <= '0';
		en_s <= '1';
		wait for 20 ns;
		en_s <= '0';
		wait for 100 ns;
		assert(false) severity failure;

      wait;
   end process;

end;

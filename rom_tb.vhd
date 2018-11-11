
library ieee;
use ieee.std_logic_1164.all;

entity rom_tb is
end rom_tb;
 
architecture behavior of rom_tb is 
 
    -- component declaration for the unit under test (uut)
 
    component rom_e
    port(
         char_o : out  std_logic_vector(7 downto 0);
         clk_i : in  std_logic;
         en_i : in  std_logic;
         pass_sel : in  std_logic_vector(1 downto 0);
         rb_i : in  std_logic
        );
    end component;
    

   --inputs
   signal clk_i : std_logic := '0';
   signal en_i : std_logic := '0';
   signal pass_sel : std_logic_vector(1 downto 0) := (others => '0');
   signal rb_i : std_logic;

 	--outputs
   signal char_o : std_logic_vector(7 downto 0);

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: rom_e port map (
          char_o => char_o,
          clk_i => clk_i,
          en_i => en_i,
          pass_sel => pass_sel,
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
		rb_i <= '0';
		wait for 190 ns;
		
		rb_i <= '1';
		en_i <= '1';
		wait for 140 ns;
		rb_i <= '0';
		en_i <= '0';
		pass_sel <= "01";
		wait for 20 ns;
		rb_i <= '1';
		en_i <= '1';
		wait for 140 ns;
		
		en_i <= '0';
		pass_sel <= "10";
		wait for 20 ns;
		en_i <= '1';
		wait for 140 ns;

		en_i <= '0';
		pass_sel <= "11";
		wait for 20 ns;
		en_i <= '1';
		wait for 140 ns;
		en_i <= '0';
		wait for 140 ns;
		assert(false) severity failure;
		

      -- insert stimulus here 

      wait;
   end process;

end;

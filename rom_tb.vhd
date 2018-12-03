
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
         pass_sel_i : in  std_logic_vector(1 downto 0);
         rb_i : in  std_logic
        );
    end component;
    

   --inputs
   signal clk_s : std_logic := '0';
   signal en_s : std_logic := '0';
   signal pass_sel_s : std_logic_vector(1 downto 0) := (others => '0');
   signal rb_s : std_logic;

 	--outputs
   signal char_s : std_logic_vector(7 downto 0);

   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: rom_e port map (
          char_o => char_s,
          clk_i => clk_s,
          en_i => en_s,
          pass_sel_i => pass_sel_s,
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
		rb_s <= '0';
		wait for 190 ns;
		
		rb_s <= '1';
		en_s <= '1';
		wait for 140 ns;
		rb_s <= '0';
		en_s <= '0';
		pass_sel_s <= "01";
		wait for 20 ns;
		rb_s <= '1';
		en_s <= '1';
		wait for 140 ns;
		
		en_s <= '0';
		pass_sel_s <= "10";
		wait for 20 ns;
		en_s <= '1';
		wait for 140 ns;

		en_s <= '0';
		pass_sel_s <= "11";
		wait for 20 ns;
		en_s <= '1';
		wait for 140 ns;
		en_s <= '0';
		wait for 140 ns;
		assert(false) severity failure;
		

      -- insert stimulus here 

      wait;
   end process;

end;

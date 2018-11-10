LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 

ENTITY UARTrx_tb IS
END UARTrx_tb;
 
ARCHITECTURE behavior OF UARTrx_tb IS 
 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UARTrx_e
    PORT(
         RX_i : IN  std_logic;
         clk_i : IN  std_logic;
         heartb_o : OUT  std_logic;
         parity_o : OUT  std_logic;
         pass_o : OUT  std_logic;
         pass_sel : IN  std_logic_vector(1 downto 0);
         rb_i : IN  std_logic
        );
    END COMPONENT;
    
	CONSTANT a: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(65, 8)); 
	CONSTANT b: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(66, 8)); 
	CONSTANT c: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(67, 8)); 
	CONSTANT d: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(68, 8)); 
	CONSTANT e: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(69, 8)); 
	CONSTANT f: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(70, 8)); 
	CONSTANT g: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(71, 8)); 
	CONSTANT h: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(72, 8));
	CONSTANT i: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(73, 8));  
	CONSTANT j: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(74, 8)); 
	CONSTANT k: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(75, 8)); 
	CONSTANT l: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(76, 8));
	CONSTANT m: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(77, 8)); 
	CONSTANT n: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(78, 8)); 
	CONSTANT o: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(79, 8));
	CONSTANT p: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(80, 8)); 
	CONSTANT q: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(81, 8));
	CONSTANT r: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(82, 8));
	CONSTANT s: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(83, 8));
	CONSTANT t: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(84, 8));     
	CONSTANT u: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(85, 8)); 

	CONSTANT sp: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(32, 8));  --space
	CONSTANT cr: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(13, 8)); --carriage return
	CONSTANT lf: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(10, 8)); --line feed
	CONSTANT nu: STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(00, 8));  --null
   --Inputs
   signal RX_i : std_logic := '1';
   signal clk_i : std_logic := '0';
   signal pass_sel : std_logic_vector(1 downto 0) := (others => '0');
   signal rb_i : std_logic;
	signal data_s: std_logic_vector(8 downto 0);
	
 	--Outputs
   signal heartb_o : std_logic;
   signal parity_o : std_logic;
   signal pass_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UARTrx_e PORT MAP (
          RX_i => RX_i,
          clk_i => clk_i,
          heartb_o => heartb_o,
          parity_o => parity_o,
          pass_o => pass_o,
          pass_sel => pass_sel,
          rb_i => rb_i
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	----------password 1--------------	
	--first character
		data_s(7 downto 0) <= a;
		data_s(8) <= '0';	
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rb_i <= '0';
		wait for 100 ns;
		rb_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	--second character
		data_s(7 downto 0) <= b;
		data_s(8) <= '0'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';

	--third character
		data_s(7 downto 0) <= c;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	   --fourth character
		data_s(7 downto 0) <= d;
		data_s(8) <= '0'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	   --fifth character
		data_s(7 downto 0) <= cr;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
		--sixth character
		data_s(7 downto 0) <= lf;
		data_s(8) <= '0'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
----------password 1 with wrong parity--------------	
		--first character
		data_s(7 downto 0) <= a;
		data_s(8) <= '0';
		 wait for 100 ns;	
		rb_i <= '0';
		wait for 100 ns;
		rb_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	--second character
		data_s(7 downto 0) <= b;
		data_s(8) <= '0'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';

	--third character
		data_s(7 downto 0) <= c;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	   --fourth character
		data_s(7 downto 0) <= d;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	   --fifth character
		data_s(7 downto 0) <= cr;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
		--sixth character
		data_s(7 downto 0) <= lf;
		data_s(8) <= '0'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
	  
	  ----------password 1 with wrong password--------------	
		--first character
		data_s(7 downto 0) <= a;
		data_s(8) <= '0';
		 wait for 100 ns;	
		rb_i <= '0';
		wait for 100 ns;
		rb_i <= '1';
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	--second character
		data_s(7 downto 0) <= b;
		data_s(8) <= '0'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';

	--third character
		data_s(7 downto 0) <= c;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	   --fourth character
		data_s(7 downto 0) <= e;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
	   --fifth character
		data_s(7 downto 0) <= cr;
		data_s(8) <= '1'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		
		--sixth character
		data_s(7 downto 0) <= lf;
		data_s(8) <= '0'; --parity bit	
      -- hold reset state for 100 ns.
		wait for 104 us;
		RX_i <= '0';
		for I in 0 to 8 loop
			wait for 104 us;
			RX_i <= data_s(I);
		end loop;
		wait for 104 us;
		RX_i <= '1';
		wait for 104 us;
		
		assert(false) severity failure;
   end process;

END;

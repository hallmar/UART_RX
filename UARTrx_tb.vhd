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
    
	CONSTANT a: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(65, 9)); 
	CONSTANT b: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(66, 9)); 
	CONSTANT c: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(67+256,9)); 
	CONSTANT d: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(68 ,9)); 
	CONSTANT e: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(69+256,9)); 
	CONSTANT f: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(70+256,9)); 
	CONSTANT g: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(71,9)); 
	CONSTANT h: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(72,9));
	CONSTANT i: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(73+256,9));  
	CONSTANT j: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(74+256,9)); 
	CONSTANT k: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(75,9)); 
	CONSTANT l: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(76+256,9));
	CONSTANT m: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(77,9)); 
	CONSTANT n: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(78,9)); 
	CONSTANT o: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(79+256,9));
	CONSTANT p: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(80,9)); 
	CONSTANT q: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(81+256,9));
	CONSTANT r: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(82+256,9));
	CONSTANT s: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(83,9));
	CONSTANT t: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(84+256,9));     
	CONSTANT u: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(85,9)); 

	CONSTANT sp: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(32,9));  --space
	CONSTANT cr: std_logic_vector(8 downto 0) := "100001101"; --carriage return
	CONSTANT lf: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(10,9)); --line feed
	CONSTANT nu: STD_LOGIC_VECTOR(8 downto 0) := std_logic_vector(to_unsigned(00,9));  --null
   --Inputs
   signal RX_i : std_logic := '1';
   signal clk_i : std_logic := '0';
   signal pass_sel : std_logic_vector(1 downto 0) := (others => '0');
   signal rb_i : std_logic;
	type fourdim is array (5 downto 0) of std_logic_vector(65 downto 0);
	signal data_all : fourdim;
 	--Outputs
   signal heartb_o : std_logic;
   signal parity_o : std_logic;
   signal pass_o : std_logic;
	signal sample_s: std_logic;
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
	for i in 0 to 5 loop
		data_all(i)(0) <= '0';--start
		data_all(i)(10) <= '1';--stop
		data_all(i)(11) <= '0';--start
		data_all(i)(21) <= '1';--stop
		data_all(i)(22) <= '0';--start
		data_all(i)(32) <= '1';--stop
		data_all(i)(33) <= '0';--start
		data_all(i)(43) <= '1';--stop
		data_all(i)(44) <= '0'; --start
		data_all(i)(54) <= '1'; --stop
		data_all(i)(55) <='0';--start
		data_all(i)(65) <= '1';--stop
	end loop;
	--password 1
	data_all(0)(9 downto 1) <= a;
	data_all(0)(20 downto 12) <= b;
	data_all(0)(31 downto 23) <= c;
	data_all(0)(42 downto 34) <= d;
	data_all(0)(53 downto 45) <= cr;
	data_all(0)(64 downto 56) <= lf;
	--password 2
	data_all(1)(9 downto 1) <= e;
	data_all(1)(20 downto 12) <= f;
	data_all(1)(31 downto 23) <= g;
	data_all(1)(42 downto 34) <= h;
	data_all(1)(53 downto 45) <= cr;
	data_all(1)(64 downto 56) <= lf;
	--password 3
	data_all(2)(9 downto 1) <= i;
	data_all(2)(20 downto 12) <= j;
	data_all(2)(31 downto 23) <= k;
	data_all(2)(42 downto 34) <= l;
	data_all(2)(53 downto 45) <= cr;
	data_all(2)(64 downto 56) <= lf;
	--password 4
	data_all(3)(9 downto 1) <= m;
	data_all(3)(20 downto 12) <= n;
	data_all(3)(31 downto 23) <= o;
	data_all(3)(42 downto 34) <= p;
	data_all(3)(53 downto 45) <= cr;
	data_all(3)(64 downto 56) <= lf;

	--wrong parity
	data_all(4)(9 downto 1) <= m;
	data_all(4)(20 downto 12) <= n;
	data_all(4)(20) <= '1'; --insert wrong parity bit for n
	data_all(4)(31 downto 23) <= o;
	data_all(4)(42 downto 34) <= p;
	data_all(4)(53 downto 45) <= cr;
	data_all(4)(64 downto 56) <= lf;
	
	--wrong password 
   data_all(5)(9 downto 1) <= m;
	data_all(5)(20 downto 12) <= n;
	data_all(5)(20) <= '0';
	data_all(5)(31 downto 23) <= r;
	data_all(5)(42 downto 34) <= p;
	data_all(5)(53 downto 45) <= cr;
	data_all(5)(64 downto 56) <= lf;


	
	------------------------------------------------------------
	----------password 1--------------	
	------------------------------------------------------------
	--first character
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rb_i <= '0';
		wait for 100 ns;
		rb_i <= '1';
		for J in 0 to 5 loop
		
			case j is
				when 0 =>
					pass_sel <= "00";
				when 1 =>
					pass_sel <= "01";
				when 2 =>
					pass_sel <= "10";
				when 3 =>
					pass_sel <= "11";
				when 4 =>
					pass_sel <= "11";
				when 5 =>
					pass_sel <= "11";
				when others =>
					pass_sel <= "00";
			end case;
			
			for I in 0 to 65 loop
			wait for 52 us;
			wait for 52 us;
				RX_i <= data_all(J)(I);
			end loop;
				wait for 10 ns;
					sample_s <= '1';
				wait for 10 ns;
					sample_s <= '0';
			wait for 104 us;
			rb_i <= '0';
			wait for 104 us;
			rb_i <= '1';
		end loop;
		wait for 100 us;
		assert(false) severity failure;
   end process;

END;

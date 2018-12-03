library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ascii_char.all;

entity uartrx_tb is
end uartrx_tb;
 
architecture behavior of uartrx_tb is 
 
 
    -- component declaration for the unit under test (uut)
 
    component uartrx_e
    port(
         rx_i : in  std_logic;
         clk_i : in  std_logic;
         heartb_o : out  std_logic;
         parity_o : out  std_logic;
         pass_o : out  std_logic;
         pass_sel_i : in  std_logic_vector(1 downto 0);
         rb_i : in  std_logic
        );
    end component;
    

   --inputs
   signal rx_s : std_logic := '1';
   signal clk_s : std_logic := '0';
   signal pass_sel_s : std_logic_vector(1 downto 0) := (others => '0');
   signal rb_s : std_logic;
	type fourdim is array (5 downto 0) of std_logic_vector(65 downto 0);
	signal data_all_s : fourdim;
 	--outputs
   signal heartb_s : std_logic;
   signal parity_s : std_logic;
   signal pass_s : std_logic;
	signal sample_s: std_logic;
   -- clock period definitions
   constant clk_i_period : time := 20 ns;
 
begin
 
	-- instantiate the unit under test (uut)
   uut: uartrx_e port map (
          rx_i => rx_s,
          clk_i => clk_s,
          heartb_o => heartb_s,
          parity_o => parity_s,
          pass_o => pass_s,
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
	for i in 0 to 5 loop
		data_all_s(i)(0) <= '0';--start
		data_all_s(i)(10) <= '1';--stop
		data_all_s(i)(11) <= '0';--start
		data_all_s(i)(21) <= '1';--stop
		data_all_s(i)(22) <= '0';--start
		data_all_s(i)(32) <= '1';--stop
		data_all_s(i)(33) <= '0';--start
		data_all_s(i)(43) <= '1';--stop
		data_all_s(i)(44) <= '0'; --start
		data_all_s(i)(54) <= '1'; --stop
		data_all_s(i)(55) <='0';--start
		data_all_s(i)(65) <= '1';--stop
	end loop;
	--password 1
	data_all_s(0)(9 downto 1) <= ep_a;
	data_all_s(0)(20 downto 12) <= ep_b;
	data_all_s(0)(31 downto 23) <= ep_c;
	data_all_s(0)(42 downto 34) <= ep_d;
	data_all_s(0)(53 downto 45) <= ep_cr;
	data_all_s(0)(64 downto 56) <= ep_lf;
	--password 2
	data_all_s(1)(9 downto 1) <= ep_e;
	data_all_s(1)(20 downto 12) <= ep_f;
	data_all_s(1)(31 downto 23) <= ep_g;
	data_all_s(1)(42 downto 34) <= ep_h;
	data_all_s(1)(53 downto 45) <= ep_cr;
	data_all_s(1)(64 downto 56) <= ep_lf;
	--password 3
	data_all_s(2)(9 downto 1) <= ep_i;
	data_all_s(2)(20 downto 12) <= ep_j;
	data_all_s(2)(31 downto 23) <= ep_k;
	data_all_s(2)(42 downto 34) <= ep_l;
	data_all_s(2)(53 downto 45) <= ep_cr;
	data_all_s(2)(64 downto 56) <= ep_lf;
	--password 4
	data_all_s(3)(9 downto 1) <= ep_m;
	data_all_s(3)(20 downto 12) <= ep_n;
	data_all_s(3)(31 downto 23) <= ep_o;
	data_all_s(3)(42 downto 34) <= ep_p;
	data_all_s(3)(53 downto 45) <= ep_cr;
	data_all_s(3)(64 downto 56) <= ep_lf;

	--wrong parity
	data_all_s(4)(9 downto 1) <= ep_m;
	data_all_s(4)(20 downto 12) <= ep_n;
	data_all_s(4)(20) <= '0'; --insert wrong parity bit for n
	data_all_s(4)(31 downto 23) <= ep_o;
	data_all_s(4)(42 downto 34) <= ep_p;
	data_all_s(4)(53 downto 45) <= ep_cr;
	data_all_s(4)(64 downto 56) <= ep_lf;
	
	--wrong password 
   data_all_s(5)(9 downto 1) <= ep_m;
	data_all_s(5)(20 downto 12) <= ep_n;
	data_all_s(5)(20) <= '1';
	data_all_s(5)(31 downto 23) <= ep_r;
	data_all_s(5)(42 downto 34) <= ep_p;
	data_all_s(5)(53 downto 45) <= ep_cr;
	data_all_s(5)(64 downto 56) <= ep_lf;


	
	------------------------------------------------------------
	----------password 1--------------	
	------------------------------------------------------------
	--first character
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rb_s <= '1';
		wait for 100 ns;
		rb_s <= '0';
		for j in 0 to 5 loop
		
			case j is
				when 0 =>
					pass_sel_s <= "00";
				when 1 =>
					pass_sel_s <= "01";
				when 2 =>
					pass_sel_s <= "10";
				when 3 =>
					pass_sel_s <= "11";
				when 4 =>
					pass_sel_s <= "11";
				when 5 =>
					pass_sel_s <= "11";
				when others =>
					pass_sel_s <= "00";
			end case;
			
			for i in 0 to 65 loop
			wait for 52 us;
			wait for 52 us;
				rx_s <= data_all_s(j)(i);
			end loop;
				wait for 10 ns;
					sample_s <= '1';
				wait for 10 ns;
					sample_s <= '0';
			wait for 104 us;
			rb_s <= '1';
			wait for 104 us;
			rb_s <= '0';
		end loop;
		wait for 100 us;
		assert(false) severity failure;
   end process;

end;

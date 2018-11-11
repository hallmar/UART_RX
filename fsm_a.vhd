architecture fsm_a of fsm_e is
type state is (reset_state, startbit_state ,sample_state ,stopbit_state, cleanup_state);
signal pr_state: state := reset_state;
signal counter_s: integer range 0 to 10417 := 0; --counter for the sample timing
signal bit_index_s: integer range 0 to 8 := 0; --9 bits of data
signal sren_s, compare_s: std_logic := '0';
signal char_index_s: integer range 0 to 5 := 0;

constant baud_count: integer := 5208;
constant halfbaud_count: integer := 2604;
begin

--evaluate states
	process(clk_i, rb_i)
	begin
	if(rb_i = '0') then
		pr_state <= reset_state;
	elsif(rising_edge(clk_i)) then
		case pr_state is
------------------idle/reset state--------------------
			when reset_state =>
				counter_s <= 0;
				bit_index_s <= 0;
				sren_s <= '0';
				compare_s <= '0';
				if(RX_i = '0') then
					pr_state <= startbit_state;
				else
					pr_state <= reset_state;
				end if;
------------------Startbit state--------------------	
			when startbit_state =>
				
				if(counter_s = halfbaud_count-1) then
					if(RX_i = '0') then
						counter_s <= 0;
						pr_state <= sample_state;
					else
						pr_state <= reset_state;
					end if; --rx_i if ends
				else 
					counter_s <= counter_s +1;
					pr_state <= startbit_state;
			   end if; --counter if ends
------------------sample state--------------------				
			when sample_state =>
			sren_s <= '0';
				if(counter_s < baud_count-1) then
					counter_s <= counter_s +1;
					pr_state <= sample_state;
				else
					counter_s <= 0;
					sren_s <= '1'; --enable sampling
					if(bit_index_s < 8) then
						bit_index_s <= bit_index_s +1;
						pr_state <= sample_state;
					else
						bit_index_s <= 0;
						pr_state <= stopbit_state;
				   end if; --bit index if ends
				end if; --counter if ends
------------------Stopbit state--------------------
			when stopbit_state =>
			sren_s <= '0';
				if(counter_s < baud_count-1) then
					counter_s <= counter_s +1;
					pr_state <= stopbit_state;
				else
					compare_s <= '1';
					counter_s <= 0;
					pr_state <= cleanup_state;
				end if;
				
			when cleanup_state =>
				pr_state <= reset_state;
				compare_s <= '0';
	
				if(char_index_s < 5) then
					char_index_s <= char_index_s+1;
				else
					char_index_s <= 0;
				end if;
			when others =>
				pr_state <= reset_state;
				
		end case;
	end if;
	end process;
	

	
--process output
sren_o <= sren_s;
compare_o <= compare_s;



--clock dividers

end architecture fsm_a ; -- of fsm_e


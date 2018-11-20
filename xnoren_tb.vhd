library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xnoren_tb_e is
end entity xnoren_tb_e;

architecture xnoren_tb_a of xnoren_tb_e is 
component as_xnoren_e
	port (
		a_i:in	std_logic;
		b_i:in std_logic;
		en_i:in	std_logic;
		y_o: out std_logic
	);
end component;

signal a_s, b_s, en_s, y_s : std_logic;

begin
	DUT : as_xnoren_e port map (a_s, b_s, en_s, y_s);

process
	begin
		wait for 100 ns;
		a_s <= '0';
		b_s <= '0';
		en_s <= '0';
		wait for 100 ns;
		assert (y_s = '0') report "Test1: Wrong Comparator!" severity note;

		a_s <= '0';
		b_s <= '1';
		en_s <= '0';
		wait for 100 ns;
		assert (y_s = '0') report "Test2: Wrong Comparator!" severity note;

		a_s <= '1';
		b_s <= '0';
		en_s <= '0';
		wait for 100 ns;
		assert (y_s = '0') report "Test3: Wrong Comparator!" severity note;

		a_s <= '1';
		b_s <= '1';
		en_s <= '0';
		wait for 100 ns;
		assert (y_s = '0') report "Test4: Wrong Comparator!" severity note;

		a_s <= '0';
		b_s <= '0';
		en_s <= '1';
		wait for 100 ns;
		assert (y_s = '1') report "Test5: Wrong Comparator!" severity note;

		a_s <= '0';
		b_s <= '1';
		en_s <= '1';
		wait for 100 ns;
		assert (y_s = '0') report "Test6: Wrong Comparator!" severity note;

		a_s <= '1';
		b_s <= '0';
		en_s <= '1';
		wait for 100 ns;
		assert (y_s = '1') report "Test7: Wrong Comparator!" severity note;

		a_s <= '1';
		b_s <= '1';
		en_s <= '1';
		wait for 100 ns;
		assert (y_s = '1') report "Test8: Wrong Comparator!" severity note;

		wait for 100 ns;
		assert (false) report "end of simulation" severity failure;
	end process;
end xnoren_tb_a;




	


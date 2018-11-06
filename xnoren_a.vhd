library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use ieee.numeric_std.all;
    use work.all;	

architecture xonren_a of xnoren_e is
signal y_s: std_logic;
begin
y_s <= a_i xnor b_i;
y_o <= y_s and en_i;

end architecture xonren_a;


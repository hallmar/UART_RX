
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use work.all;	

architecture xnoren_a of xnoren_e is
signal y_s: std_logic;
begin
y_s <= a_i xnor b_i;
y_o <= y_s and en_i;

end architecture xnoren_a;

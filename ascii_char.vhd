
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
package ascii_char is


--------------------------------------
----Numbers
--------------------------------------
--no parity
    constant zero: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(48,8));
    constant one: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(49,8));
    constant two: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(50,8));
    constant three: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(51,8));
    constant four: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(52,8));
    constant five: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(53,8));
    constant six: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(54,8));
    constant seven: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(55,8));
    constant eight: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(56,8));
    constant nine: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(57,8));
--even parity
    constant ep_zero: std_logic_vector(8 downto 0) := "000110000";
    constant ep_one: std_logic_vector(8 downto 0) := "100110001";
    constant ep_two: std_logic_vector(8 downto 0) := "100110010";
    constant ep_three: std_logic_vector(8 downto 0) := "000110011";
    constant ep_four: std_logic_vector(8 downto 0) := "100110100";
    constant ep_five: std_logic_vector(8 downto 0) := "000110101";
    constant ep_six: std_logic_vector(8 downto 0) := "000110110";
    constant ep_seven: std_logic_vector(8 downto 0) := "100110111";
    constant ep_eight: std_logic_vector(8 downto 0) := "100111000";
    constant ep_nine: std_logic_vector(8 downto 0) := "000111001";
---------------------------------------
----uppercase
---------------------------------------
--without parity
    constant upp_a: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(65, 8)); 
    constant upp_b: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(66, 8)); 
    constant upp_c: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(67, 8)); 
    constant upp_d: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(68, 8)); 
    constant upp_e: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(69, 8)); 
    constant upp_f: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(70, 8)); 
    constant upp_g: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(71, 8)); 
    constant upp_h: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(72, 8));
    constant upp_i: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(73, 8));  
    constant upp_j: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(74, 8)); 
    constant upp_k: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(75, 8)); 
    constant upp_l: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(76, 8));
    constant upp_m: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(77, 8)); 
    constant upp_n: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(78, 8)); 
    constant upp_o: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(79, 8));
    constant upp_p: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(80, 8)); 
    constant upp_q: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(81, 8));
    constant upp_r: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(82, 8));
    constant upp_s: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(83, 8));
    constant upp_t: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(84, 8));     
    constant upp_u: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(85, 8)); 
    constant upp_v: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(86, 8));
    constant upp_w: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(87, 8));
    constant upp_x: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(88, 8));     
    constant upp_y: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(89, 8)); 
    constant upp_z: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(90, 8)); 

--With even parity
    constant ep_upp_a: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(65, 9)); 
    constant ep_upp_b: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(66, 9)); 
    constant ep_upp_c: std_logic_vector(8 downto 0) := "101000011"; 
    constant ep_upp_d: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(68 ,9)); 
    constant ep_upp_e: std_logic_vector(8 downto 0) := "101000101"; 
    constant ep_upp_f: std_logic_vector(8 downto 0) := "101000110"; 
    constant ep_upp_g: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(71,9)); 
    constant ep_upp_h: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(72,9));
    constant ep_upp_i: std_logic_vector(8 downto 0) := "101001001";  
    constant ep_upp_j: std_logic_vector(8 downto 0) := "101001010"; 
    constant ep_upp_k: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(75,9)); 
    constant ep_upp_l: std_logic_vector(8 downto 0) := "101001100";
    constant ep_upp_m: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(77,9)); 
    constant ep_upp_n: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(78,9)); 
    constant ep_upp_o: std_logic_vector(8 downto 0) := "101001111";
    constant ep_upp_p: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(80,9)); 
    constant ep_upp_q: std_logic_vector(8 downto 0) := "101010001";
    constant ep_upp_r: std_logic_vector(8 downto 0) := "101010010";
    constant ep_upp_s: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(83,9));
    constant ep_upp_t: std_logic_vector(8 downto 0) := "101010100";     
    constant ep_upp_u: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(85,9)); 
    constant ep_upp_v: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(86,9)); 
    constant ep_upp_w: std_logic_vector(8 downto 0) := "101010111"; 
    constant ep_upp_x: std_logic_vector(8 downto 0) := "101011000"; 
    constant ep_upp_y: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(89,9)); 
    constant ep_upp_z: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(90,9)); 

------------------------------------------------
---Lowercase
------------------------------------------------
--without parity
    constant a: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(97, 8)); 
    constant b: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(98, 8)); 
    constant c: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(99, 8)); 
    constant d: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(100, 8)); 
    constant e: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(101, 8)); 
    constant f: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(102, 8)); 
    constant g: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(103, 8)); 
    constant h: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(104, 8));
    constant i: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(105, 8));  
    constant j: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(106, 8)); 
    constant k: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(107, 8)); 
    constant l: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(108, 8));
    constant m: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(109, 8)); 
    constant n: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(110, 8)); 
    constant o: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(111, 8));
    constant p: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(112, 8)); 
    constant q: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(113, 8));
    constant r: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(114, 8));
    constant s: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(115, 8));
    constant t: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(116, 8));     
    constant u: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(117, 8)); 
    constant v: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(118, 8)); 
    constant w: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(119, 8)); 
    constant x: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(120, 8)); 
    constant y: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(121, 8)); 
    constant z: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(122, 8)); 



--With even parity
	constant ep_a: std_logic_vector(8 downto 0) := "101100001"; 
	constant ep_b: std_logic_vector(8 downto 0) := "101100010"; 
	constant ep_c: std_logic_vector(8 downto 0) := "001100011"; 
	constant ep_d: std_logic_vector(8 downto 0) := "101100100"; 
	constant ep_e: std_logic_vector(8 downto 0) := "001100101"; 
	constant ep_f: std_logic_vector(8 downto 0) := "001100110"; 
	constant ep_g: std_logic_vector(8 downto 0) := "101100111"; 
	constant ep_h: std_logic_vector(8 downto 0) := "101101000";	
	constant ep_i: std_logic_vector(8 downto 0) := "001101001";  
	constant ep_j: std_logic_vector(8 downto 0) := "001101010"; 
	constant ep_k: std_logic_vector(8 downto 0) := "101101011"; 
	constant ep_l: std_logic_vector(8 downto 0) := "001101100";
	constant ep_m: std_logic_vector(8 downto 0) := "101101101"; 
	constant ep_n: std_logic_vector(8 downto 0) := "101101110"; 
	constant ep_o: std_logic_vector(8 downto 0) := "001101111";
	constant ep_p: std_logic_vector(8 downto 0) := "101110000"; 
	constant ep_q: std_logic_vector(8 downto 0) := "001110001";
	constant ep_r: std_logic_vector(8 downto 0) := "001110010";
	constant ep_s: std_logic_vector(8 downto 0) := "101110011";
	constant ep_t: std_logic_vector(8 downto 0) := "001110100";     
	constant ep_u: std_logic_vector(8 downto 0) := "101110101";
	constant ep_v: std_logic_vector(8 downto 0) := "101110110";
	constant ep_w: std_logic_vector(8 downto 0) := "001110111";
	constant ep_x: std_logic_vector(8 downto 0) := "001111000";
	constant ep_y: std_logic_vector(8 downto 0) := "101111001";
	constant ep_z: std_logic_vector(8 downto 0) := "101111010";

---------------------------
---extra ascii char
---------------------------
--no even parity
    constant sp: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(32, 8));  --space
    constant cr: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(13, 8)); --carriage return
    constant lf: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(10, 8)); --line feed
    constant nu: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(00, 8));  --null
--with parity
    constant ep_sp: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(32,9));  --space
    constant ep_cr: std_logic_vector(8 downto 0) := "100001101"; --carriage return
    constant ep_lf: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(10,9)); --line feed
	 constant ep_nu: std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(00,9));  --null


end ascii_char;

package body ascii_char is

 
end ascii_char;

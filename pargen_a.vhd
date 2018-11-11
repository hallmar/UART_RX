architecture pargen_a of pargen_e is
signal	parity_s : std_logic_vector(8 downto 0);	--intermediate results
begin
	--parity calculation logic
	parity_s(0) <= '0';										--set first result to even
	parity_logic: for i in 0 to 7 generate
		parity_s(i+1) <= parity_s(i) xor data_i(i);	--xor each result with the next input bit
	end generate;
	paritycheck_o <= parity_s(8);									--output the final result

end pargen_a;

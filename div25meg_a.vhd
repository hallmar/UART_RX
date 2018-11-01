architecture div25meg_a of div25meg_e is

begin

  signal prescaler : unsigned(23 downto 0);
  signal clk_2Hz_i : std_logic;
begin

  gen_clk : process (clk_i, rb_i)
  begin  -- process gen_clk
    if rb_i = '1' then
      clk_2Hz_i   <= '0';
      prescaler   <= (others => '0');
    elsif rising_edge(clk_i) then   -- rising clock edge
      if prescaler = X"BEBC20" then     -- 12 500 000 in hex
        prescaler   <= (others => '0');
        clk_2Hz_i   <= not clk_2Hz_i;
      else
        prescaler <= prescaler + "1";
      end if;
    end if;
  end process gen_clk;
  div_o <= clk_2Hz_i;
end architecture div25meg_a ; -- of div50meg_e
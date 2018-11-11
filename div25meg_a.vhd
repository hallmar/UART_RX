architecture div25meg_a of div25meg_e is


  signal prescaler : unsigned(23 downto 0);
  signal clk_2hz_i : std_logic;
begin

  gen_clk : process (clk_i, rb_i)
  begin  -- process gen_clk
    if rb_i = '0' then
      clk_2hz_i   <= '0';
      prescaler   <= (others => '0');
    elsif rising_edge(clk_i) then   -- rising clock edge
      if prescaler = x"bebc20" then     -- 12 500 000 in hex
        prescaler   <= (others => '0');
        clk_2hz_i   <= not clk_2hz_i;
      else
        prescaler <= prescaler + "1";
      end if;
    end if;
  end process gen_clk;
  div_o <= clk_2hz_i;
end architecture div25meg_a ; -- of div50meg_e
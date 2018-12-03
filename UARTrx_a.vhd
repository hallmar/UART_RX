architecture uartrx_a of uartrx_e is

  signal data_s          : std_logic_vector(7 downto 0);
  signal paritydata_s    : std_logic;
  signal paritycheck_s   : std_logic;
  signal char_s          : std_logic_vector(7 downto 0);
  signal y_s             : std_logic;
  signal u3eightcomp_y_s : std_logic;
  signal sren_s          : std_logic;
  signal c_s             : std_logic;
  signal u8div4_c_s      : std_logic;
  signal u7div4_c_s      : std_logic;
  signal compare_s       : std_logic;
  signal rb_s            : std_logic;

  component shiftreg_e
    port (
      rx_i         : in     std_logic;
      clk_i        : in     std_logic;
      data_o       : out    std_logic_vector(7 downto 0);
      en_i         : in     std_logic;
      paritydata_o : out    std_logic;
      rb_i         : in     std_logic);
  end component shiftreg_e;

  component pargen_e
    port (
      data_i        : in     std_logic_vector(7 downto 0);
      paritycheck_o : out    std_logic);
  end component pargen_e;

  component xnoren_e
    port (
      a_i  : in     std_logic;
      b_i  : in     std_logic;
      en_i : in     std_logic;
      y_o  : out    std_logic);
  end component xnoren_e;

  component eightcomp_e
    port (
      a_i  : in     std_logic_vector(7 downto 0);
      b_i  : in     std_logic_vector(7 downto 0);
      en_i : in     std_logic;
      y_o  : out    std_logic);
  end component eightcomp_e;

  component dff_e
    port (
      clk_i : in     std_logic;
      d_i   : in     std_logic;
      en_i  : in     std_logic;
      q_o   : out    std_logic;
      rb_i  : in     std_logic);
  end component dff_e;

  component rom_e
    port (
      char_o   : out    std_logic_vector(7 downto 0);
      clk_i    : in     std_logic;
      en_i     : in     std_logic;
      pass_sel_i : in     std_logic_vector(1 downto 0);
      rb_i     : in     std_logic);
  end component rom_e;

  component div6_e
    port (
      c_o   : out    std_logic;
      clk_i : in     std_logic;
      en_i  : in     std_logic;
      rb_i  : in     std_logic);
  end component div6_e;

  component fsm_e
    port (
      rx_i      : in     std_logic;
      clk_i     : in     std_logic;
      compare_o : out    std_logic;
      rb_i      : in     std_logic;
      sren_o    : out    std_logic);
  end component fsm_e;

  component div25meg_e
    port (
      clk_i : in     std_logic;
      div_o : out    std_logic;
      rb_i  : in     std_logic);
  end component div25meg_e;

begin

  u0shiftreg: shiftreg_e
    port map(
      rx_i         => rx_i,
      clk_i        => clk_i,
      data_o       => data_s,
      en_i         => sren_s,
      paritydata_o => paritydata_s,
      rb_i         => rb_s);

  u1paritygen: pargen_e
    port map(
      data_i        => data_s,
      paritycheck_o => paritycheck_s);

  u2xnor_en: xnoren_e
    port map(
      a_i  => paritycheck_s,
      b_i  => paritydata_s,
      en_i => compare_s,
      y_o  => y_s);

  u3eightcomp: eightcomp_e
    port map(
      a_i  => char_s,
      b_i  => data_s,
      en_i => compare_s,
      y_o  => u3eightcomp_y_s);

  u4dff: dff_e
    port map(
      clk_i => clk_i,
      d_i   => u7div4_c_s,
      en_i  => c_s,
      q_o   => pass_o,
      rb_i  => rb_s);

  u5dff: dff_e
    port map(
      clk_i => clk_i,
      d_i   => u8div4_c_s,
      en_i  => c_s,
      q_o   => parity_o,
      rb_i  => rb_s);

  u6rom: rom_e
    port map(
      char_o   => char_s,
      clk_i    => clk_i,
      en_i     => compare_s,
      pass_sel_i => pass_sel_i,
      rb_i     => rb_s);

  u7div6: div6_e
    port map(
      c_o   => u7div4_c_s,
      clk_i => clk_i,
      en_i  => u3eightcomp_y_s,
      rb_i  => rb_s);

  u8div6: div6_e
    port map(
      c_o   => u8div4_c_s,
      clk_i => clk_i,
      en_i  => y_s,
      rb_i  => rb_s);

  u9fsm: fsm_e
    port map(
      rx_i      => rx_i,
      clk_i     => clk_i,
      compare_o => compare_s,
      rb_i      => rb_s,
      sren_o    => sren_s);

  u10div6: div6_e
    port map(
      c_o   => c_s,
      clk_i => clk_i,
      en_i  => compare_s,
      rb_i  => rb_s);

  u11div25meg: div25meg_e
    port map(
      clk_i => clk_i,
      div_o => heartb_o,
      rb_i  => rb_s);
      
	rb_o <= not(rb_i);
    rb_s <= not(rb_i);
	passsel_o(1) <= pass_sel_i(1);
	passsel_o(0) <= pass_sel_i(0);
end architecture uartrx_a ; -- of uartrx_e

architecture UARTrx_a of UARTrx_e is

  signal data_o          : std_logic_vector(7 downto 0);
  signal paritydata_o    : std_logic;
  signal paritycheck_o   : std_logic;
  signal char_o          : std_logic_vector(7 downto 0);
  signal y_o             : std_logic;
  signal u3eightcomp_y_o : std_logic;
  signal sren_o          : std_logic;
  signal compare_o       : std_logic;
  signal c_o             : std_logic;
  signal u8div4_c_o      : std_logic;
  signal u7div4_c_o      : std_logic;

  component shiftreg_e
    port (
      RX_i         : in     std_logic;
      clk_i        : in     std_logic;
      data_o       : out    std_logic_vector(7 downto 0);
      en_i         : in     std_logic;
      paritydata_o : out    std_logic;
      rb_i         : in     std_logic);
  end component shiftreg_e;

  component pargen_e
    port (
      data_i        : in     std_logic_vector(7 downto 0);
      en_i          : in     std_logic;
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
      pass_sel : in     std_logic_vector(1 downto 0);
      rb_i     : in     std_logic);
  end component rom_e;

  component div4_e
    port (
      c_o   : out    std_logic;
      clk_i : in     std_logic;
      en_i  : in     std_logic;
      rb_i  : in     std_logic);
  end component div4_e;

  component fsm_e
    port (
      RX_i      : in     std_logic;
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

  u0ShiftReg: shiftreg_e
    port map(
      RX_i         => RX_i,
      clk_i        => clk_i,
      data_o       => data_o,
      en_i         => sren_o,
      paritydata_o => paritydata_o,
      rb_i         => rb_i);

  u1ParityGen: pargen_e
    port map(
      data_i        => data_o,
      en_i          => compare_o,
      paritycheck_o => paritycheck_o);

  u2XNOR_en: xnoren_e
    port map(
      a_i  => paritycheck_o,
      b_i  => paritydata_o,
      en_i => compare_o,
      y_o  => y_o);

  u3eightcomp: eightcomp_e
    port map(
      a_i  => char_o,
      b_i  => data_o,
      en_i => compare_o,
      y_o  => u3eightcomp_y_o);

  u4dff: dff_e
    port map(
      clk_i => clk_i,
      d_i   => u7div4_c_o,
      en_i  => c_o,
      q_o   => pass_o,
      rb_i  => rb_i);

  u5dff: dff_e
    port map(
      clk_i => clk_i,
      d_i   => u8div4_c_o,
      en_i  => c_o,
      q_o   => parity_o,
      rb_i  => rb_i);

  u6ROM: rom_e
    port map(
      char_o   => char_o,
      clk_i    => clk_i,
      en_i     => compare_o,
      pass_sel => pass_sel,
      rb_i     => rb_i);

  u7div4: div4_e
    port map(
      c_o   => u7div4_c_o,
      clk_i => clk_i,
      en_i  => u3eightcomp_y_o,
      rb_i  => rb_i);

  u8div4: div4_e
    port map(
      c_o   => u8div4_c_o,
      clk_i => clk_i,
      en_i  => y_o,
      rb_i  => rb_i);

  u9FSM: fsm_e
    port map(
      RX_i      => RX_i,
      clk_i     => clk_i,
      compare_o => compare_o,
      rb_i      => rb_i,
      sren_o    => sren_o);

  u10div4: div4_e
    port map(
      c_o   => c_o,
      clk_i => clk_i,
      en_i  => compare_o,
      rb_i  => rb_i);

  u11div25meg: div25meg_e
    port map(
      clk_i => clk_i,
      div_o => heartb_o,
      rb_i  => rb_i);
end architecture UARTrx_a ; -- of UARTrx_e


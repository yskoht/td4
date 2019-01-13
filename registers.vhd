library ieee;
use ieee.std_logic_1164.all;

entity registers is
	generic (
		N: integer
	);
	port (
		clock        : in  std_logic;
		n_reset      : in  std_logic;
		n_load_a     : in  std_logic;
		n_load_b     : in  std_logic;
		n_load_c     : in  std_logic;
		n_load_d     : in  std_logic;
		data_in_a    : in  std_logic_vector(N-1 downto 0);
		data_in_b    : in  std_logic_vector(N-1 downto 0);
		data_in_c    : in  std_logic_vector(N-1 downto 0);
		data_in_d    : in  std_logic_vector(N-1 downto 0);
		sel          : in  std_logic_vector(1 downto 0);
		input_data   : in  std_logic_vector(N-1 downto 0);
		register_data: out std_logic_vector(N-1 downto 0);
		counter_data : out std_logic_vector(N-1 downto 0);
		output_data  : out std_logic_vector(N-1 downto 0)
	);
end registers;


architecture rtl of registers is
	component d_ff
		generic (
			N: integer
		);
		port (
			clock   : in  std_logic;
			n_reset : in  std_logic;
			n_load  : in  std_logic;
			data_in : in  std_logic_vector(N-1 downto 0);
			data_out: out std_logic_vector(N-1 downto 0)
		);
	end component;

	component counter
		generic (
			N: integer;
			M: integer
		);
		port (
			clock   : in  std_logic;
			n_reset : in  std_logic;
			n_load  : in  std_logic;
			data_in : in  std_logic_vector(N-1 downto 0);
			data_out: out std_logic_vector(N-1 downto 0);
			carry   : out std_logic
		);
	end component;

	component selector_4ch
		generic (
			N: integer
		);
		port (
			clock   : in  std_logic;
			data_ch0: in  std_logic_vector(N-1 downto 0);
			data_ch1: in  std_logic_vector(N-1 downto 0);
			data_ch2: in  std_logic_vector(N-1 downto 0);
			data_ch3: in  std_logic_vector(N-1 downto 0);
			sel     : in  std_logic_vector(1 downto 0);
			data_out: out std_logic_vector(N-1 downto 0)
		);
	end component;

	signal data_out_a: std_logic_vector(N-1 downto 0);
	signal data_out_b: std_logic_vector(N-1 downto 0);
	
begin
	u_reg_a: d_ff
		generic map (
			N => N
		)
		port map (
			clock    => clock,
			n_reset  => n_reset,
			n_load   => n_load_a,
			data_in  => data_in_a,
			data_out => data_out_a
		);

	u_reg_b: d_ff
		generic map (
			N => N
		)
		port map (
			clock    => clock,
			n_reset  => n_reset,
			n_load   => n_load_b,
			data_in  => data_in_b,
			data_out => data_out_b
		);

	u_reg_c: d_ff
		generic map (
			N => N
		)
		port map (
			clock    => clock,
			n_reset  => n_reset,
			n_load   => n_load_c,
			data_in  => data_in_c,
			data_out => output_data
		);

	u_reg_d: counter
		generic map (
			N => N,
			M => 2 ** N
		)
		port map (
			clock    => clock,
			n_reset  => n_reset,
			n_load   => n_load_d,
			data_in  => data_in_d,
			data_out => counter_data,
			carry    => open
		);
		
	u_selector: selector_4ch
		generic map (
			N => N
		)
		port map (
			clock    => clock,
			data_ch0 => data_out_a,
			data_ch1 => data_out_b,
			data_ch2 => input_data,
			data_ch3 => (others => '0'),
			sel      => sel,
			data_out => register_data
		);
end rtl;

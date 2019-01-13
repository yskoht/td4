library ieee;
use ieee.std_logic_1164.all;

entity divider is
	port (
		clock_in : in  std_logic;
		n_reset  : in  std_logic;
		clock_sel: in  std_logic;
		clock_out: out std_logic
	);
end divider;


architecture rtl of divider is
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
	
	signal clock_1Hz  : std_logic;
	signal clock_10Hz : std_logic;
	
begin
	clock_out <= clock_1Hz when clock_sel = '0' else clock_10Hz;

	u_1Hz_divider: counter
		generic map (
			N => 26,
			M => 50000000
		)
		port map (
			clock    => clock_in,
			n_reset  => n_reset,
			n_load   => '1',
			data_in  => (others => '0'),
			data_out => open,
			carry    => clock_1Hz
		);

	u_10Hz_divider: counter
		generic map (
			N => 23,
			M => 5000000
		)
		port map (
			clock    => clock_in,
			n_reset  => n_reset,
			n_load   => '1',
			data_in  => (others => '0'),
			data_out => open,
			carry    => clock_10Hz
		);
end rtl;
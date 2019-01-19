library ieee;
use ieee.std_logic_1164.all;

entity td4_bench is
end td4_bench;


architecture rtl of td4_bench is
	component td4
		port (
			clock_in  : in std_logic;
			clock_sel : in std_logic;
			n_reset_in: in std_logic;
			iport_data: in std_logic_vector(3 downto 0);
			oport_data: out std_logic_vector(3 downto 0)
		);
	end component;

	signal clock_in   : std_logic;
	signal clock_sel  : std_logic;
	signal n_reset_in : std_logic;
	signal iport_data : std_logic_vector(3 downto 0);

	constant step : time := 20 ns;

begin
	u_td4: td4
		port map (
			clock_in   => clock_in,
			clock_sel  => clock_sel,
			n_reset_in => n_reset_in,
			iport_data => iport_data,
			oport_data => open
		);

	process begin
		clock_in <= '1'; wait for step/2;
		clock_in <= '0'; wait for step/2;
	end process;

	clock_sel <= '0';
	iport_data <= (others => '0');

	process begin
		n_reset_in <= '0', '1' after step*2;
		wait;
	end process;
end rtl;


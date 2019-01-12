library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
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
end d_ff;


architecture rtl of d_ff is
	signal data: std_logic_vector(N-1 downto 0);

begin
	data_out <= data;

	process (clock) begin	
		if (clock'event and clock = '1') then
			if (n_reset = '0') then
				data <= (others => '0');
			elsif (n_load = '0') then
				data <= data_in;
			else
				data <= data;
			end if;
		end if;
	end process;
end rtl;

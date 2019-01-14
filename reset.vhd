library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reset is
	port (
		clock_in   : in  std_logic;
		n_reset_in : in  std_logic;
		clock      : in  std_logic;
		n_reset_out: out std_logic
	);
end reset;


architecture rtl of reset is
	signal n_reset_intr : std_logic;
	signal flag : std_logic;
	
begin
	n_reset_out <= n_reset_in and n_reset_intr;

	process (clock_in) begin
		if (clock_in'event and clock_in = '1') then
			if (n_reset_in = '0') then
				n_reset_intr <= '0';
				flag <= '0';
			elsif (clock = '1') then
				if (flag = '1') then
					n_reset_intr <= '1';
				else
					flag <= '1';
				end if;
			end if;
		end if;
	end process;
end rtl;
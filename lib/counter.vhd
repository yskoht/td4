library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
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
end counter;


architecture rtl of counter is
	signal count : std_logic_vector(N-1 downto 0);
	
begin
	data_out <= count;
	
	process (clock) begin
		if (clock'event and clock ='1') then
			if (n_reset = '0') then
				count <= (others => '0');
			elsif (n_load = '0') then
				count <= data_in;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
end rtl;

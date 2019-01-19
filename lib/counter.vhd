library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter is
	generic (
		N: integer;
		M: integer
	);
	port (
		clock   : in  std_logic;
		n_reset : in  std_logic;
		enable  : in  std_logic;
		n_load  : in  std_logic;
		data_in : in  std_logic_vector(N-1 downto 0);
		data_out: out std_logic_vector(N-1 downto 0);
		carry   : out std_logic
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
				carry <= '0';
			elsif (enable = '1') then
				if (n_load = '0') then
					count <= data_in;
					carry <= '0';
				elsif (count = conv_std_logic_vector(M-1, N)) then
					count <= (others => '0');
					carry <= '1';
				else
					count <= count + 1;
					carry <= '0';
				end if;
			end if;
		end if;
	end process;
end rtl;

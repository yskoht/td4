library ieee;
use ieee.std_logic_1164.all;

entity async_rom is
	port (
		address: in  std_logic_vector(3 downto 0);
		q      : out std_logic_vector(7 downto 0)
	);
end async_rom;


architecture rtl of async_rom is
begin
	q <= "10110111" when address = "0000" else
	     "00000001" when address = "0001" else
	     "11100001" when address = "0010" else
	     "00000001" when address = "0011" else
	     "11100011" when address = "0100" else
	     "10110110" when address = "0101" else
	     "00000001" when address = "0110" else
	     "11100110" when address = "0111" else
	     "00000001" when address = "1000" else
	     "11101000" when address = "1001" else
	     "10110000" when address = "1010" else
	     "10110100" when address = "1011" else
	     "00000001" when address = "1100" else
	     "11101010" when address = "1101" else
	     "10111000" when address = "1110" else
	     "11111111";
end rtl;
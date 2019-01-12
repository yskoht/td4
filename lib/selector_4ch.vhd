library ieee;
use ieee.std_logic_1164.all;

entity selector_4ch is
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
end selector_4ch;


architecture rtl of selector_4ch is
begin
	data_out <= data_ch0 when sel = "00" else
	            data_ch1 when sel = "01" else
					data_ch2 when sel = "10" else
					data_ch3;
end rtl;

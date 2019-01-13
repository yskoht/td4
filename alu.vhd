library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
	generic (
		N: integer
	);
	port (
		data_in_a : in  std_logic_vector(N-1 downto 0);
		data_in_b : in  std_logic_vector(N-1 downto 0);
		data_out  : out std_logic_vector(N-1 downto 0);
		data_out_c: out std_logic
	);
end alu;


architecture rtl of alu is
	signal data : std_logic_vector(N downto 0);

begin
	data <= data_in_a + data_in_b;
	data_out_c <= data(N);
	data_out <= data(N-1 downto 0);
end rtl;

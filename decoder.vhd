library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port (
		op    : in  std_logic_vector(3 downto 0);
		cflag : in  std_logic;
		sel   : out std_logic_vector(1 downto 0);		
		n_load: out std_logic_vector(3 downto 0)
	);
end decoder;


architecture rtl of decoder is
begin
	sel(0) <= op(0) or op(3);
	sel(1) <= op(1);

	n_load(0) <= op(2) or op(3);
	n_load(1) <= (not op(2)) or op(3);
	n_load(2) <= op(2) or (not op(3));
	n_load(3) <= (not op(2)) or (not op(3)) or (cflag and (not op(0)));
end rtl;

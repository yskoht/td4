library ieee;
use ieee.std_logic_1164.all;

entity td4 is
	port (
		clock: in std_logic;
		reset: in std_logic
	);
end td4;


architecture rtl of td4 is

component rom
	port (
		address: in  std_logic_vector(3 downto 0);
		clock  : in  std_logic := '1';
		q      : out std_logic_vector(7 downto 0)
	);
end component;

signal address : std_logic_vector(3 downto 0) := "0000";
signal rom_data : std_logic_vector(7 downto 0);

begin

	u_rom: rom port map (
		address => address,
		clock => clock,
		q => rom_data
	);

end rtl;

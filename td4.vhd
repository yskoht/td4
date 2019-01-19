library ieee;
use ieee.std_logic_1164.all;

entity td4 is
	port (
		clock_in  : in std_logic;
		clock_sel : in std_logic;
		n_reset_in: in std_logic;
		iport_data: in std_logic_vector(3 downto 0);
		oport_data: out std_logic_vector(3 downto 0)
	);
end td4;


architecture rtl of td4 is
	component td4_core
		port (
			clock_in  : in std_logic;
			clock_sel : in std_logic;
			n_reset_in: in std_logic;
			iport_data: in std_logic_vector(3 downto 0);
			oport_data: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component td4_core_async_rom
		port (
			clock_in  : in std_logic;
			clock_sel : in std_logic;
			n_reset_in: in std_logic;
			iport_data: in std_logic_vector(3 downto 0);
			oport_data: out std_logic_vector(3 downto 0)
		);
	end component;

begin
	u_td4_core: td4_core
		port map (
			clock_in   => clock_in,
			clock_sel  => clock_sel,
			n_reset_in => n_reset_in,
			iport_data => iport_data,
			oport_data => oport_data
		);

--	u_td4_core: td4_core_async_rom
--		port map (
--			clock_in   => clock_in,
--			clock_sel  => clock_sel,
--			n_reset_in => n_reset_in,
--			iport_data => iport_data,
--			oport_data => oport_data
--		);	
end rtl;

library ieee;
use ieee.std_logic_1164.all;

entity td4 is
	port (
		clock_in  : in std_logic;
		clock_sel : in std_logic;
		n_reset   : in std_logic;
		iport_data: in std_logic_vector(3 downto 0);
		oport_data: out std_logic_vector(3 downto 0)
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

	component registers
		generic (
			N: integer
		);
		port (
			clock        : in  std_logic;
			n_reset      : in  std_logic;
			n_load       : in  std_logic_vector(N-1 downto 0);
			data_in      : in  std_logic_vector(N-1 downto 0);
			sel          : in  std_logic_vector(1 downto 0);
			iport_data   : in  std_logic_vector(N-1 downto 0);
			register_data: out std_logic_vector(N-1 downto 0);
			counter_data : out std_logic_vector(N-1 downto 0);
			oport_data   : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	component alu
		generic (
			N: integer
		);
		port (
			data_in_a : in  std_logic_vector(N-1 downto 0);
			data_in_b : in  std_logic_vector(N-1 downto 0);
			data_out  : out std_logic_vector(N-1 downto 0);
			data_out_c: out std_logic
		);
	end component;

	component decoder
		port (
			op    : in  std_logic_vector(3 downto 0);
			cflag : in  std_logic;
			sel   : out std_logic_vector(1 downto 0);		
			n_load: out std_logic_vector(3 downto 0)
		);
	end component;

	component divider is
		port (
			clock_in : in  std_logic;
			n_reset  : in  std_logic;
			clock_sel: in  std_logic;
			clock_out: out std_logic
		);
	end component;

	constant N            : integer := 4;
	constant ROM_BIT_WIDTH: integer := 8;
	
	signal clock : std_logic;
	
	signal address  : std_logic_vector(N-1 downto 0);
	signal rom_data : std_logic_vector(ROM_BIT_WIDTH-1 downto 0);
	
	signal n_load        : std_logic_vector(N-1 downto 0);
	signal register_data : std_logic_vector(N-1 downto 0);
	signal sel           : std_logic_vector(1 downto 0);
	signal alu_data      : std_logic_vector(N-1 downto 0);
	signal alu_carry     : std_logic;
	
begin
	u_rom: rom
		port map (
			address => address,
			clock => clock,
			q => rom_data
		);
		
	u_registers: registers
		generic map (
			N => N
		)
		port map (
			clock         => clock,
			n_reset       => n_reset,
			n_load        => n_load,
			data_in       => alu_data,
			sel           => sel,
			iport_data    => iport_data,
			register_data => register_data,
			counter_data  => address,
			oport_data    => oport_data
		);
	
	u_alu: alu
		generic map (
			N => N
		)
		port map (
			data_in_a  => register_data,
			data_in_b  => rom_data(N-1 downto 0),
			data_out   => alu_data,
			data_out_c => alu_carry
		);

	u_decoder: decoder
		port map (
			op     => rom_data(ROM_BIT_WIDTH-1 downto N),
			cflag  => alu_carry,
			sel    => sel,
			n_load => n_load
		);

	u_divider: divider
		port map (
			clock_in  => clock_in,
			n_reset   => n_reset,
			clock_sel => clock_sel,
			clock_out => clock
		);
end rtl;

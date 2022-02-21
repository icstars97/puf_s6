library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel_single is
	port(i_clk : in std_logic;
		  i_nrst : in std_logic;
		  i_uart_rx : in std_logic;
		  o_uart_tx : out std_logic);
end toplevel_single;

architecture single_apuf of toplevel_single is
	signal s_ublaze_io1 : std_logic_vector(15 downto 0);
	signal s_ublaze_io2_o : std_logic_vector(0 downto 0);
	signal s_ublaze_io2_i : std_logic_vector(15 downto 0);
	constant c_puf_length : integer := 16;
    component microblaze_mcs_v1_4_0
      port (
        clk : in std_logic;
        reset : in std_logic;
        uart_rx : in std_logic;
        uart_tx : out std_logic;
        gpo1 : out std_logic_vector(15 downto 0);
        gpo2 : out std_logic_vector(0 downto 0);
        gpi1 : in std_logic_vector(15 downto 0);
        gpi1_interrupt : out std_logic
      );
     end component;
begin
	
	mcs_0 : microblaze_mcs_v1_4_0
		port map(
    		uart_tx => o_uart_tx,
    		uart_rx => i_uart_rx,
    		reset => not i_nrst,
    		clk => i_clk,
    		gpo1 => s_ublaze_io1,
      		gpi1 => s_ublaze_io2_i,
      		gpo2 => s_ublaze_io2_o
    	);
	apuf_instance : entity work.arbiter_puf(rtl)
	   generic map(
	       puf_length => c_puf_length
	   )
	   port map(
	       i_pulse_arb => s_ublaze_io2_o(0),
       	   i_challenge_arb => s_ublaze_io1,
       	   o_response_arb => s_ublaze_io2_i(0)
	   );
	   s_ublaze_io2_i(15 downto 1) <= (others => '0');
	       			
	
	
end single_apuf;
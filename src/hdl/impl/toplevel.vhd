----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:27:10 01/16/2022 
-- Design Name: 
-- Module Name:    toplevel - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel is
	port(i_clk : in std_logic;
		  i_nrst : in std_logic;
		  i_uart_rx : in std_logic;
		  o_uart_tx : out std_logic);
end toplevel;

architecture rtl of toplevel is
	signal ublaze_io0 : std_logic_vector(31 downto 0);
	signal ublaze_io1_o : std_logic_vector(7 downto 0);
	signal ublaze_io1_i : std_logic_vector(7 downto 0);
	component ublaze
	port(
		uart_rx : in std_logic;
		nrst : in std_logic;
		clkin : in std_logic;
		gpio_1_i : in std_logic_vector(7 downto 0);    
		gpio_0 : inout std_logic_vector(31 downto 0);      
		uart_tx : out std_logic;
		gpio_1_o : out std_logic_vector(7 downto 0)
		);
	end component;

begin
	
	ublaze_inst : ublaze
		port map(uart_tx => o_uart_tx,
					uart_rx => i_uart_rx,
					nrst => i_nrst,
					clkin => i_clk,
					gpio_0 => ublaze_io0,
					gpio_1_i => ublaze_io1_i,
					gpio_1_o => ublaze_io1_o);
					
	arbiter_puf_inst : entity work.arbiter_puf(rtl)
		generic map(puf_length => 10)
		port map(i_pulse => ublaze_io1_o(0),
					i_challenge => ublaze_io0,
					o_response => ublaze_io1_i(1));
					
	
end rtl;


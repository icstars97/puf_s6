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
use ieee.math_real.all;

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

architecture single_apuf of toplevel is
	signal s_ublaze_io1 : std_logic_vector(31 downto 0);
	signal s_ublaze_io2_o : std_logic_vector(31 downto 0);
	signal s_ublaze_io2_i : std_logic_vector(31 downto 0);
	constant c_puf_length : integer := 16;
	component ublaze
	port(
		uart_rx : in std_logic;
		nrst : in std_logic;
		clkin : in std_logic;
		gpio_2_i : in std_logic_vector(31 downto 0);    
		gpio_1 : inout std_logic_vector(31 downto 0);      
		uart_tx : out std_logic;
		gpio_2_o : out std_logic_vector(31 downto 0)
		);
	end component;
begin
	
	ublaze_inst : ublaze
		port map(uart_tx => o_uart_tx,
					uart_rx => i_uart_rx,
					nrst => i_nrst,
					clkin => i_clk,
					gpio_1 => s_ublaze_io1,
					gpio_2_i => s_ublaze_io2_i,
					gpio_2_o => s_ublaze_io2_o);
					
	arbiter_puf_inst : entity work.arbiter_puf(rtl)
		generic map(puf_length => c_puf_length)
		port map(i_pulse_arb => s_ublaze_io2_o(0),
					i_challenge_arb => s_ublaze_io1(c_puf_length - 1 downto 0),
					o_response_arb => s_ublaze_io2_i(1));
					
	
end single_apuf;

architecture multi_apuf of toplevel is 
	signal s_ublaze_io1 : std_logic_vector(31 downto 0);
	signal s_ublaze_io2_o : std_logic_vector(31 downto 0);
	signal s_ublaze_io2_i : std_logic_vector(31 downto 0);
	constant c_puf_length : integer := 16;
	constant c_resp_width : integer := 8;
	component ublaze
	port(
		uart_rx : in std_logic;
		nrst : in std_logic;
		clkin : in std_logic;
		gpio_2_i : in std_logic_vector(31 downto 0);    
		gpio_1 : inout std_logic_vector(31 downto 0);      
		uart_tx : out std_logic;
		gpio_2_o : out std_logic_vector(31 downto 0)
		);
	end component;
begin

	ublaze_inst : ublaze
		port map(
			uart_tx => o_uart_tx,
			uart_rx => i_uart_rx,
			nrst => i_nrst,
			clkin => i_clk,
			gpio_1 => s_ublaze_io1,
			gpio_2_i => s_ublaze_io2_i,
			gpio_2_o => s_ublaze_io2_o
		);
	
	apuf_multi_inst_1 : entity work.apuf_multi(rtl)
		generic map(
			challenge_width => c_puf_length,
			response_width => c_resp_width
		)
		port map(
			i_challenge => s_ublaze_io1(c_puf_length - 1 downto 0),
			i_pulse => s_ublaze_io2_o(0),
			o_response => s_ublaze_io2_i(c_resp_width downto 1)
			
		);
		
		apuf_multi_inst_2 : entity work.apuf_multi(rtl)
		generic map(
			challenge_width => c_puf_length,
			response_width => c_resp_width
		)
		port map(
			i_challenge => s_ublaze_io1(2 * c_puf_length - 1 downto c_puf_length),
			i_pulse => s_ublaze_io2_o(0),
			o_response => s_ublaze_io2_i(2 * c_resp_width downto  c_resp_width + 1)
			
		);
		
end multi_apuf;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:17:35 01/09/2022 
-- Design Name: 
-- Module Name:    arbiter_puf - rtl 
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
library UNISIM;
use UNISIM.VComponents.all;

entity arbiter_puf is
	generic(puf_length : integer := 32);
	port(i_pulse : in std_logic;
		  i_challenge : in std_logic_vector(puf_length-1 downto 0);
		  o_response : out std_logic);
end arbiter_puf;

architecture rtl of arbiter_puf is
	
	signal s_mux1 : std_logic;
	signal s_mux2 : std_logic;
	
	attribute keep_hierarchy : string;
	attribute keep_hierarchy of rtl : architecture is "yes";
--	
begin

	mux_array_inst : entity work.mux_array(rtl)
		generic map(arr_length => puf_length)
		port map(i_p => i_pulse,
					i_ch => i_challenge,
					o_out1 => s_mux1,
					o_out2 => s_mux2);
					
	d_trig_inst : fdre
		generic map(init => '0')
		port map(d => s_mux1,
					c => s_mux2,
					ce => '1',
					r => '0',
					q => o_response);
					
end rtl;


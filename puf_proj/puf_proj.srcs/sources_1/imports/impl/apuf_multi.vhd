----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:40 02/15/2022 
-- Design Name: 
-- Module Name:    apuf_x8 - Behavioral 
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

entity apuf_multi is
	generic(
		challenge_width : integer := 16;
		response_width : integer := 8
	);
	port(
		i_challenge : in std_logic_vector(challenge_width - 1 downto 0);
		i_pulse : in std_logic;
		o_response : out std_logic_vector(response_width - 1 downto 0)
	);
end apuf_multi;

architecture rtl of apuf_multi is

begin
	
	apuf_array : for i in 0 to response_width - 1 generate 
		
		apuf_instance : entity work.arbiter_puf(rtl)
			generic map(
				puf_length => challenge_width
			)
			port map(
				i_pulse_arb => i_pulse,
				i_challenge_arb => i_challenge,
				o_response_arb => o_response(i)
			);
		
	end generate apuf_array;

end rtl;


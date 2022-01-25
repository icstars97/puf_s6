----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:29 01/09/2022 
-- Design Name: 
-- Module Name:    mux_array - rtl 
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
library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_array is

	generic(arr_length : integer := 4);
	
	port(i_p : in std_logic;
		  i_ch : in std_logic_vector(arr_length-1 downto 0);
		  o_out1 : out std_logic;
		  o_out2 : out std_logic);
	
end mux_array;

architecture rtl of mux_array is

	signal s_intc : std_logic_vector(2 * arr_length + 1 downto 0) := (others => '0');
	attribute keep_hierarchy : string;
	attribute keep_hierarchy of rtl : architecture is "yes";
	
begin
	
	
	s_intc(0) <= i_p;
	s_intc(1) <= s_intc(0);
	
	o_out1<= s_intc(2 * arr_length);
	o_out2 <= s_intc(2 * arr_length + 1);
	
	array_gen : for i in 0 to arr_length - 1 generate
	
		mux_instance_even : entity work.mux(clb_prim)
			port map(
				i_a => s_intc(2 * i),
				i_b => s_intc(2 * i + 1),
				i_s => i_ch(i),
				o_y => s_intc(2 * (i + 1)));
				
		mux_instance_odd : entity work.mux(clb_prim)
			port map(
				i_a => s_intc(2 * i),
				i_b => s_intc(2 * i + 1),
				i_s => i_ch(i),
				o_y => s_intc(2 * (i + 1) + 1));
	end generate array_gen;

end rtl;


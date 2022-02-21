----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:31 01/05/2022 
-- Design Name: 
-- Module Name:    mux - rtl 
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

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
library unisim;
use unisim.vcomponents.all;

entity mux is
    port ( i_a : in std_logic;
			  i_b : in std_logic;
           i_s : in  std_logic;
           o_y : out  std_logic);
end mux;

architecture behavioral of mux is

begin

	o_y <= i_a when i_s = '0' else i_b;
	
end behavioral;

architecture clb_prim_f7 of mux is 
begin
	mux_inst : muxf7
   port map (
      o => o_y,    -- Output of MUX to general routing
      i0 => i_a,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      i1 => i_b,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      s => i_s     -- Input select to MUX
   );
end clb_prim_f7;

architecture clb_prim_f8 of mux is 
begin
	mux_inst : muxf8
   port map (
      o => o_y,    -- Output of MUX to general routing
      i0 => i_a,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      i1 => i_b,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      s => i_s     -- Input select to MUX
   );
end clb_prim_f8;
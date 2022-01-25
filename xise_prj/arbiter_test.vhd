--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:05:38 01/16/2022
-- Design Name:   
-- Module Name:   I:/FPGA_projects/puf/xise_prj/arbiter_test.vhd
-- Project Name:  puf
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arbiter_puf
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY arbiter_test IS
END arbiter_test;
 
ARCHITECTURE behavior OF arbiter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arbiter_puf
    PORT(
         i_pulse : IN  std_logic;
         i_challenge : IN  std_logic_vector(3 downto 0);
         o_response : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_pulse : std_logic := '0';
   signal i_challenge : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal o_response : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arbiter_puf PORT MAP (
          i_pulse => i_pulse,
          i_challenge => i_challenge,
          o_response => o_response
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		i_challenge <= X"A";
      wait for 100 ns;	
		i_pulse <= '1';
--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

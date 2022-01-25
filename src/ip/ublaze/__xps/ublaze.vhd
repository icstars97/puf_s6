LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ublaze IS
PORT (
	uart_tx : OUT STD_LOGIC;
	uart_rx : IN STD_LOGIC;
	nrst : IN STD_LOGIC;
	gpio_0 : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	clkin : IN STD_LOGIC;
	gpio_1_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	gpio_1_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ublaze;

ARCHITECTURE STRUCTURE OF ublaze IS

BEGIN
END ARCHITECTURE STRUCTURE;
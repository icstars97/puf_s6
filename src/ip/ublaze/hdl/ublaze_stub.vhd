-------------------------------------------------------------------------------
-- ublaze_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity ublaze_stub is
  port (
    uart_tx : out std_logic;
    uart_rx : in std_logic;
    nrst : in std_logic;
    clkin : in std_logic;
    gpio_1_i : in std_logic_vector(7 downto 0);
    gpio_1_o : out std_logic_vector(7 downto 0);
    gpio_0 : out std_logic_vector(31 downto 0)
  );
end ublaze_stub;

architecture STRUCTURE of ublaze_stub is

  component ublaze is
    port (
      uart_tx : out std_logic;
      uart_rx : in std_logic;
      nrst : in std_logic;
      clkin : in std_logic;
      gpio_1_i : in std_logic_vector(7 downto 0);
      gpio_1_o : out std_logic_vector(7 downto 0);
      gpio_0 : out std_logic_vector(31 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of ublaze : component is "user_black_box";

begin

  ublaze_i : ublaze
    port map (
      uart_tx => uart_tx,
      uart_rx => uart_rx,
      nrst => nrst,
      clkin => clkin,
      gpio_1_i => gpio_1_i,
      gpio_1_o => gpio_1_o,
      gpio_0 => gpio_0
    );

end architecture STRUCTURE;


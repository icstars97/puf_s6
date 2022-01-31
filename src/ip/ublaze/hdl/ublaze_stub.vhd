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
    gpio_2_i : in std_logic_vector(7 downto 0);
    gpio_2_o : out std_logic_vector(7 downto 0);
    gpio_1 : out std_logic_vector(31 downto 0)
  );
end ublaze_stub;

architecture STRUCTURE of ublaze_stub is

  component ublaze is
    port (
      uart_tx : out std_logic;
      uart_rx : in std_logic;
      nrst : in std_logic;
      clkin : in std_logic;
      gpio_2_i : in std_logic_vector(7 downto 0);
      gpio_2_o : out std_logic_vector(7 downto 0);
      gpio_1 : out std_logic_vector(31 downto 0)
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
      gpio_2_i => gpio_2_i,
      gpio_2_o => gpio_2_o,
      gpio_1 => gpio_1
    );

end architecture STRUCTURE;


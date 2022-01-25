cd I:/FPGA_projects/puf/src/ip/ublaze/
if { [ catch { xload xmp ublaze.xmp } result ] } {
  exit 10
}
xset hdl vhdl
run stubgen
exit 0

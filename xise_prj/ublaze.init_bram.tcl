cd I:/FPGA_projects/puf/src/ip/ublaze
if { [ catch { xload xmp ublaze.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0

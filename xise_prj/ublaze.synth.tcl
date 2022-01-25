proc pnsynth {} {
  cd I:/FPGA_projects/puf/src/ip/ublaze
  if { [ catch { xload xmp ublaze.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result

proc pngeninsttemplate {} {
  cd I:/FPGA_projects/puf/src/ip/ublaze
  if { [ catch { xload xmp ublaze.xmp } result ] } {
    exit 10
  }
  if { [catch {run mhs2hdl} result] } {
    return -1
  }
  return 0
}
if { [catch {pngeninsttemplate} result] } {
  exit -1
}
exit $result

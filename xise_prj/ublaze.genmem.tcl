if { [ catch { xload xmp I:/FPGA_projects/puf/src/ip/ublaze/ublaze.xmp } result ] } {
  exit 10
}
set gotbram [xget hasbram]
if { $gotbram == 1 } {
   #
   # Call the test bench generation
   if { [catch {run memgen -od I:/FPGA_projects/puf/xise_prj I:/FPGA_projects/puf/src/ip/ublaze/ublaze.mhs} result ] } {
      puts "ERROR: xps 'run memgen' call failed"
      exit -1
   }
}
exit 0

proc exportToSDK {} {
  cd I:/FPGA_projects/puf/src/ip/ublaze
  if { [ catch { xload xmp ublaze.xmp } result ] } {
    exit 10
  }
  if { [run exporttosdk] != 0 } {
    return -1
  }
  return 0
}

if { [catch {exportToSDK} result] } {
  exit -1
}

set sExportDir [ xget sdk_export_dir ]
set sExportDir [ file join "I:/FPGA_projects/puf/src/ip/ublaze" "$sExportDir" "hw" ] 
if { [ file exists I:/FPGA_projects/puf/xise_prj/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file I:/FPGA_projects/puf/xise_prj/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "I:/FPGA_projects/puf/xise_prj/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists I:/FPGA_projects/puf/xise_prj/toplevel.bit ] } {
   puts "Copying bit file I:/FPGA_projects/puf/xise_prj/toplevel.bit to $sExportDir" 
   file copy -force "I:/FPGA_projects/puf/xise_prj/toplevel.bit" $sExportDir
}
exit $result

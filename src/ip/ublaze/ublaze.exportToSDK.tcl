proc exportToSDK {} {
  cd /home/ise/ise_proj/puf_s6/src/ip/ublaze
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
set sExportDir [ file join "/home/ise/ise_proj/puf_s6/src/ip/ublaze" "$sExportDir" "hw" ] 
if { [ file exists /home/ise/ise_proj/puf_s6/xise_prj/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file /home/ise/ise_proj/puf_s6/xise_prj/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "/home/ise/ise_proj/puf_s6/xise_prj/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists /home/ise/ise_proj/puf_s6/xise_prj/toplevel.bit ] } {
   puts "Copying bit file /home/ise/ise_proj/puf_s6/xise_prj/toplevel.bit to $sExportDir" 
   file copy -force "/home/ise/ise_proj/puf_s6/xise_prj/toplevel.bit" $sExportDir
}
exit $result

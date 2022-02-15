cd /home/ise/ise_proj/puf_s6/src/ip/ublaze
if { [ catch {xload xmp ublaze.xmp} result ] } {
  exit -1
}
exit [xget external_mem_sim]

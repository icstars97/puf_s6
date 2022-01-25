for {set i 0} {$i <=4} {incr i} {
		
		puts [get_property IS_PRIMITIVE [get_cells arbiter_puf_inst/mux_array_inst/array_gen[$i].mux_instance_odd/mux_inst]]
		
		
}
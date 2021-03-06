set apuf_challenge_width 32


set inst1_x_start 8
set inst1_y_start 2


startgroup

#place first puf-rng instance


for {set cell_index 0} {$cell_index < $apuf_challenge_width} {incr cell_index} {
    set ycell [expr $inst1_y_start + $cell_index]
    set xcell_odd $inst1_x_start
    set xcell_even $inst1_x_start
    place_cell "apuf_instance/mux_array_inst/array_gen[${cell_index}].mux_instance_odd/mux_inst" "SLICE_X${xcell_odd}Y${ycell}/F7AMUX"
    place_cell "apuf_instance/mux_array_inst/array_gen[${cell_index}].mux_instance_even/mux_inst" "SLICE_X${xcell_even}Y${ycell}/F7BMUX"
}
set ff_ycell [expr $inst1_y_start + $apuf_challenge_width - 1]
set ff_xcell [expr $inst1_x_start + 2]
place_cell "apuf_instance/d_trig_inst" "SLICE_X${ff_xcell}Y${ff_ycell}/A5FF"



#apuf_instance/mux_array_inst/array_gen[0].mux_instance_even/mux_inst
endgroup

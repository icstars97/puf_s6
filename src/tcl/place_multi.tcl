set apuf_challenge_width 16
set apuf_response_width 8

set inst1_x_start 0
set inst1_y_start 2
set inst2_x_start 30
set inst2_y_start 2

startgroup

#place first puf-rng instance

for {set arr_index 0} {$arr_index < $apuf_response_width} {incr arr_index} {
    for {set cell_index 0} {$cell_index < $apuf_challenge_width} {incr cell_index} {
        set ycell [expr $inst1_y_start + $cell_index]
        set xcell [expr $inst1_x_start + $arr_index * 2]
        set ff_ycell [expr $inst1_y_start + $apuf_challenge_width]
        place_cell "apuf_multi_inst_1/apuf_array[${arr_index}].apuf_instance/mux_array_inst/array_gen[${cell_index}].mux_instance_odd/mux_inst" "SLICE_X${xcell}Y${ycell}/F7AMUX"
        place_cell "apuf_multi_inst_1/apuf_array[${arr_index}].apuf_instance/mux_array_inst/array_gen[${cell_index}].mux_instance_even/mux_inst" "SLICE_X${xcell}Y${ycell}/F7BMUX"
    }
    place_cell "apuf_multi_inst_1/apuf_array[${arr_index}].apuf_instance/d_trig_inst" "SLICE_X${xcell}Y${ff_ycell}/AFF"
}

#place second puf-rng instance

for {set arr_index 0} {$arr_index < $apuf_response_width} {incr arr_index} {
    for {set cell_index 0} {$cell_index < $apuf_challenge_width} {incr cell_index} {
        set ycell [expr $inst2_y_start + $cell_index]
        set xcell [expr $inst2_x_start + $arr_index * 2]
        set ff_ycell [expr $inst2_y_start + $apuf_challenge_width]
        place_cell "apuf_multi_inst_2/apuf_array[${arr_index}].apuf_instance/mux_array_inst/array_gen[${cell_index}].mux_instance_odd/mux_inst" "SLICE_X${xcell}Y${ycell}/F7AMUX"
        place_cell "apuf_multi_inst_2/apuf_array[${arr_index}].apuf_instance/mux_array_inst/array_gen[${cell_index}].mux_instance_even/mux_inst" "SLICE_X${xcell}Y${ycell}/F7BMUX"
    }
    place_cell "apuf_multi_inst_2/apuf_array[${arr_index}].apuf_instance/d_trig_inst" "SLICE_X${xcell}Y${ff_ycell}/AFF"
}

endgroup

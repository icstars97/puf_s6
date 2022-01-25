
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name puf -dir "I:/FPGA_projects/puf/xise_prj/planAhead_run_1" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "I:/FPGA_projects/puf/src/constraints/arbiter_puf_place.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../src/hdl/impl/mux.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/hdl/impl/mux_array.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/hdl/impl/arbiter_puf.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/hdl/impl/toplevel.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top toplevel $srcset
add_files [list {I:/FPGA_projects/puf/src/constraints/arbiter_puf_pin.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/src/constraints/arbiter_puf_place.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2

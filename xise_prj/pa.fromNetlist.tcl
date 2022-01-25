
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name puf -dir "I:/FPGA_projects/puf/xise_prj/planAhead_run_4" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "I:/FPGA_projects/puf/xise_prj/toplevel.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {I:/FPGA_projects/puf/xise_prj} }
add_files [list {I:/FPGA_projects/puf/xise_prj/ublaze.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/xise_prj/ublaze_axi4lite_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/xise_prj/ublaze_clock_generator_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/xise_prj/ublaze_microblaze_0_dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/xise_prj/ublaze_microblaze_0_ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/xise_prj/ublaze_microblaze_0_intc_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/xise_prj/ublaze_microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "I:/FPGA_projects/puf/src/constraints/arbiter_puf_place.ucf" [current_fileset -constrset]
add_files [list {I:/FPGA_projects/puf/src/constraints/arbiter_puf_pin.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {I:/FPGA_projects/puf/src/constraints/arbiter_puf_place.ucf}] -fileset [get_property constrset [current_run]]
link_design

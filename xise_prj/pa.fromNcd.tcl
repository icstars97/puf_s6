
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name puf -dir "/home/ise/ise_proj/puf_s6/xise_prj/planAhead_run_5" -part xc6slx9tqg144-2
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/ise/ise_proj/puf_s6/xise_prj/toplevel.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/ise_proj/puf_s6/xise_prj} }
add_files [list {/home/ise/ise_proj/puf_s6/xise_prj/ublaze_clock_generator_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/ise_proj/puf_s6/xise_prj/ublaze_microblaze_0_dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/ise_proj/puf_s6/xise_prj/ublaze_microblaze_0_ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/ise_proj/puf_s6/xise_prj/ublaze_microblaze_0_intc_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/ise_proj/puf_s6/xise_prj/ublaze_microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/ise_proj/puf_s6/xise_prj/ublaze.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/ise_proj/puf_s6/xise_prj/ublaze_axi4lite_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "/home/ise/ise_proj/puf_s6/src/constraints/arbiter_puf_place.ucf" [current_fileset -constrset]
add_files [list {/home/ise/ise_proj/puf_s6/src/constraints/arbiter_puf_pin.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ise/ise_proj/puf_s6/src/constraints/arbiter_puf_place.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "/home/ise/ise_proj/puf_s6/xise_prj/toplevel.ncd"
if {[catch {read_twx -name results_1 -file "/home/ise/ise_proj/puf_s6/xise_prj/toplevel.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/ise/ise_proj/puf_s6/xise_prj/toplevel.twx\": $eInfo"
}

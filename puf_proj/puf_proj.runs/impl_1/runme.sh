#!/bin/sh

# 
# PlanAhead(TM)
# runme.sh: a PlanAhead-generated Runs Script for UNIX
# Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/opt/Xilinx/14.7/ISE_DS/common/bin/lin64:/opt/Xilinx/14.7/ISE_DS/PlanAhead/bin
else
  PATH=/opt/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/opt/Xilinx/14.7/ISE_DS/common/bin/lin64:/opt/Xilinx/14.7/ISE_DS/PlanAhead/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/opt/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/opt/Xilinx/14.7/ISE_DS/common/lib/lin64
else
  LD_LIBRARY_PATH=/opt/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/opt/Xilinx/14.7/ISE_DS/common/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep ngdbuild -intstyle ise -p xc6slx25ftg256-2 -dd _ngo -uc "toplevel.ucf" -bm "/home/ise/ise_proj/puf_s6/puf_proj/puf_proj.srcs/sources_1/ip/microblaze_mcs_v1_4_0/microblaze_mcs_v1_4_0.bmm" "toplevel.edf"
EAStep map -intstyle pa -w "toplevel.ngd"
EAStep par -intstyle pa "toplevel.ncd" -w "toplevel_routed.ncd"
EAStep trce -intstyle ise -o "toplevel.twr" -v 30 -l 30 "toplevel_routed.ncd" "toplevel.pcf"
EAStep xdl -secure -ncd2xdl -nopips "toplevel_routed.ncd" "toplevel_routed.xdl"
EAStep bitgen "toplevel_routed.ncd" "toplevel.bit" "toplevel.pcf" -w -intstyle pa
# post-commands:
EAStep data2mem  -bm "toplevel_bd.bmm" -bt "toplevel.bit"  -bd "/home/ise/ise_proj/puf_s6/puf_proj/puf_proj.srcs/sources_1/imports/microblaze/mb_bootloop_le.elf" tag ublaze_inst_microblaze_0 -o b "download.bit" -p xc6slx25ftg256-2




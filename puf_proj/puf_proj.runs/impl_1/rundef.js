//
// PlanAhead(TM)
// rundef.js: a PlanAhead-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
//

echo "This script was generated under a different operating system."
echo "Please update the PATH variable below, before executing this script"
exit

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "/opt/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/opt/Xilinx/14.7/ISE_DS/common/bin/lin64;/opt/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/opt/Xilinx/14.7/ISE_DS/common/lib/lin64;/opt/Xilinx/14.7/ISE_DS/PlanAhead/bin;";
} else {
  PathVal = "/opt/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/opt/Xilinx/14.7/ISE_DS/common/bin/lin64;/opt/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/opt/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/opt/Xilinx/14.7/ISE_DS/common/lib/lin64;/opt/Xilinx/14.7/ISE_DS/PlanAhead/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "ngdbuild",
         "-intstyle ise -p xc6slx25ftg256-2 -dd _ngo -uc \"toplevel.ucf\" -bm \"/home/ise/ise_proj/puf_s6/puf_proj/puf_proj.srcs/sources_1/ip/microblaze_mcs_v1_4_0/microblaze_mcs_v1_4_0.bmm\" \"toplevel.edf\"" );
ISEStep( "map",
         "-intstyle pa -w \"toplevel.ngd\"" );
ISEStep( "par",
         "-intstyle pa \"toplevel.ncd\" -w \"toplevel_routed.ncd\"" );
ISEStep( "trce",
         "-intstyle ise -o \"toplevel.twr\" -v 30 -l 30 \"toplevel_routed.ncd\" \"toplevel.pcf\"" );
ISEStep( "xdl",
         "-secure -ncd2xdl -nopips \"toplevel_routed.ncd\" \"toplevel_routed.xdl\"" );
ISEStep( "bitgen",
         "\"toplevel_routed.ncd\" \"toplevel.bit\" \"toplevel.pcf\" -w -intstyle pa" );
// post-commands:
ISEStep( "data2mem",
         " -bm \"toplevel_bd.bmm\" -bt \"toplevel.bit\"  -bd \"/home/ise/ise_proj/puf_s6/puf_proj/puf_proj.srcs/sources_1/imports/microblaze/mb_bootloop_le.elf\" tag ublaze_inst_microblaze_0 -o b \"download.bit\" -p xc6slx25ftg256-2" );






function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}

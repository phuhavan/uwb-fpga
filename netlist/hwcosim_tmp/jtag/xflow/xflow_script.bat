@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc7k325t-2ffg900 -nt timestamp -intstyle xflow -uc hwcosim_top.ucf -sd D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist -sd ../synth_wrapper "D:\z_WORKSPACE\UWB\uwb_implementation_hw_kintex7\netlist\hwcosim_tmp\jtag\xflow/hwcosim_top.ngc" hwcosim_top.ngd 

@REM #
@REM # Command line for map
@REM #
map -w -o hwcosim_top_map.ncd -intstyle xflow -timing -ol high hwcosim_top.ngd hwcosim_top.pcf 

@REM #
@REM # Command line for par
@REM #
par -w -ol high -intstyle xflow hwcosim_top_map.ncd hwcosim_top.ncd hwcosim_top.pcf 

@REM #
@REM # Command line for bitgen
@REM #
bitgen -intstyle xflow -w -g StartUpClk:JtagClk hwcosim_top.ncd 


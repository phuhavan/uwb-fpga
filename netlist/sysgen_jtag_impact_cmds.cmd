setMode -bscan
setCable -p usb21
Identify -inferir
identifyMPM
assignFile -p 1 -file "D:/z_WORKSPACE/UWB/uwb_implementation_final_kintex_final/netlist/subsystem2_cw.bit"
program -p 1
quit

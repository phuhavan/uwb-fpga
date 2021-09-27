#
# Created by System Generator     Sat Jan 10 20:02:22 2015
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {KC705 (JTAG)}
    set Project {subsystem2_cw}
    set DSPFamily {Kintex7}
    set DSPDevice {xc7k325t}
    set DSPPackage {ffg900}
    set DSPSpeed {-2}
    set HDLLanguage {verilog}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {50}
    set CreateInterfaceDocument {off}
    set NewXSTParser {1}
	if { [ string equal $Compilation {IP Packager} ] == 1 } {
		set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
		set IP_Library_Text {SysGen}
		set IP_Vendor_Text {Xilinx}
		set IP_Version_Text {1.0}
		set IP_Categories_Text {System Generator for DSP}
		set IP_Common_Repos {0}
		set IP_Dir {}
		set IP_LifeCycle_Menu {1}
		set IP_Description    {}
		
	}
    set ProjectFiles {
        {{subsystem2_cw.v} -view All}
        {{subsystem2.v} -view All}
        {{subsystem2_cw.ucf}}
        {{subsystem2_cw.xdc}}
        {{D:\z_WORKSPACE\UWB\uwb_implementation_hw_kintex7\uwb_re_blackbox.mdl}}
    }
    set TopLevelModule {subsystem2_cw}
    set SynthesisConstraintsFile {subsystem2_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create

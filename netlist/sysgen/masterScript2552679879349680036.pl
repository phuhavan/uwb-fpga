
open(PIDFILE, '> pidfile.txt') || die 'Couldn\'t write process ID to file.';
print PIDFILE "$$\n";
close(PIDFILE);

eval {
  # Call script(s).
  my $instrs;
  my $results = [];
$ENV{'SYSGEN'} = 'C:/Xilinx/14.6/ISE_DS/ISE/sysgen';
  use Sg;
  $instrs = {
    'HDLCodeGenStatus' => 0.0,
    'HDL_PATH' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7',
    'Impl_file' => 'ISE Defaults',
    'Impl_file_sgadvanced' => '',
    'Synth_file' => 'XST Defaults',
    'Synth_file_sgadvanced' => '',
    'TEMP' => 'C:/Users/ADMINI~1/AppData/Local/Temp',
    'TMP' => 'C:/Users/ADMINI~1/AppData/Local/Temp',
    'Temp' => 'C:/Users/ADMINI~1/AppData/Local/Temp',
    'Tmp' => 'C:/Users/ADMINI~1/AppData/Local/Temp',
    'base_system_period_hardware' => 20.0,
    'base_system_period_simulink' => 1.0480182926829268E-4,
    'block_icon_display' => 'Default',
    'block_type' => 'sysgen',
    'block_version' => '',
    'ce_clr' => 0.0,
    'clock_loc' => 'Fixed',
    'clock_settings' => {
      'dut_period_allowed' => '[10,15,20,30]',
      'dut_period_default' => '20',
      'source_period' => '5',
    },
    'clock_wrapper' => 'Clock Enables',
    'clock_wrapper_sgadvanced' => '',
    'compilation' => 'KC705 (JTAG)',
    'compilation_lut' => {
      'keys' => [
        'HDL Netlist',
        'Atlys',
        'KC705 (JTAG)',
      ],
      'values' => [
        'target1',
        'target2',
        'target3',
      ],
    },
    'compilation_target' => 'KC705 (JTAG)',
    'core_generation' => 1.0,
    'core_generation_sgadvanced' => '',
    'core_is_deployed' => 0.0,
    'coregen_core_generation_tmpdir' => 'C:/Users/ADMINI~1/AppData/Local/Temp/sysgentmp-Administrator/cg_wk/cad56fee62a73cac6',
    'coregen_part_family' => 'kintex7',
    'cosim_library' => 'JTAGRuntimeCosim_r4',
    'createTestbench' => 0,
    'create_interface_document' => 'off',
    'dbl_ovrd' => -1.0,
    'dbl_ovrd_sgadvanced' => '',
    'dcm_input_clock_period' => 10.0,
    'deprecated_control' => 'off',
    'deprecated_control_sgadvanced' => '',
    'design' => 'uwb_re_blackbox',
    'design_full_path' => 'D:\\z_WORKSPACE\\UWB\\uwb_implementation_hw_kintex7\\uwb_re_blackbox.mdl',
    'device' => 'xc7k325t-2ffg900',
    'device_speed' => '-2',
    'directory' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist',
    'dsp_cache_root_path' => 'C:/Users/ADMINI~1/AppData/Local/Temp/sysgentmp-Administrator',
    'eval_field' => '0',
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/perl_results.v', },
      ],
    ],
    'force_scheduling' => 0.0,
    'fxdptinstalled' => 1.0,
    'generateUsing71FrontEnd' => 1,
    'generating_island_subsystem_handle' => 2083.0001220703125,
    'generating_subsystem_handle' => 2083.0001220703125,
    'generation_directory' => './netlist',
    'getimportblock_fcn' => 'xlGetHwcosimBlockName',
    'has_advanced_control' => '0',
    'hdlDir' => 'C:/Xilinx/14.6/ISE_DS/ISE/sysgen/hdl',
    'hdlKind' => 'verilog',
    'hdl_path' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7',
    'hwcosim_board' => 'kc705-jtag',
    'impl_file' => 'ISE Defaults*',
    'incr_netlist' => 'off',
    'incr_netlist_sgadvanced' => '',
    'infoedit' => ' System Generator',
    'isdeployed' => 0,
    'ise_version' => '14.6i',
    'master_sysgen_token_handle' => 2085.0001220703125,
    'matlab' => 'C:/Program Files/MATLAB/R2012b',
    'matlab_fixedpoint' => 1.0,
    'mdlHandle' => 2079.0001220703125,
    'mdlPath' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/uwb_re_blackbox.mdl',
    'modelDiagnostics' => [
      {
        'count' => 2620.0,
        'isMask' => 0.0,
        'type' => 'uwb_re_blackbox Total blocks',
      },
      {
        'count' => 32.0,
        'isMask' => 0.0,
        'type' => 'ActionPort',
      },
      {
        'count' => 53.0,
        'isMask' => 0.0,
        'type' => 'Buffer',
      },
      {
        'count' => 29.0,
        'isMask' => 0.0,
        'type' => 'Concatenate',
      },
      {
        'count' => 173.0,
        'isMask' => 0.0,
        'type' => 'Constant',
      },
      {
        'count' => 5.0,
        'isMask' => 0.0,
        'type' => 'DataTypeConversion',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'DataTypeDuplicate',
      },
      {
        'count' => 27.0,
        'isMask' => 0.0,
        'type' => 'Delay',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Demux',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'DiscreteFir',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'DiscretePulseGenerator',
      },
      {
        'count' => 8.0,
        'isMask' => 0.0,
        'type' => 'Display',
      },
      {
        'count' => 102.0,
        'isMask' => 0.0,
        'type' => 'EnablePort',
      },
      {
        'count' => 16.0,
        'isMask' => 0.0,
        'type' => 'FrameConversion',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'From',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'FromFile',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'FromWorkspace',
      },
      {
        'count' => 68.0,
        'isMask' => 0.0,
        'type' => 'Gain',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'Goto',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'Ground',
      },
      {
        'count' => 568.0,
        'isMask' => 0.0,
        'type' => 'Inport',
      },
      {
        'count' => 251.0,
        'isMask' => 0.0,
        'type' => 'Logic',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'MATLAB Function',
      },
      {
        'count' => 30.0,
        'isMask' => 0.0,
        'type' => 'Math',
      },
      {
        'count' => 55.0,
        'isMask' => 0.0,
        'type' => 'Merge',
      },
      {
        'count' => 479.0,
        'isMask' => 0.0,
        'type' => 'Outport',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Product',
      },
      {
        'count' => 54.0,
        'isMask' => 0.0,
        'type' => 'RelationalOperator',
      },
      {
        'count' => 50.0,
        'isMask' => 0.0,
        'type' => 'Reshape',
      },
      {
        'count' => 3.0,
        'isMask' => 0.0,
        'type' => 'Rounding',
      },
      {
        'count' => 142.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Scope',
      },
      {
        'count' => 9.0,
        'isMask' => 0.0,
        'type' => 'Selector',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'SignalSpecification',
      },
      {
        'count' => 383.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 22.0,
        'isMask' => 0.0,
        'type' => 'Sum',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Switch',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'SwitchCase',
      },
      {
        'count' => 6.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 7.0,
        'isMask' => 0.0,
        'type' => 'ToWorkspace',
      },
      {
        'count' => 10.0,
        'isMask' => 0.0,
        'type' => 'Unbuffer',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'UnitDelay',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'AWGN Channel',
      },
      {
        'count' => 72.0,
        'isMask' => 1.0,
        'type' => 'Bit to Integer Converter',
      },
      {
        'count' => 51.0,
        'isMask' => 1.0,
        'type' => 'Compare To Zero',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Convolutional Encoder',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Counter Limited',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Data Type Propagation',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Delay',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Dynamic AWGN',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Error Rate Calculation',
      },
      {
        'count' => 16.0,
        'isMask' => 1.0,
        'type' => 'Integer to Bit Converter',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Integer-Input RS Encoder',
      },
      {
        'count' => 16.0,
        'isMask' => 1.0,
        'type' => 'Multiport Selector',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Random Source',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Real World Value Increment',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Submatrix',
      },
      {
        'count' => 30.0,
        'isMask' => 1.0,
        'type' => 'Transpose',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Wrap To Zero',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Black Box Block',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx System Generator Block',
      },
    ],
    'model_globals_initialized' => 1.0,
    'model_path' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/uwb_re_blackbox.mdl',
    'myxilinx' => 'C:/Xilinx/14.6/ISE_DS/ISE',
    'ngc_files' => [ 'xlpersistentdff.ngc', ],
    'num_sim_cycles' => '3148800',
    'package' => 'ffg900',
    'part' => 'xc7k325t',
    'partFamily' => 'kintex7',
    'port_data_types_enabled' => 1.0,
    'postgeneration_fcn' => 'xlHwcosimPostGeneration',
    'precompile_fcn' => 'xlJTAGPreCompile',
    'preserve_hierarchy' => 0.0,
    'proj_type' => 'Project Navigator',
    'proj_type_sgadvanced' => '',
    'report_true_rates' => 0.0,
    'run_coregen' => 'off',
    'run_coregen_sgadvanced' => '',
    'sample_time_colors_enabled' => 0.0,
    'sampletimecolors' => 0.0,
    'settings_fcn' => 'xlHwcosimSettings',
    'sg_blockgui_xml' => '',
    'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
    'sg_list_contents' => '',
    'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
    'sg_version' => '',
    'sggui_pos' => '-1,-1,-1,-1',
    'simulation_island_subsystem_handle' => 2083.0001220703125,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => 1.0480182926829268E-4,
    'speed' => '-2',
    'synth_file' => 'XST Defaults*',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'verilog',
    'synthesis_tool' => 'XST',
    'synthesis_tool_sgadvanced' => '',
    'sysclk_period' => 20.0,
    'sysgen' => 'C:/Xilinx/14.6/ISE_DS/ISE/sysgen',
    'sysgenRoot' => 'C:/Xilinx/14.6/ISE_DS/ISE/sysgen',
    'sysgenTokenSettings' => {
      'Impl_file' => 'ISE Defaults',
      'Impl_file_sgadvanced' => '',
      'Synth_file' => 'XST Defaults',
      'Synth_file_sgadvanced' => '',
      'base_system_period_hardware' => 20.0,
      'base_system_period_simulink' => 1.0480182926829268E-4,
      'block_icon_display' => 'Default',
      'block_type' => 'sysgen',
      'block_version' => '',
      'ce_clr' => 0.0,
      'clock_loc' => 'Fixed',
      'clock_settings' => {
        'dut_period_allowed' => '[10,15,20,30]',
        'dut_period_default' => '20',
        'source_period' => '5',
      },
      'clock_wrapper' => 'Clock Enables',
      'clock_wrapper_sgadvanced' => '',
      'compilation' => 'KC705 (JTAG)',
      'compilation_lut' => {
        'keys' => [
          'HDL Netlist',
          'Atlys',
          'KC705 (JTAG)',
        ],
        'values' => [
          'target1',
          'target2',
          'target3',
        ],
      },
      'core_generation' => 1.0,
      'core_generation_sgadvanced' => '',
      'coregen_part_family' => 'kintex7',
      'cosim_library' => 'JTAGRuntimeCosim_r4',
      'create_interface_document' => 'off',
      'dbl_ovrd' => -1.0,
      'dbl_ovrd_sgadvanced' => '',
      'dcm_input_clock_period' => 10.0,
      'deprecated_control' => 'off',
      'deprecated_control_sgadvanced' => '',
      'directory' => './netlist',
      'eval_field' => '0',
      'getimportblock_fcn' => 'xlGetHwcosimBlockName',
      'has_advanced_control' => '0',
      'hwcosim_board' => 'kc705-jtag',
      'impl_file' => 'ISE Defaults*',
      'incr_netlist' => 'off',
      'incr_netlist_sgadvanced' => '',
      'infoedit' => ' System Generator',
      'master_sysgen_token_handle' => 2085.0001220703125,
      'package' => 'ffg900',
      'part' => 'xc7k325t',
      'postgeneration_fcn' => 'xlHwcosimPostGeneration',
      'precompile_fcn' => 'xlJTAGPreCompile',
      'preserve_hierarchy' => 0.0,
      'proj_type' => 'Project Navigator',
      'proj_type_sgadvanced' => '',
      'run_coregen' => 'off',
      'run_coregen_sgadvanced' => '',
      'settings_fcn' => 'xlHwcosimSettings',
      'sg_blockgui_xml' => '',
      'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
      'sg_list_contents' => '',
      'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
      'sggui_pos' => '-1,-1,-1,-1',
      'simulation_island_subsystem_handle' => 2083.0001220703125,
      'simulink_period' => 1.0480182926829268E-4,
      'speed' => '-2',
      'synth_file' => 'XST Defaults*',
      'synthesis_language' => 'verilog',
      'synthesis_tool' => 'XST',
      'synthesis_tool_sgadvanced' => '',
      'sysclk_period' => 20.0,
      'testbench' => 0,
      'testbench_sgadvanced' => '',
      'trim_vbits' => 1.0,
      'trim_vbits_sgadvanced' => '',
      'version' => '13.1',
      'xilinx_device' => 'xc7k325t-2ffg900',
      'xilinxfamily' => 'kintex7',
    },
    'sysgen_Root' => 'C:/Xilinx/14.6/ISE_DS/ISE/sysgen',
    'systemClockPeriod' => 20.0,
    'tempdir' => 'C:/Users/ADMINI~1/AppData/Local/Temp',
    'testbench' => 0,
    'testbench_sgadvanced' => '',
    'tmpDir' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen',
    'trim_vbits' => 1.0,
    'trim_vbits_sgadvanced' => '',
    'use_strict_names' => 1,
    'user_tips_enabled' => 0.0,
    'usertemp' => 'C:/Users/ADMINI~1/AppData/Local/Temp/sysgentmp-Administrator',
    'using71Netlister' => 1,
    'verilog_files' => [
      'conv_pkg.v',
      'synth_reg.v',
      'synth_reg_w_init.v',
      'convert_type.v',
    ],
    'version' => '13.1',
    'vhdl_files' => [
      'conv_pkg.vhd',
      'synth_reg.vhd',
      'synth_reg_w_init.vhd',
    ],
    'vsimtime' => '69273875.000000 ns',
    'xilinx' => 'C:/Xilinx/14.6/ISE_DS/ISE',
    'xilinx_device' => 'xc7k325t-2ffg900',
    'xilinx_family' => 'kintex7',
    'xilinx_package' => 'ffg900',
    'xilinx_part' => 'xc7k325t',
    'xilinxdevice' => 'xc7k325t-2ffg900',
    'xilinxfamily' => 'kintex7',
    'xilinxpart' => 'xc7k325t',
  };
  push(@$results, &Sg::setAttributes($instrs));
  use SgDeliverFile;
  $instrs = {
    'collaborationName' => 'conv_pkg.v',
    'sourceFile' => 'hdl/conv_pkg.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg.v',
    'sourceFile' => 'hdl/synth_reg.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg_w_init.v',
    'sourceFile' => 'hdl/synth_reg_w_init.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'convert_type.v',
    'sourceFile' => 'hdl/convert_type.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'xlpersistentdff.ngc',
    'sourceFile' => 'hdl/xlpersistentdff.ngc',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = { 'sourceFile' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/uwb_re.v', };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2b0a170ae29da9240960ae8f27cb2444',
    'sourceFile' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/uwb_re_submodules.v',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'C:/Xilinx/14.6/ISE_DS/ISE/sysgen';
  open(RESULTS, '> D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/script_results1621912773613637900') || 
    croak 'couldn\'t open D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/script_results1621912773613637900';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/script_results1621912773613637900';
};

if ($@) {
  open(RESULTS, '> D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/script_results1621912773613637900') || 
    croak 'couldn\'t open D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/script_results1621912773613637900';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen/script_results1621912773613637900';
  exit(1);
}

exit(0);

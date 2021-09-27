{
  'Design' => {
    'ConstraintsFile' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/sysgen_hwcosim.ucf',
    'EntityName' => 'subsystem2_cw',
    'HDLFileExtension' => 'v',
    'HDLFileList' => [
      {
        'Library' => 'work',
        'Path' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/subsystem2.v',
        'Type' => 'verilog'
      },
      {
        'Library' => 'work',
        'Path' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/subsystem2_cw.v',
        'Type' => 'verilog'
      }
    ],
    'HDLLanguage' => 'verilog',
    'ImplStrategyName' => 'ISE Defaults*',
    'InstanceName' => 'sysgen_dut',
    'PeripheralList' => [

    ],
    'PortList' => [
      {
        'ConnectTo' => 1,
        'Direction' => 'in',
        'DisplayName' => 'ce',
        'IsMemoryMapped' => false,
        'Name' => 'ce',
        'SamplePeriod' => 1
      },
      {
        'Clock' => {
          'Period' => 20.00000000000
        },
        'DataType' => 'logic',
        'Direction' => 'in',
        'DisplayName' => 'clk',
        'IsClock' => true,
        'Name' => 'clk',
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'coarse_error',
        'Name' => 'coarse_error',
        'Range' => {
          'Left' => '0',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'coarse_off',
        'Name' => 'coarse_off',
        'Range' => {
          'Left' => '0',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'data_out',
        'Name' => 'data_out',
        'Range' => {
          'Left' => '0',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_3_0',
        'Direction' => 'in',
        'DisplayName' => 'ddph_i',
        'Name' => 'ddph_i',
        'Range' => {
          'Left' => '2',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_8_0',
        'Direction' => 'in',
        'DisplayName' => 'in_data',
        'Name' => 'in_data',
        'Range' => {
          'Left' => '7',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'in',
        'DisplayName' => 'in_rst',
        'Name' => 'in_rst',
        'Range' => {
          'Left' => '0',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'in',
        'DisplayName' => 'in_start',
        'Name' => 'in_start',
        'Range' => {
          'Left' => '0',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'psdu_en',
        'Name' => 'psdu_en',
        'Range' => {
          'Left' => '0',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_32_0',
        'Direction' => 'in',
        'DisplayName' => 'sfd_threshold',
        'Name' => 'sfd_threshold',
        'Range' => {
          'Left' => '31',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      },
      {
        'DataType' => 'UFix_16_0',
        'Direction' => 'in',
        'DisplayName' => 'sm_threshold',
        'Name' => 'sm_threshold',
        'Range' => {
          'Left' => '15',
          'Right' => '0'
        },
        'SamplePeriod' => 1
      }
    ],
    'ProjectFile' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist/xst_subsystem2.prj',
    'SharedFIFOList' => [

    ],
    'SharedRAMList' => [

    ],
    'SharedRegisterList' => [

    ],
    'SynplifySynthesisConstraints' => [
      'define_attribute {clk} syn_maxfan {1000000}'
    ],
    'SynthStrategyName' => 'XST Defaults*',
    'SynthesisTool' => 'xst',
    'SynthesisToolExecutable' => 'xst',
    'UsesSynplify' => false,
    'UsesVivado' => false,
    'UsesXST' => true,
    'XSTSynthesisConstraints' => [
      'NET "clk" TNM_NET = "clk_2e6d98b4";',
      'TIMESPEC "TS_clk_2e6d98b4" = PERIOD "clk_2e6d98b4" 20.0 ns HIGH 50 %;'
    ]
  },
  'Flow' => 'sysgen',
  'Incremental' => '',
  'IsMultipleClock' => '0',
  'IsZynqHIL' => '0',
  'Platform' => {
    'Board' => 'kc705',
    'BoundaryScanPosition' => 1,
    'Clock' => [
      {
        'Differential' => true,
        'IOStandard' => 'DIFF_SSTL15',
        'Period' => 5,
        'Pin' => {
          'Negative' => 'AD11',
          'Positive' => 'AD12'
        },
        'VariablePeriods' => [
          10,
          15,
          20,
          30
        ]
      },
      {
        'Differential' => true,
        'IOStandard' => 'LVDS_25',
        'Period' => 6.40500000000,
        'Pin' => {
          'Negative' => 'K29',
          'Positive' => 'K28'
        }
      }
    ],
    'Description' => 'KC705 (JTAG)',
    'Interface' => 'jtag',
    'Part' => {
      'BaseFamily' => 'kintex7',
      'Device' => 'xc7k325t',
      'Family' => 'kintex7',
      'FamilyForSynplify' => 'kintex7',
      'Package' => 'ffg900',
      'Speed' => '-2'
    },
    'Type' => 'jtag',
    'Vendor' => 'Xilinx'
  },
  'Subflow' => 'xflow',
  'Target' => {
    'ExcludedModules' => [

    ],
    'Modules' => [

    ]
  }
}

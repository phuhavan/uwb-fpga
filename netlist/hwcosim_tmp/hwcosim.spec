{
  'ClockGenerator' => {
    'MMCM' => {
      'BandwidthMode' => 'OPTIMIZED',
      'ClkDivisor' => 1,
      'ClkMultiplier' => 5.00000000000,
      'ClkOut0' => {
        'Divisor' => 20,
        'Used' => true
      },
      'ClkOut1' => {
        'Divisor' => 1,
        'Used' => false
      },
      'ClkOut2' => {
        'Divisor' => 1,
        'Used' => false
      },
      'ClkOut3' => {
        'Divisor' => 1,
        'Used' => false
      },
      'ClkOut4' => {
        'Divisor' => 1,
        'Used' => false
      },
      'ClkOut5' => {
        'Divisor' => 1,
        'Used' => false
      },
      'ClkOut6' => {
        'Divisor' => 1,
        'Used' => false
      }
    },
    'Type' => 'MMCM'
  },
  'CosimCore' => {
    'EntityName' => 'jtagcosim_iface_virtex7',
    'Interface' => {
      'Clock' => [
        {
          'Clock' => {
            'Period' => 20.00000000000
          },
          'Constraints' => [
            'NET "hwcosim_sys_clk_p" LOC = AD12 | IOSTANDARD=DIFF_SSTL15;',
            'NET "hwcosim_sys_clk_n" LOC = AD11 | IOSTANDARD=DIFF_SSTL15;'
          ],
          'Direction' => 'in',
          'IOType' => 'ibufg',
          'MMCMPort' => 'clkout0',
          'Name' => 'sys_clk',
          'Width' => 1
        }
      ],
      'Cosim' => [
        {
          'Direction' => 'out',
          'Name' => 'addr',
          'Width' => 24
        },
        {
          'Direction' => 'out',
          'Name' => 'bank_sel',
          'Width' => 8
        },
        {
          'Direction' => 'out',
          'Name' => 'cosim_clk_sel',
          'Width' => 1
        },
        {
          'Direction' => 'out',
          'Name' => 'data_in',
          'Width' => 32
        },
        {
          'Direction' => 'in',
          'Name' => 'data_out',
          'Width' => 32
        },
        {
          'Direction' => 'out',
          'Name' => 'sstep_clk',
          'Width' => 1
        },
        {
          'Direction' => 'out',
          'Name' => 'we',
          'Width' => 1
        },
        {
          'Direction' => 'out',
          'Name' => 're',
          'Width' => 1
        }
      ]
    }
  },
  'Design' => {
    'BasePath' => 'D:/z_WORKSPACE/UWB/uwb_implementation_hw_kintex7/netlist',
    'Constraints' => [

    ],
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
        'DataType' => 'UFix_1_0',
        'Direction' => 'in',
        'DisplayName' => 'ce',
        'IsExternal' => false,
        'IsMemoryMapped' => false,
        'Name' => 'ce',
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 1
      },
      {
        'Clock' => {
          'Period' => 20.00000000000
        },
        'DataType' => 'logic',
        'Direction' => 'in',
        'DisplayName' => 'clk',
        'IsClock' => true,
        'IsExternal' => false,
        'IsMemoryMapped' => false,
        'Name' => 'clk',
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'coarse_error',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'coarse_error',
        'Range' => {
          'Left' => '0',
          'Length' => 1,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'output',
        'Width' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'coarse_off',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'coarse_off',
        'Range' => {
          'Left' => '0',
          'Length' => 1,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'output',
        'Width' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'data_out',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'data_out',
        'Range' => {
          'Left' => '0',
          'Length' => 1,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'output',
        'Width' => 1
      },
      {
        'DataType' => 'UFix_3_0',
        'Direction' => 'in',
        'DisplayName' => 'ddph_i',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'ddph_i',
        'Range' => {
          'Left' => '2',
          'Length' => 3,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 3
      },
      {
        'DataType' => 'UFix_8_0',
        'Direction' => 'in',
        'DisplayName' => 'in_data',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'in_data',
        'Range' => {
          'Left' => '7',
          'Length' => 8,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 8
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'in',
        'DisplayName' => 'in_rst',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'in_rst',
        'Range' => {
          'Left' => '0',
          'Length' => 1,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'in',
        'DisplayName' => 'in_start',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'in_start',
        'Range' => {
          'Left' => '0',
          'Length' => 1,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 1
      },
      {
        'DataType' => 'UFix_1_0',
        'Direction' => 'out',
        'DisplayName' => 'psdu_en',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'psdu_en',
        'Range' => {
          'Left' => '0',
          'Length' => 1,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'output',
        'Width' => 1
      },
      {
        'DataType' => 'UFix_32_0',
        'Direction' => 'in',
        'DisplayName' => 'sfd_threshold',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'sfd_threshold',
        'Range' => {
          'Left' => '31',
          'Length' => 32,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 32
      },
      {
        'DataType' => 'UFix_16_0',
        'Direction' => 'in',
        'DisplayName' => 'sm_threshold',
        'IsExternal' => false,
        'IsMemoryMapped' => true,
        'Name' => 'sm_threshold',
        'Range' => {
          'Left' => '15',
          'Length' => 16,
          'Order' => 'downto',
          'Right' => '0'
        },
        'SamplePeriod' => 1,
        'VerilogDirection' => 'input',
        'Width' => 16
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
  'MemoryMap' => {
    'InputPortMapping' => [
      {
        'Address' => 0,
        'Port' => {
          'Name' => 'ddph_i',
          'Range' => {
            'Left' => 2,
            'Length' => 3,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 1,
        'Port' => {
          'Name' => 'in_data',
          'Range' => {
            'Left' => 7,
            'Length' => 8,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 2,
        'Port' => {
          'Name' => 'in_rst',
          'Range' => {
            'Left' => 0,
            'Length' => 1,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 3,
        'Port' => {
          'Name' => 'in_start',
          'Range' => {
            'Left' => 0,
            'Length' => 1,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 4,
        'Port' => {
          'Name' => 'sfd_threshold',
          'Range' => {
            'Left' => 31,
            'Length' => 32,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 5,
        'Port' => {
          'Name' => 'sm_threshold',
          'Range' => {
            'Left' => 15,
            'Length' => 16,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      }
    ],
    'OutputPortMapping' => [
      {
        'Address' => 0,
        'Port' => {
          'Name' => 'coarse_error',
          'Range' => {
            'Left' => 0,
            'Length' => 1,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 1,
        'Port' => {
          'Name' => 'coarse_off',
          'Range' => {
            'Left' => 0,
            'Length' => 1,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 2,
        'Port' => {
          'Name' => 'data_out',
          'Range' => {
            'Left' => 0,
            'Length' => 1,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      },
      {
        'Address' => 3,
        'Port' => {
          'Name' => 'psdu_en',
          'Range' => {
            'Left' => 0,
            'Length' => 1,
            'Order' => 'downto',
            'Right' => 0
          }
        }
      }
    ]
  },
  'Platform' => {
    'Board' => 'kc705',
    'BoundaryScanPosition' => 1,
    'Clock' => {
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
  'SYSGEN' => 'C:/Xilinx/14.6/ISE_DS/ISE/sysgen',
  'Subflow' => 'xflow',
  'Target' => {
    'ExcludedModules' => [

    ],
    'Modules' => [
      'jtag'
    ]
  },
  'TopLevel' => {
    'EntityName' => 'hwcosim_top'
  },
  'Type' => 'hwcosim',
  'Version' => '9.2',
  'XILINX' => 'C:/Xilinx/14.6/ISE_DS/ISE'
}

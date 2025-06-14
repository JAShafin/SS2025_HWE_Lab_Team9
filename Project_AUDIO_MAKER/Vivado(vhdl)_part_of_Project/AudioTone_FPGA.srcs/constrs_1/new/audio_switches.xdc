# Clock
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]
create_clock -name sys_clk -period 10.00 [get_ports { CLK100MHZ }]

# Reset button (now from M18)
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { RESET }]

# Switches
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { SW[0] }]
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { SW[1] }]
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports { SW[2] }]
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { SW[3] }]
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { SW[4] }]
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports { SW[5] }]
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { SW[6] }]
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports { SW[7] }]
set_property -dict { PACKAGE_PIN T8  IOSTANDARD LVCMOS33 } [get_ports { SW[8] }]
set_property -dict { PACKAGE_PIN U8  IOSTANDARD LVCMOS33 } [get_ports { SW[9] }]
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports { SW[10] }]
set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [get_ports { SW[11] }]
set_property -dict { PACKAGE_PIN H6  IOSTANDARD LVCMOS33 } [get_ports { SW[12] }]
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports { SW[13] }]
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports { SW[14] }]
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports { SW[15] }]

# Audio Output
set_property -dict { PACKAGE_PIN A11 IOSTANDARD LVCMOS33 } [get_ports { AUD_PWM }]
set_property -dict { PACKAGE_PIN D12 IOSTANDARD LVCMOS33 } [get_ports { AUD_SD }]

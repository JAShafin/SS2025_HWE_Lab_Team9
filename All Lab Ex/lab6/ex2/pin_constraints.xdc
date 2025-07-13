## Example XDC - Adapt pins to your FPGA board
set_property PACKAGE_PIN W5 [get_ports clk]   # Clock
set_property PACKAGE_PIN U18 [get_ports rst]  # Reset button
set_property PACKAGE_PIN U17 [get_ports up]   # Up button
set_property PACKAGE_PIN V17 [get_ports down] # Down button

# Connect q to LEDs for testing (optional)
set_property PACKAGE_PIN U16 [get_ports {q[0]}]
set_property PACKAGE_PIN E19 [get_ports {q[1]}]
set_property PACKAGE_PIN U19 [get_ports {q[2]}]

# 7-segment display pins (change to your board's assignments)
set_property PACKAGE_PIN W7 [get_ports {seg[0]}] # a
set_property PACKAGE_PIN W6 [get_ports {seg[1]}] # b
set_property PACKAGE_PIN V6 [get_ports {seg[2]}] # c
set_property PACKAGE_PIN U7 [get_ports {seg[3]}] # d
set_property PACKAGE_PIN V7 [get_ports {seg[4]}] # e
set_property PACKAGE_PIN U8 [get_ports {seg[5]}] # f
set_property PACKAGE_PIN V8 [get_ports {seg[6]}] # g

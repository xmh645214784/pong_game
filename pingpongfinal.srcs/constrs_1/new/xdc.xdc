set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports st]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]
set_property PACKAGE_PIN U8 [get_ports rst]
set_property PACKAGE_PIN U9 [get_ports st]
set_property PACKAGE_PIN D8 [get_ports {blue[3]}]
set_property PACKAGE_PIN D7 [get_ports {blue[2]}]
set_property PACKAGE_PIN C7 [get_ports {blue[1]}]
set_property PACKAGE_PIN B7 [get_ports {blue[0]}]
set_property PACKAGE_PIN A6 [get_ports {green[3]}] 
set_property PACKAGE_PIN B6 [get_ports {green[2]}]
set_property PACKAGE_PIN A5 [get_ports {green[0]}]
set_property PACKAGE_PIN C6 [get_ports {green[1]}]
set_property PACKAGE_PIN A4 [get_ports {red[3]}]
set_property PACKAGE_PIN C5 [get_ports {red[2]}]
set_property PACKAGE_PIN B4 [get_ports {red[1]}]
set_property PACKAGE_PIN A3 [get_ports {red[0]}]
set_property PACKAGE_PIN B11 [get_ports hsync]
set_property PACKAGE_PIN B12 [get_ports vsync]


##keyboard
    ##USB HID (PS/2)
##Bank = 35, Pin name = IO_L13P_T2_MRCC_35,        Sch name = PS2_CLK
set_property PACKAGE_PIN F4 [get_ports ps2_clk]                        
set_property IOSTANDARD LVCMOS33 [get_ports ps2_clk]
set_property PULLUP true [get_ports ps2_clk]
##Bank = 35, Pin name = IO_L10N_T1_AD15N_35,        Sch name = PS2_DATA
set_property PACKAGE_PIN B2 [get_ports ps2_data]                    
set_property IOSTANDARD LVCMOS33 [get_ports ps2_data]    
set_property PULLUP true [get_ports ps2_data]    
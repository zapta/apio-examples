
#-- Arty A7-35T board

#-- System clock (100 MHz)
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports {ext_clk}]

#-- LED
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports {LED}]

#-- Pin source: Digilent/digilent-xdc Arty-A7-35-Master.xdc

# Tcl script to run LVS on Alexandre Menu's LDO

if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /usr/local/share/pdk}
if {[catch {set PDK $::env(PDK)}]} {set PDK sky130A}

set pdklib ${PDK_ROOT}/${PDK}
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref

set setupfile ${techlibs}/netgen/sky130A_setup.tcl
set hvlib ${reflibs}/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice

set circuit1 [readnet spice ../netlist/layout/sky130_am_ip__ldo_01v8.spice]
set circuit2 [readnet spice $hvlib]
readnet spice ../netlist/schematic/sky130_am_ip__ldo_01v8.spice $circuit2

lvs "$circuit1 sky130_am_ip__ldo_01v8" "$circuit2 sky130_am_ip__ldo_01v8" \
	$setupfile sky130_am_ip__ldo_01v8_comp.out

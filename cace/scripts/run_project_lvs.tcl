# NOTE: PDK_ROOT, PDK and CACE_ROOT are set in the local environment by CACE

set PDK_ROOT $::env(PDK_ROOT)
set PDK $::env(PDK)
set CACE_ROOT $::env(CACE_ROOT)

set circuit1 [readnet spice $CACE_ROOT/netlist/layout/sky130_am_ip__ldo_01v8.spice]
set circuit2 [readnet spice $CACE_ROOT/netlist/schematic/sky130_am_ip__ldo_01v8.spice]

readnet spice $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice $circuit2  


lvs "$circuit1 sky130_am_ip__ldo_01v8" "$circuit2 sky130_am_ip__ldo_01v8" $PDK_ROOT/$PDK/libs.tech/netgen/${PDK}_setup.tcl sky130_am_ip__ldo_01v8_comp.out -json

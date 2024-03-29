v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 740 -500 840 -500 {
lab=vout}
N 400 -460 440 -460 {
lab=GND}
N 400 -460 400 -300 {
lab=GND}
N 80 -340 80 -320 {
lab=GND}
N 80 -320 400 -320 {
lab=GND}
N 340 -340 340 -320 {
lab=GND}
N 340 -480 340 -400 {
lab=#net1}
N 340 -480 440 -480 {
lab=#net1}
N 80 -500 80 -400 {
lab=#net2}
N 80 -500 440 -500 {
lab=#net2}
N 780 -500 780 -420 {
lab=vout}
N 780 -360 780 -320 {
lab=GND}
N 400 -320 780 -320 {
lab=GND}
C {sky130_fd_pr/corner.sym} 1210 -140 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code_shown.sym} 1140 -860 0 0 {name=NGSPICE
only_toplevel=false
value="* netlist
.option savecurrents
* ngspice control
.control
save all
dc iload 100n 1u 10n
plot vout title 'line regulation'
dc vdd 0 3.3 10m iload 100n 1u 100n
plot vout title 'load regulation'
.endc
"}
C {ldo.sym} 590 -480 0 0 {name=x1}
C {devices/opin.sym} 840 -500 0 0 {name=p4 lab=vout}
C {devices/vsource.sym} 340 -370 0 0 {name=vref value=1.2 savecurrent=false}
C {devices/vsource.sym} 80 -370 0 0 {name=vdd value=3.3 savecurrent=false
}
C {devices/gnd.sym} 400 -300 0 0 {name=l1 lab=GND}
C {devices/isource.sym} 780 -390 0 0 {name=iload value=80u}

v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 700 -920 1500 -520 {flags=graph
y1=-0.95619134
y2=4.075045
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-5e-06
x2=9.5e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout
net4
x1.net4"
color="4 6 7"
dataset=-1
unitx=1
logx=0
logy=0
}
N 590 -410 750 -410 {
lab=vout}
N 750 -410 750 -180 {
lab=vout}
N 750 -120 750 -60 {
lab=GND}
N 170 -450 170 -160 {
lab=#net1}
N 170 -450 290 -450 {
lab=#net1}
N 170 -60 750 -60 {
lab=GND}
N 170 -100 170 -60 {
lab=GND}
N -40 -100 -40 -60 {
lab=GND}
N 270 -360 290 -360 {
lab=GND}
N 270 -360 270 -60 {
lab=GND}
N -40 -390 290 -390 {
lab=#net2}
N 60 -420 290 -420 {
lab=#net3}
N 60 -420 60 -160 {
lab=#net3}
N 60 -100 60 -60 {
lab=GND}
N -180 -60 170 -60 {
lab=GND}
N -40 -390 -40 -160 {
lab=#net2}
N -260 -290 -260 -60 {
lab=GND}
N -260 -60 -180 -60 {
lab=GND}
N -260 -480 -260 -350 {
lab=AVDD}
N -260 -480 290 -480 {
lab=AVDD}
C {devices/code.sym} 995 -170 0 0 {name=TRAN_SIM only_toplevel=false value=".option savecurrents
.param AVDD = 3.3
.tran 100n 100u
.save all
"}
C {sky130_fd_pr/corner.sym} 880 -170 0 0 {name=CORNER only_toplevel=false corner=tt}
C {sky130_am_ip__ldo_01v8.sym} 440 -390 0 0 {name=x1}
C {devices/res.sym} 750 -150 0 0 {name=R1
value=360k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 430 -60 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -40 -130 0 0 {name=vena value="\{AVDD\}" savecurrent=false
}
C {devices/vsource.sym} 170 -130 0 0 {name=vref value=1.2 savecurrent=false}
C {devices/lab_pin.sym} 750 -400 0 1 {name=p9 sig_type=std_logic lab=vout}
C {devices/vsource.sym} 60 -130 0 0 {name=vsel value="\{AVDD\}" savecurrent=false
}
C {devices/vsource.sym} -260 -320 0 0 {name=vavdd1 value="pulse 0 \{AVDD\} 1u 1u" savecurrent=false
}
C {code_shown.sym} 970 -400 0 0 {name=s1 only_toplevel=false value="
.include /home/efabless/.volare/sky130A/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice


"}
C {launcher.sym} 470 -660 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/sky130_am_ip__ldo_01v8_tb.raw tran"
}
C {devices/launcher.sym} 950 -290 0 0 {name=h1
descr="annotate" 
tclcommand="xschem annotate_op"
value=".option savecurrents
.control
save all
save x1.vcp
save x1.vbp
save x1.vcn
save x1.vbn
save x1.v_m
save x1.v_p
save x1.v_ea
op
write sky130_am_ip__ldo_01v8_tb.raw
set appendwrite
* ac dec 10 10 1e9
* set units=degrees
* plot db(vout)
* plot ph(vout)
dc vavdd 0 3.3 10m
plot vout
* plot x1.vcp x1.vbp x1.vcn x1.vbn
*plot x1.v_m x1.v_p x1.v_ea
*plot @m.x1.xm22.msky130_fd_pr__pfet_g5v0d10v5[id] @m.x1.xm26.msky130_fd_pr__pfet_g5v0d10v5[id] @m.x1.xm27.msky130_fd_pr__pfet_g5v0d10v5[id] @m.x1.xm32.msky130_fd_pr__nfet_g5v0d10v5[id] @m.x1.xm33.msky130_fd_pr__nfet_g5v0d10v5[id]
*plot @m.x1.xm39.msky130_fd_pr__nfet_g5v0d10v5[id]
.endc
"}
C {lab_wire.sym} 80 -480 0 0 {name=p1 sig_type=std_logic lab=AVDD}

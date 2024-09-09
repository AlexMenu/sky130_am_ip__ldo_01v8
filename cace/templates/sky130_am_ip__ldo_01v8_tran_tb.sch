v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 590 -430 750 -430 {
lab=vout}
N 750 -430 750 -180 {
lab=vout}
N 750 -120 750 -60 {
lab=GND}
N 170 -470 170 -360 {
lab=VREF_EXT}
N 170 -470 290 -470 {
lab=VREF_EXT}
N 170 -60 750 -60 {
lab=GND}
N 170 -200 170 -60 {
lab=GND}
N -120 -100 -120 -60 {
lab=GND}
N -120 -410 290 -410 {
lab=ENA}
N 60 -440 290 -440 {
lab=SEL_EXT}
N 60 -350 60 -160 {
lab=SEL_EXT}
N 60 -100 60 -60 {
lab=GND}
N -180 -60 170 -60 {
lab=GND}
N -120 -410 -120 -160 {
lab=ENA}
N 250 -380 290 -380 {
lab=AVSS}
N -260 -290 -260 -60 {
lab=GND}
N -260 -60 -180 -60 {
lab=GND}
N -260 -500 -260 -350 {
lab=AVDD}
N -260 -500 290 -500 {
lab=AVDD}
N 170 -360 170 -260 {
lab=VREF_EXT}
N 60 -440 60 -350 {
lab=SEL_EXT}
N 250 -380 250 -360 {
lab=AVSS}
N 250 -300 250 -60 {
lab=GND}
C {devices/code.sym} 995 -170 0 0 {name=TRAN_SIM only_toplevel=false value=".option savecurrents

.control

tran 100n 100u
save all

meas tran vout_op find v(vout) AT=100u
set wr_singlescale
remzerovec
wrdata CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data time V(AVDD) V(vout) vout_op

.endc
"}
C {devices/res.sym} 750 -150 0 0 {name=R1
value=360k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 430 -60 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -120 -130 0 0 {name=vena value="CACE[CACE\{ENA\}*CACE\{DVDD\}]" savecurrent=false
}
C {devices/vsource.sym} 170 -230 0 0 {name=vref value=CACE\{VREF_EXT\} savecurrent=false}
C {devices/vsource.sym} 60 -130 0 0 {name=vsel value="CACE[CACE\{SEL_EXT\}*CACE\{AVDD\}]" savecurrent=false
}
C {devices/vsource.sym} -260 -320 0 0 {name=vavdd1 value="pulse 0 CACE\{AVDD\} 1u 1u" savecurrent=false
}
C {devices/code_shown.sym} 920 -630 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false
value="
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/combined/sky130.lib.spice CACE\{corner\}

.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice

.include CACE\{DUT_path\}

.temp CACE\{temperature\}

.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {devices/lab_pin.sym} 170 -500 0 0 {name=p1 sig_type=std_logic lab=AVDD}
C {devices/lab_pin.sym} -50 -410 2 0 {name=p5 sig_type=std_logic lab=ENA}
C {devices/lab_pin.sym} 170 -300 2 1 {name=p6 sig_type=std_logic lab=VREF_EXT}
C {devices/lab_pin.sym} 60 -330 2 1 {name=p7 sig_type=std_logic lab=SEL_EXT}
C {devices/lab_pin.sym} 630 -430 2 0 {name=p8 sig_type=std_logic lab=vout
}
C {devices/vsource.sym} 250 -330 0 0 {name=V0 value=0 savecurrent=false}
C {lab_wire.sym} 270 -380 0 0 {name=p2 sig_type=std_logic lab=AVSS}
C {sky130_am_ip__ldo_01v8.sym} 440 -410 0 0 {name=x1}

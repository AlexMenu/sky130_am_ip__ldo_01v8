v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 60 -140 60 -100 {
lab=GND}
N 60 -100 270 -100 {
lab=GND}
N 270 -200 270 -100 {
lab=GND}
N 270 -350 270 -260 {
lab=#net1}
N 60 -350 270 -350 {
lab=#net1}
N 60 -350 60 -200 {
lab=#net1}
N 160 -140 160 -100 {
lab=GND}
N 160 -230 230 -230 {
lab=#net2}
N 160 -230 160 -200 {
lab=#net2}
N 270 -230 360 -230 {
lab=#net3}
N 270 -100 360 -100 {
lab=GND}
N 60 -100 60 -60 {
lab=GND}
N 360 -130 360 -100 {
lab=GND}
N 360 -230 360 -190 {
lab=#net3}
C {sky130_fd_pr/corner.sym} 50 -560 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code_shown.sym} 430 -940 0 0 {name=NGSPICE only_toplevel=false value="* ngspice commands
.param W=1
.param L=0.5
.options savecurrents
.dc vg 100m 3.3 10m
.control
set plot_idn = ' '
set plot_gmid = ' '
set plot_gds = ' '
set plot_ro = ' '
set plot_avo = ' '
set plot_ft = ' '
set plot_vdsat = ' '
set plot_sweep = 'L = 0.5 0.75 1 2 5 10 20, Vbs = 0.7 V'
foreach l_act 0.5 0.75 1 2 5 10 20
    alterparam L = $l_act
    reset
    save all
    echo l = $l_act
    save @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gm]
    save @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gds]
    save @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[cds]
    save @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[id]
    save @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[w]
    save @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[l]
    save @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[vdsat]
    run
    remzerovec
    let idn = @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[id] / @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[w] * 1e-6
    let gmid = @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gm] / @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[id]
    let gds = @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gds]
    let ro = 1 / @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gds]
    let avo = @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gm] / @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gds]
    let vdsat = @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[vdsat]
    let ft =  @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[gm] / (2 * PI * @m.xm1.msky130_fd_pr__nfet_g5v0d10v5[cds])
    set plot_idn = ( $plot_idn \{$curplot\}.idn )
    set plot_gmid = ( $plot_gmid \{$curplot\}.gmid vs \{$curplot\}.idn )
    set plot_gds = ( $plot_gds \{$curplot\}.gds vs \{$curplot\}.idn )
    set plot_ro = ( $plot_ro \{$curplot\}.ro vs \{$curplot\}.idn )
    set plot_avo = ( $plot_avo \{$curplot\}.avo vs \{$curplot\}.idn )
    set plot_ft = ( $plot_ft \{$curplot\}.ft vs \{$curplot\}.idn )
    set plot_vdsat = ( $plot_vdsat \{$curplot\}.vdsat vs \{$curplot\}.idn )
  end
  hardcopy charac_body_nfet_idn.ps $plot_idn ylog ylimit 1e-9 1e-3 xlabel 'Vgs' ylabel 'Id / W*' title 'NFET normalized characteristic ($plot_sweep)'
  hardcopy charac_body_nfet_gmid.ps $plot_gmid xlog xlimit 1e-9 1e-3 xlabel 'Id / W*' ylabel 'gm / Id' title 'NFET normalized characteristic ($plot_sweep)'
  hardcopy charac_body_nfet_gds.ps $plot_gds loglog xlimit 1e-9 1e-3 xlabel 'Id / W*' ylabel 'gds' title 'NFET normalized characteristic ($plot_sweep)'
  hardcopy charac_body_nfet_ro.ps $plot_ro loglog xlimit 1e-9 1e-3 xlabel 'Id / W*' ylabel 'Ro' title 'NFET normalized characteristic ($plot_sweep)'
  hardcopy charac_body_nfet_avo.ps $plot_avo loglog xlimit 1e-9 1e-3 xlabel 'Id / W*' ylabel 'Avo' title 'NFET normalized characteristic ($plot_sweep)'
  hardcopy charac_body_nfet_ft.ps $plot_ft loglog xlimit 1e-9 1e-3 xlabel 'Id / W*' ylabel 'ft' title 'NFET normalized characteristic ($plot_sweep)'
  hardcopy charac_body_nfet_vdsat.ps $plot_vdsat xlog xlimit 1e-9 1e-3 xlabel 'Id / W*' ylabel 'Vdsat' title 'NFET normalized characteristic ($plot_sweep)'
.endc
"}
C {devices/vsource.sym} 60 -170 0 0 {name=vd value=1.2 savecurrent=false}
C {devices/vsource.sym} 160 -170 0 0 {name=vg value=3.3 savecurrent=false}
C {devices/gnd.sym} 60 -60 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 360 -160 0 0 {name=vsb value=-0.7 savecurrent=false}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 250 -230 0 0 {name=M1
W=W
L=L
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
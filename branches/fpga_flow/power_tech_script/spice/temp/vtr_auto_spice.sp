Automated spice simuation: Sun Mar 15 21:33:14 2015
.global Vdd gnd
.include '/home/xitang/tangxifan-eda-tools/branches/fpga_flow/tech/22nm_HP.pm'
.param tech = 22e-9
.param Vol = 0.6
.param simt = 5n
.param rise = 'simt/500'
.param fall = 'simt/500'
.include '/home/xitang/tangxifan-eda-tools/branches/fpga_flow/power_tech_script/spice/subckt/nmos_pmos.sp'
.include '/home/xitang/tangxifan-eda-tools/branches/fpga_flow/power_tech_script/spice/subckt/inv.sp'
.include '/home/xitang/tangxifan-eda-tools/branches/fpga_flow/power_tech_script/spice/subckt/level_restorer.sp'
Vdd Vdd 0 'Vol'
Vin in 0 0.6
X0 in 0 0 0 nfet size='22.74'
.TEMP 25
.OP
.OPTIONS LIST NODE POST CAPTAB
.tran 'simt/10' simt
.measure tran leakage avg I(Vin)
.end

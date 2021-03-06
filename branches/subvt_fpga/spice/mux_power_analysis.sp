**********************
* Test Bench Usage: mux2_delay_power
* Include Technology Library
.include '/home/xitang/tangxifan-eda-tools/branches/subvt_fpga/process/45nm_HP.pm'  
*Include  ELC NMOS and PMOS Package
.include '/home/xitang/tangxifan-eda-tools/branches/subvt_fpga/spice/elc_nmos_pmos.sp'

*Design Parameters
.param beta = 1.4
.param nl = 45n
.param pl = 45n
.param wn = 160n
.param wp = 160n
* Working Temperature
.temp 25
* Global Nodes
.global vdd vdd_load
* Print Node Capacitance
.option captab
* Print Waveforms
.option POST
.param vsp=0.85
* Parameters for Measuring Slew
.param slew_upper_threshold_pct_rise=0.95
.param slew_lower_threshold_pct_rise=0.05
.param slew_upper_threshold_pct_fall=0.05
.param slew_lower_threshold_pct_fall=0.95
* Parameters for Measuring Delay
.param input_threshold_pct_rise=0.5
.param input_threshold_pct_fall=0.5
.param output_threshold_pct_rise=0.5
.param output_threshold_pct_fall=0.5
.param input_pwl=0.5e-09
.param input_pwh=3.5e-09
.param input_slew=300e-12
.param rhrs = 1e6
* Include Circuits Library
.include /home/xitang/tangxifan-eda-tools/branches/subvt_fpga/spice/inv_buf.sp
.subckt tapbuf_size64 in out svdd sgnd
Xinvlvl0_no0_tapbuf in_lvl0 in_lvl1 svdd sgnd inv size=1
Xinvlvl1_no0_tapbuf in_lvl1 in_lvl2 svdd sgnd inv size=1
Xinvlvl1_no1_tapbuf in_lvl1 in_lvl2 svdd sgnd inv size=1
Xinvlvl1_no2_tapbuf in_lvl1 in_lvl2 svdd sgnd inv size=1
Xinvlvl1_no3_tapbuf in_lvl1 in_lvl2 svdd sgnd inv size=1
Xinvlvl2_no0_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no1_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no2_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no3_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no4_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no5_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no6_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no7_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no8_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no9_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no10_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no11_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no12_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no13_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no14_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Xinvlvl2_no15_tapbuf in_lvl2 in_lvl3 svdd sgnd inv size=1
Rin in in_lvl0 0
Rout in_lvl3 out 0
.eom

* SRAM 2:1 MUX
Xsram_mux2to1 sram_mux_in0_inv sram_mux_in1_inv sel0 sel_inv0 sram_mux_out_inv vdd_sram_mux 0 mux2to1
Xsram_in0 in0 sram_mux_in0_inv vdd_sram_mux 0 inv
Xsram_in1 in1 sram_mux_in1_inv vdd_sram_mux 0 inv
*Xsram_in_out sram_mux_out_inv sram_mux_out vdd_sram_mux 0 inv
Xsram_in_out sram_mux_out_inv sram_mux_out vdd_sram_mux 0 tapbuf_size64
* RRAM 2:1 MUX
*Xrram_mux2to1 rram_mux_in0_inv rram_mux_in1_inv sel0 sel_inv0 rram_mux_out_inv vdd_rram_mux 0 mux2to1_rram ron=1.9e3 wprog=2.4 roff='rhrs'
*Xrram_in0 in0 rram_mux_in0_inv vdd_rram_mux 0 inv
*Xrram_in1 in1 rram_mux_in1_inv vdd_rram_mux 0 inv
*Xrram_in_out rram_mux_out_inv rram_mux_out vdd_rram_mux 0 inv
*Xrram_in_out rram_mux_out_inv rram_mux_out vdd_rram_mux 0 tapbuf_size64
*Xrram_prog0 rram_mux_in1_inv 0 0 0 elc_nmos L=nl W='wn*2.4'
*Xrram_prog1 rram_mux_out_inv 0 0 0 elc_nmos L=nl W='wn*2.4'
* RRAM 2:1 MUX sized 
*Xrram_sized_mux2to1 rram_sized_mux_in0_inv rram_sized_mux_in1_inv sel0 sel_inv0 rram_sized_mux_out_inv vdd_rram_sized_mux 0 mux2to1_rram ron=4.7e3 wprog=1 roff='rhrs'
*Xrram_sized_in0 in0 rram_sized_mux_in0_inv vdd_rram_sized_mux 0 inv
*Xrram_sized_in1 in1 rram_sized_mux_in1_inv vdd_rram_sized_mux 0 inv
*Xrram_sized_in_out rram_sized_mux_out_inv rram_sized_mux_out vdd_rram_sized_mux 0 inv
*Xrram_sized_in_out rram_sized_mux_out_inv rram_sized_mux_out vdd_rram_sized_mux 0 tapbuf_size64
*Xrram_sized_prog0 rram_sized_mux_in1_inv 0 0 0 elc_nmos L=nl W='wn*1'
*Xrram_sized_prog1 rram_sized_mux_out_inv 0 0 0 elc_nmos L=nl W='wn*1'
* Loads: inv1x
Xinv_load0 sram_mux_out inv_load_sram_mux_out vdd_load 0 inv size=64
*Xinv_load1 rram_mux_out inv_load_rram_mux_out vdd_load 0 inv size=64
*Xinv_load2 rram_sized_mux_out inv_load_rram_sized_mux_out vdd_load 0 inv size=64
* Supply voltage 
Vload_supply vdd_load 0 vsp
Vsp_sram_mux vdd_sram_mux 0 vsp
Vsp_rram_mux vdd_rram_mux 0 vsp
Vsp_rram_sized_mux vdd_rram_sized_mux 0 vsp
* Common Part Over.
Vsram0 sel0 0 vsp
Vinv_sram0 sel_inv0 0 0
*Vin0 in0 0 pwl(0 0 input_pwl 0 'input_pwl+input_slew' vsp 'input_pwl+input_slew+input_pwh' vsp)
*Vin1 in1 0 pwl(0 0 input_pwl 0 'input_pwl+input_slew' vsp 'input_pwl+input_slew+input_pwh' vsp)
Vin0 in0 0 pwl(0 vsp input_pwl vsp 'input_pwl+input_slew' 0 'input_pwl+input_slew+input_pwh' 0)
*Vin1 in1 0 pwl(0 vsp input_pwl vsp 'input_pwl+input_slew' 0 'input_pwl+input_slew+input_pwh' 0)
Vin1 in1 0 vsp
.param sim_end_time = 20e-9

.tran 1e-15 sim_end_time
.measure start_rise when v(in0)='slew_lower_threshold_pct_rise*vsp' rise=1
* SRAM MUX
.measure tran leakage_sram_mux avg p(vsp_sram_mux) from=0 to='input_pwl'
.measure tran delay_sram_mux trig v(in0) val='input_threshold_pct_rise*vsp' fall=1
+                            targ v(sram_mux_out) val='output_threshold_pct_rise*vsp' fall=1 td='input_pwl'
.measure tran slew_sram_mux trig v(in0) val='slew_lower_threshold_pct_rise*vsp' fall=1 td='input_pwl'
+                           targ v(sram_mux_out) val='slew_upper_threshold_pct_rise*vsp' fall=1 td='input_pwl'
.measure tran dynamic_sram_mux avg p(vsp_sram_mux) from='start_rise' to='start_rise+slew_sram_mux'
.measure tran switch_energy_sram_mux param='dynamic_sram_mux*slew_sram_mux'
.measure tran avg_power_sram_mux avg p(vsp_sram_mux) from='input_pwl' to=sim_end_time
* RRAM MUX
.measure tran leakage_rram_mux avg p(vsp_rram_mux) from=0 to='input_pwl'
.measure tran delay_rram_mux trig v(in0) val='input_threshold_pct_rise*vsp' rise=1
+                            targ v(rram_mux_out) val='output_threshold_pct_rise*vsp' rise=1 td='input_pwl'
.measure tran slew_rram_mux trig v(in0) val='slew_lower_threshold_pct_rise*vsp' rise=1 td='input_pwl'
+                           targ v(rram_mux_out) val='slew_upper_threshold_pct_rise*vsp' rise=1 td='input_pwl'
.measure tran dynamic_rram_mux avg p(vsp_rram_mux) from='start_rise' to='start_rise+slew_rram_mux'
.measure tran switch_energy_rram_mux param='dynamic_rram_mux*slew_rram_mux'
.measure tran avg_power_rram_mux avg p(vsp_rram_mux) from=0 to='4e-9'
* RRAM MUX Sized
.measure tran leakage_rram_sized_mux avg p(vsp_rram_sized_mux) from=0 to='input_pwl'
.measure tran delay_rram_sized_mux trig v(in0) val='input_threshold_pct_rise*vsp' rise=1
+                            targ v(rram_sized_mux_out) val='output_threshold_pct_rise*vsp' rise=1 td='input_pwl'
.measure tran slew_rram_sized_mux trig v(in0) val='slew_lower_threshold_pct_rise*vsp' rise=1 td='input_pwl'
+                           targ v(rram_sized_mux_out) val='slew_upper_threshold_pct_rise*vsp' rise=1 td='input_pwl'
.measure tran dynamic_rram_sized_mux avg p(vsp_rram_sized_mux) from='start_rise' to='start_rise+slew_rram_sized_mux'
.measure tran switch_energy_rram_sized_mux param='dynamic_rram_sized_mux*slew_rram_sized_mux'
.measure tran avg_power_rram_sized_mux avg p(vsp_rram_sized_mux) from=0 to='4e-9'
.end Sub-Vt MUX HSPICE Bench


########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

append search_path /home/IC/Projects/SYSTEM/rtl

###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Projects/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Projects/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Projects/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable

set synopsys_auto_setup true

# Formality Setup File

set_svf "/home/IC/Projects/SYSTEM/syn/$top_module.svf"


###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files

read_verilog -container Ref "ALU.v"
read_verilog -container Ref "PULSE_GEN.v"
read_verilog -container Ref "FIFO_MEM_CNTRL.v"
read_verilog -container Ref "FIFO_RD.v"
read_verilog -container Ref "DF_SYNC.v"
read_verilog -container Ref "FIFO_WR.v"
read_verilog -container Ref "ASYNC_FIFO.v"
read_verilog -container Ref "CLKDIV_MUX.v"
read_verilog -container Ref "CLK_Divider.v"
read_verilog -container Ref "CLK_GATE.v"
read_verilog -container Ref "DATA_SYNC.v"
read_verilog -container Ref "Register.v"
read_verilog -container Ref "RST_SYNC.v"
read_verilog -container Ref "SYS_CTRL.v"
read_verilog -container Ref "data_sampling.v"
read_verilog -container Ref "deserializer.v"
read_verilog -container Ref "edge_bit_counter.v"
read_verilog -container Ref "parity_check.v"
read_verilog -container Ref "Stop_check.v"
read_verilog -container Ref "start_check.v"
read_verilog -container Ref "UART_RX.v"
read_verilog -container Ref "FSM_RX.v"
read_verilog -container Ref "MUX.v"
read_verilog -container Ref "ParityCalc.v"
read_verilog -container Ref "serializer.v"
read_verilog -container Ref "FSM_TX.v"
read_verilog -container Ref "UART_TX.v"
read_verilog -container Ref "UART.v"
read_verilog -container Ref "system_top.v"
# Read Reference technology libraries

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design
set_reference_design $top_module
set_top $top_module

###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -container Imp -netlist "/home/IC/Projects/SYSTEM/syn/netlists/$top_module.v"

read_db -container Imp  "$SSLIB"
read_db -container Imp "$FFLIB"
read_db -container Imp "$TTLIB"
set_implementation_design $top_module
set_top $top_module
# Read Implementation technology libraries


# set the top Implementation Design



###################### Matching Compare points ####################

match


######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"



start_gui


vlib work
vlog rtl/*.v
vlog TB/*.v
vsim -voptargs=+accs work.SYSTEM_TOP_TB
do wave.do
run -all

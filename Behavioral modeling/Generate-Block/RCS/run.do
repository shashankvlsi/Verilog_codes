.main clear
vlog rcs.v +acc
vsim tb
add wave *
run -all
#vsim -debugdb tb

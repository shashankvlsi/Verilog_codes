.main clear
vlog rca.v +acc
vsim tb
add wave *
run -all
vsim -debugdb tb

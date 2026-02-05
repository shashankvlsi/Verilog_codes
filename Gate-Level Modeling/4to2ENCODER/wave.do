onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /encoder4to2_tb/i1
add wave -noupdate /encoder4to2_tb/i2
add wave -noupdate /encoder4to2_tb/i3
add wave -noupdate /encoder4to2_tb/i4
add wave -noupdate /encoder4to2_tb/y1
add wave -noupdate /encoder4to2_tb/y2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1833 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {126 ns}

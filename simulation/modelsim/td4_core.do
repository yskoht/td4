onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider td4_core
add wave -noupdate /td4_bench/u_td4/u_td4_core/clock_in
add wave -noupdate /td4_bench/u_td4/u_td4_core/n_reset_in
add wave -noupdate /td4_bench/u_td4/u_td4_core/iport_data
add wave -noupdate /td4_bench/u_td4/u_td4_core/oport_data
add wave -noupdate -divider divider
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_divider/clock_in
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_divider/n_reset_in
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_divider/clock_out
add wave -noupdate -divider reset
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_reset/n_reset_out
add wave -noupdate -divider counter
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_counter/carry
add wave -noupdate -divider registers
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/enable
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/n_load
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/iport_data
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/data_in
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/sel
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/data_out_a
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/data_out_b
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/register_data
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/counter_data
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_registers/oport_data
add wave -noupdate -divider rom
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_rom/address
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_rom/q
add wave -noupdate -divider decoder
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_decoder/op
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_decoder/cflag
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_decoder/sel
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_decoder/n_load
add wave -noupdate -divider alu
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_alu/data_in_a
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_alu/data_in_b
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_alu/data_out
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_alu/data_out_c
add wave -noupdate -divider d_ff
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_d_ff/n_load
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_d_ff/data_in
add wave -noupdate /td4_bench/u_td4/u_td4_core/u_d_ff/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {311819 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 330
configure wave -valuecolwidth 106
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
WaveRestoreZoom {165593 ps} {1478093 ps}

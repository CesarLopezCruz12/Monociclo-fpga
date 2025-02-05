onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /monocliclo_tb/clk_i
add wave -noupdate /monocliclo_tb/rst_ni
add wave -noupdate /monocliclo_tb/monitor_o
add wave -noupdate -divider FETCH
add wave -noupdate /monocliclo_tb/DUT/pc_w
add wave -noupdate /monocliclo_tb/DUT/pcnext_w
add wave -noupdate /monocliclo_tb/DUT/icache_u0/addrrd_i
add wave -noupdate /monocliclo_tb/DUT/icache_u0/inst_o
add wave -noupdate /monocliclo_tb/DUT/icache_u0/memory
add wave -noupdate -divider DECODE
add wave -noupdate /monocliclo_tb/DUT/decode_u0/opcode_i
add wave -noupdate /monocliclo_tb/DUT/decode_u0/regwrite_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/alusrc_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/memread_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/memwrite_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/memtoreg_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/branch_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/aluop_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ns} {1 us}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /monocliclo_tb/clk_i
add wave -noupdate /monocliclo_tb/monitor_o
add wave -noupdate /monocliclo_tb/rst_ni
add wave -noupdate -divider FETCH
add wave -noupdate /monocliclo_tb/DUT/if_inst_o
add wave -noupdate /monocliclo_tb/DUT/pc_w
add wave -noupdate /monocliclo_tb/DUT/pcnext_w
add wave -noupdate -divider DECODE
add wave -noupdate /monocliclo_tb/DUT/decode_u0/aluop_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/alusrc_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/branch_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/memread_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/memtoreg_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/memwrite_o
add wave -noupdate /monocliclo_tb/DUT/decode_u0/opcode_i
add wave -noupdate /monocliclo_tb/DUT/decode_u0/regwrite_o
add wave -noupdate -divider REGISTERFILE
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/addrrd_i
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/addrs1_i
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/addrs2_i
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/clk_i
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/datord_i
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/dators1_o
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/dators2_o
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/regfile
add wave -noupdate /monocliclo_tb/DUT/regfile_u0/writeen_i
add wave -noupdate -divider {SIGN EXTENDED}
add wave -noupdate /monocliclo_tb/DUT/signext_u0/datoext_i
add wave -noupdate /monocliclo_tb/DUT/signext_u0/opcode_i
add wave -noupdate /monocliclo_tb/DUT/signext_u0/result
add wave -noupdate /monocliclo_tb/DUT/signext_u0/signext_o
add wave -noupdate -divider {ALU CTRL}
add wave -noupdate /monocliclo_tb/DUT/aluctrl_u0/aluop_i
add wave -noupdate /monocliclo_tb/DUT/aluctrl_u0/aluoperacion_o
add wave -noupdate /monocliclo_tb/DUT/aluctrl_u0/f3_i
add wave -noupdate /monocliclo_tb/DUT/aluctrl_u0/f7_i
add wave -noupdate -divider DCHACHE
add wave -noupdate /monocliclo_tb/DUT/dcache_u0/addr_i
add wave -noupdate /monocliclo_tb/DUT/dcache_u0/clk_i
add wave -noupdate /monocliclo_tb/DUT/dcache_u0/datacache
add wave -noupdate /monocliclo_tb/DUT/dcache_u0/dato_i
add wave -noupdate /monocliclo_tb/DUT/dcache_u0/dato_o
add wave -noupdate /monocliclo_tb/DUT/dcache_u0/readen_i
add wave -noupdate /monocliclo_tb/DUT/dcache_u0/writeen_i
add wave -noupdate -divider ICACHE
add wave -noupdate /monocliclo_tb/DUT/icache_u0/addrrd_i
add wave -noupdate /monocliclo_tb/DUT/icache_u0/inst_o
add wave -noupdate /monocliclo_tb/DUT/icache_u0/memory
add wave -noupdate -divider ALU
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/A_i
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/B_i
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/branch_i
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/brflag_i
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/c_o
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/ope_i
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/res_w
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/salAlu_w
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/salmux_o
add wave -noupdate /monocliclo_tb/DUT/AluFinal_u0/sel_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {270 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 315
configure wave -valuecolwidth 634
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
WaveRestoreZoom {0 ns} {438 ns}

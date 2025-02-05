onerror {resume}
quietly set dataset_list [list vsim sim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate sim:/monociclo/clk_i
add wave -noupdate sim:/monociclo/rst_ni
add wave -noupdate sim:/monociclo/monitor_o
add wave -noupdate -divider FETCH
add wave -noupdate sim:/monociclo/pc_w
add wave -noupdate sim:/monociclo/pcnext_w
add wave -noupdate sim:/monociclo/if_inst_o
add wave -noupdate -divider DECODE
add wave -noupdate sim:/monociclo/id_regwrite_o
add wave -noupdate sim:/monociclo/id_alusrc_o
add wave -noupdate sim:/monociclo/id_memread_o
add wave -noupdate sim:/monociclo/id_memwrite_o
add wave -noupdate sim:/monociclo/id_memtoreg_o
add wave -noupdate sim:/monociclo/id_branch_o
add wave -noupdate sim:/monociclo/id_aluop_o
add wave -noupdate -divider READREGISTER
add wave -noupdate sim:/monociclo/rr_dators1_o
add wave -noupdate sim:/monociclo/rr_dators2_o
add wave -noupdate sim:/monociclo/wb_dato_o
add wave -noupdate -divider SIGNEXTEND
add wave -noupdate sim:/monociclo/signext_dato_o
add wave -noupdate -divider ALUCTRL
add wave -noupdate sim:/monociclo/aluctrl_aluoperacion_o
add wave -noupdate -divider {SL TO}
add wave -noupdate sim:/monociclo/sl_dato_o
add wave -noupdate sim:/monociclo/to_dato_o
add wave -noupdate sim:/monociclo/and_flag_o
add wave -noupdate -divider {MULTIPLEXOR ALU}
add wave -noupdate sim:/monociclo/rr_dators2_o
add wave -noupdate sim:/monociclo/mux_dato_o
add wave -noupdate -divider REXECUTE
add wave -noupdate sim:/monociclo/mux_dato_o
add wave -noupdate sim:/monociclo/c_o
add wave -noupdate sim:/monociclo/rr_dators1_o
add wave -noupdate sim:/monociclo/ex_dato_o
add wave -noupdate sim:/monociclo/ex_brflag_o
add wave -noupdate sim:/monociclo/aluctrl_aluoperacion_o
add wave -noupdate -divider {MEMORY ACCESS}
add wave -noupdate sim:/monociclo/mem_dato_o
add wave -noupdate -divider WB
add wave -noupdate sim:/monociclo/wb_dato_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {52 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 197
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
WaveRestoreZoom {0 ns} {962 ns}

module muxAlu(
    input [31:0] Alures_i,
    input [31:0] res_i,
    input s_i,
    output [31:0] SalMuxAlu_o
);

assign SalMuxAlu_o = (s_i) ? res_i : Alures_i;

endmodule 
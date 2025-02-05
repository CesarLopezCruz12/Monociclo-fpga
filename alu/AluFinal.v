module AluFinal(
      input  [31:0]  A_i,
	   input  [31:0]  B_i,
	   input  [3:0]   ope_i,
		input          sel_i,
		output         brflag_i,
		input          branch_i,
		input  [2:0]   brctrl_i,
 		output         c_o,
	   output [31:0]  salmux_o
); 

 wire [31:0]   salAlu_w;
 reg  [31:0]	salAlu_ext;
 wire [31:0]   res_w;

	aluN execute_u0(
		.A_i			(A_i),
		.B_i			(B_i),
		.c_i			(sel_i),
		.ope_i		(ope_i),
		.branch_i 	(branch_i),
		.brctrl_i	(brctrl_i),
		.brflag_o  	(brflag_i),
		.c_o			(c_o),
		.sal_o		(salAlu_w)
	);
	
	
	AluChikita  AluChikita_u0(
    .dators1_i (A_i),
    .salmux_i (B_i),
    .sel_i    (ope_i),   //datos de alu control cambiando a 4
    .res_o     (res_w)
);

	always @(*)
begin 
    case(ope_i)
    4'b0111: // Tipo SLT
        salAlu_ext = {31'b0,salAlu_w[31]};
    
    default:
        salAlu_ext = salAlu_w;
    endcase
end

	assign salmux_o = (ope_i[3]) ?  res_w : salAlu_ext ;

    /*muxAlu  muxAlu_u0(
    .Alures_i (salAlu_w),
    .res_i    (res_w),
    .s_i      (ope_i[3]),
    .SalMuxAlu_o (salmux_o)
);*/



endmodule 
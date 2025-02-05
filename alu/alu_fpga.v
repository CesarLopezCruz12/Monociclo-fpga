module alu_fpga (
	input	[3:0] dira_i,
	input	[3:0] dirb_i,
	input c_i,
	input [2:0] operacion_i,
	output c_o,
	output [6:0] disp0,
	output [6:0] disp1,
	output [6:0] disp2,
	output [6:0] disp3,
	output [6:0] disp4,
	output [6:0] disp5,
	output [6:0] disp6,
	output [6:0] disp7
	
);
wire	[31:0] operadora_w;
wire	[31:0] operadorb_w;
wire	[31:0] resultado_w;

//instancia de ROM para A
rom rom_a(
	.dir_rom	(dira_i),
	.salida_rom	(operadora_w)
);
//instancia de ROM para B
rom rom_b(
	.dir_rom	(dirb_i),
	.salida_rom	(operadorb_w)
);

//instancia
aluN #(
	.N	(32)
)
alu
(
	.A_i		(operadora_w),
	.B_i		(operadorb_w),
	.c_i		(c_i),
	.ope_i	(operacion_i),
	.c_o		(c_o),
	.sal_o	(resultado_w)
);

//instancia de displays
disp7segs disp_0(
	.entrada_i (resultado_w[3:0]),
	.salida_o (disp0)
);

disp7segs disp_1(
	.entrada_i (resultado_w[7:4]),
	.salida_o (disp1)
);

disp7segs disp_2(
	.entrada_i (resultado_w[11:8]),
	.salida_o (disp2)
);

disp7segs disp_3(
	.entrada_i (resultado_w[15:12]),
	.salida_o (disp3)
);

disp7segs disp_4(
	.entrada_i (resultado_w[19:16]),
	.salida_o (disp4)
);

disp7segs disp_5(
	.entrada_i (resultado_w[23:20]),
	.salida_o (disp5)
);

disp7segs disp_6(
	.entrada_i (resultado_w[27:24]),
	.salida_o (disp6)
);

disp7segs disp_7(
	.entrada_i (resultado_w[31:28]),
	.salida_o (disp7)
);

endmodule
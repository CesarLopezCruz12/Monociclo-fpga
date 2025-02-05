module monociclo_fpga(
	input clk_i,
	input rst_ni,
	output [6:0] disp0,
	output [6:0] disp1,
	output [6:0] disp2,
	output [6:0] disp3,
	output [6:0] disp4,
	output [6:0] disp5,
	output [6:0] disp6,
	output [6:0] disp7
	

);
	
	wire	[31:0] monitor_o;
	wire	[31:0] monitori_o;
	
	wire 				clk1hz_w;
	
	
divisor50mhz  div50_u0(
	.clk_i		(clk_i),
	.rst_ni		(rst_ni),
	.clk1hz_o	(clk1hz_w)

);
	
 monociclo DUT(

		.clk_i		(clk1hz_w),
		.rst_ni		(rst_ni),
	   .monitor_o	(monitor_o)
);


//instancia de displays
disp7segs disp_0(
	.entrada_i (monitor_o[3:0]),
	.salida_o (disp0)
);

disp7segs disp_1(
	.entrada_i (monitor_o[7:4]),
	.salida_o (disp1)
);

disp7segs disp_2(
	.entrada_i (monitor_o[11:8]),
	.salida_o (disp2)
);

disp7segs disp_3(
	.entrada_i (monitor_o[15:12]),
	.salida_o (disp3)
);

disp7segs disp_4(
	.entrada_i (monitor_o[19:16]),
	.salida_o (disp4)
);

disp7segs disp_5(
	.entrada_i (monitor_o[23:20]),
	.salida_o (disp5)
);

disp7segs disp_6(
	.entrada_i (monitor_o[27:24]),
	.salida_o (disp6)
);

disp7segs disp_7(
	.entrada_i (monitor_o[31:28]),
	.salida_o (disp7)
);

endmodule
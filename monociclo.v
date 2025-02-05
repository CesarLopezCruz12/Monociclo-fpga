module monociclo (

	input 	clk_i,
	input		rst_ni,
	output	[31:0] monitor_o
);
	
	
	/////SECCION DE DEFINICION DE SEÑALES
	
	reg  	[31:0] 	pc_w;
	wire 	[31:0] 	pcnext_w;
	wire 	[31:0]  	if_inst_o;
	wire 				id_regwrite_o;
	wire				id_alusrc_o;
	wire 	[31:0]	signext_dato_o;
	wire 	[31:0]	mux_dato_o;
	wire				id_memread_o;
	wire				id_memwrite_o;
	wire				id_memtoreg_o;
	wire 				id_branch_o;
	//wire				id_zerom_o;
	wire				id_jump_o;
	wire           or_brach_o;
	wire 				c_o;
	wire	[31:0]	rr_dators1_o;
	wire	[31:0]	rr_dators2_o;
	wire	[31:0]	wb_dato_o;
	wire 	[31:0] 	ex_dato_o;
	wire 	[31:0] 	mem_dato_o;
	wire	[31:0]	sl_dato_o;
	wire	[31:0]	to_dato_o;
	wire				and_flag_o;
	wire				ex_brflag_o;
	wire	[2:0]    brctrl_w;
	wire 	[4:0]    id_aluop_o;
	wire  [3:0] 	aluctrl_aluoperacion_o;
	
	
	/////SECCION DE ASIGNACION DE MONITOREO
	///////////////////////////////////////////assign 		monitor_o = wb_dato_o;
	
	assign 		monitor_o = wb_dato_o;
	//assign         monitor_o = if_inst_o;

///////-------------------------------------------------------------------------------------
/////// Fecth Stage - If
///////-------------------------------------------------------------------------------------

	always@(posedge clk_i, negedge rst_ni)
	begin
		if(!rst_ni)
			pc_w = 32'b0;
		else
			pc_w = pcnext_w;
	end
	
	
	
	icache icache_u0(
		.addrrd_i	(pc_w[9:2]),
		.inst_o		(if_inst_o)
	);
	
	
	
///////--------------------------------------------------------------------------------------
////             DECODE STAGE - ID
///////--------------------------------------------------------------------------------------
	decode decode_u0(
		.opcode_i	(if_inst_o[6:0]),
		.regwrite_o	(id_regwrite_o),
		.alusrc_o	(id_alusrc_o),
		.memread_o	(id_memread_o),
		.memwrite_o	(id_memwrite_o),
		.memtoreg_o (id_memtoreg_o),
		.branch_o	(id_branch_o),
		//.zerom_o    (id_zerom_o),
		.jump_o		(id_jump_o),
		.aluop_o    (id_aluop_o)
	);

///////--------------------------------------------------------------------------------------
////            	READ REGISTER STAGE - RR
///////--------------------------------------------------------------------------------------

	registerfile regfile_u0(
		.clk_i			(clk_i),
		.writeen_i		(id_regwrite_o),
		.addrrd_i		(if_inst_o[11:7]),
		.addrs1_i		(if_inst_o[19:15]),
		.addrs2_i		(if_inst_o[24:20]),
		.datord_i		(wb_dato_o),
		.dators1_o		(rr_dators1_o),
		.dators2_o		(rr_dators2_o)

	);
	
///////---------------------------------------------------------------------------------------
////            	SIGN-EXTEND STAGE - SIGNEX
///////---------------------------------------------------------------------------------------
	
	sign_extension signext_u0 (
		.opcode_i		(if_inst_o[6:0]),
		.datoext_i		(if_inst_o),   
		.signext_o		(signext_dato_o)   
	);
	
///////---------------------------------------------------------------------------------------
////            	SHIFT LEFT STAGE - SL
////              TARGET OFFSET  STAGE- TO
///////---------------------------------------------------------------------------------------
	
	assign sl_dato_o = signext_dato_o;
	assign to_dato_o = sl_dato_o + pc_w;
	assign and_flag_o = ex_brflag_o & id_branch_o; //| id_branch_o & id_zerom_o;
	assign or_brach_o  = and_flag_o | id_jump_o;
	assign pcnext_w = (or_brach_o) ? to_dato_o : pc_w + 4'h4;
	
	
	
///////--------------------------------------------------------------------------------------
////            	ALU CONTROL  - ALUCTRL
///////--------------------------------------------------------------------------------------
	
	aluctrl aluctrl_u0(
		.f7_i				(if_inst_o[30]),
		.f3_i				(if_inst_o[14:12]),
		.aluop_i			(id_aluop_o),
		.aluoperacion_o 	(aluctrl_aluoperacion_o),
		.brctrl_o         (brctrl_w)
	);

	
///////--------------------------------------------------------------------------------------
////            	MULTIPLEXOR ALU STAGE - MUX
///////--------------------------------------------------------------------------------------
	
	assign mux_dato_o = (id_alusrc_o) ? signext_dato_o : rr_dators2_o;
	
///////--------------------------------------------------------------------------------------
////            	REXECUTE STAGE - EX
///////-------------------------------------------------------------------------------------

	
			AluFinal AluFinal_u0(
			.A_i (rr_dators1_o),
			.B_i  (mux_dato_o),
			.ope_i (aluctrl_aluoperacion_o),
			.sel_i (aluctrl_aluoperacion_o[2]),
			.brflag_i  (ex_brflag_o),
			.brctrl_i	(brctrl_w),	
			.branch_i (id_branch_o),
			.c_o (c_o),
			.salmux_o (ex_dato_o)
	      );
	
///////------------------------------------------------------------------------------------------
////            	MEMORY ACCESS STAGE - MEM	
///////------------------------------------------------------------------------------------------
	
	dcache  dcache_u0(
	.clk_i			(clk_i),
	.writeen_i		(id_memwrite_o),
	.readen_i		(id_memread_o),
	.addr_i			(ex_dato_o[6:2]),
	.dato_i			(rr_dators2_o),
	.dato_o			(mem_dato_o)

);

	


	
///////---------------------------------------------------------------------------------------
////            	WRITE BACKE STAGE - WB
///////---------------------------------------------------------------------------------------
	assign 	wb_dato_o = (id_memtoreg_o) ? mem_dato_o : ex_dato_o;
	
	
	
	
endmodule




// Banco de Pruebas - Test Bench
// 1er paso - modulo de testbench, sin puertos

module monocliclo_tb();

// 2do paso - input pasa a ser reg, output pasa a ser wire

	reg				 	clk_i;
	reg					rst_ni;
	wire			[31:0] monitor_o;
	
	// 3er paso - iniciar valores
	initial
		begin
			clk_i = 1'b1;
			rst_ni = 1'b0;
			#100
				rst_ni = 1'b1;
			
		end
	// 4to paso - Instancia del módulo a verificar
	
	monociclo DUT(
		.clk_i		(clk_i),
		.rst_ni		(rst_ni),
		.monitor_o	(monitor_o)
	);
	
	// 5to paso - Modificar valores
	always 
		begin
			#50
				clk_i = ~clk_i;
		end
		
endmodule 


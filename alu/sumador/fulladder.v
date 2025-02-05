module fulladder (
	input					a_i,
	input					b_i,
	input					c_i,
	output				c_o,
	output				res_o
);
	//wire					wirexor1_w;
	wire					wireand1_w;
	wire					wireand2_w;
	wire					wireand3_w;
	
	assign	wireand1_w = c_i & a_i;
	assign	wireand2_w = c_i & b_i;
	assign	wireand3_w = b_i & a_i;
	
	//assign	wirexor1_w = a_i ^ b_i;
	assign	c_o		  = wireand1_w  | wireand2_w |wireand3_w;
	assign	res_o		  = a_i ^ b_i ^ c_i;
endmodule 


// Banco de Pruebas - Test Bench
// 1er paso - modulo de testbench, sin puertos

module fulladder_tb();

// 2do paso - input pasa a ser reg, output pasa a ser wire

	reg					a_i;
	reg					b_i;
	reg					c_i;
	wire				   c_o;
	wire				   res_o;
	
	// 3er paso - iniciar valores
	initial
		begin
			a_i = 1'b0;
			b_i = 1'b0;
			c_i = 1'b0;
		end
	// 4to paso - Instancia del módulo a verificar
	
	fulladder DUT(
		.a_i		(a_i),
		.b_i		(b_i),
		.c_i		(c_i),
		.c_o		(c_o),
		.res_o	(res_o)
	);
	
	// 5to paso - Modificar valores
	always 
		begin
			#100
				a_i = 1'b1;
				b_i = 1'b0;
				c_i = 1'b0;
			#100
				a_i = 1'b0;
				b_i = 1'b1;
				c_i = 1'b0;
			#100
				a_i = 1'b0;
				b_i = 1'b0;
				c_i = 1'b1;
			#100
				a_i = 1'b1;
				b_i = 1'b1;
				c_i = 1'b0;
			#100
				a_i = 1'b0;
				b_i = 1'b1;
				c_i = 1'b1;
			#100
				a_i = 1'b1;
				b_i = 1'b0;
				c_i = 1'b1;
			#100
				a_i = 1'b1;
				b_i = 1'b1;
				c_i = 1'b1;
		end
		
endmodule 
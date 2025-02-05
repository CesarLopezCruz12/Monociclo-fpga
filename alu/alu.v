module alu (
	input				a_i,
	input				b_i,
	input				c_i,
	input		[2:0]	sel_i,
	input				set_i,
	input 			invert_i,
	output reg		res_o,
	output			c_o
);
	wire			wireand1_w;
	wire			wireor1_w;
	wire			wiresume_w;
	wire			nob_w;
	wire		   b_w;
	wire			wirexor2_w;
	
   assign		nob_w			=	~b_i;
	assign		b_w			=	(invert_i) ? nob_w : b_i;
	
	assign		wireand1_w	=	a_i & b_w;
	assign		wireor1_w	=	a_i | b_w;
	assign		wirexor2_w =	a_i ^ b_w;
	
	fulladder fa(
		.a_i			(a_i),
		.b_i			(b_w),
		.c_i			(c_i),
		.c_o			(c_o),
		.res_o		(wiresume_w)
	);	
	
	always @(*)
	begin
		
		case (sel_i)
			3'b010:
					res_o	= wiresume_w; // suma
			3'b110:
					res_o = wiresume_w; // resta 
			3'b001:
					res_o = wireor1_w; // or
			3'b000:
					res_o	= wireand1_w;	// and
			3'b111:
					res_o	= wiresume_w;		// chechar SLT como se realiza
			3'b100:
					res_o = wiresume_w;		// checar SLTU como se realiza
			3'b101:
					res_o	= wirexor2_w;	// XOR
			default:
					res_o	= 1'b0;
		endcase
	
		
	end
	
	
	//assign		res_o			=	(sel_i==1'b1) ? wireor1_w : wireand1_w;
endmodule 
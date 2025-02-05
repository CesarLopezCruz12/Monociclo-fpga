module AluChikita(
    input [31:0]        dators1_i,
    input [31:0]       	salmux_i,
    input [3:0]	  		sel_i,   //datos de alu control cambiando a 4
    output reg  [31:0]  res_o
); 


  	always @(*)
	begin
		case (sel_i)
			4'b1001: //Shift Left Logical
					res_o	= dators1_i << salmux_i ;
			4'b1010://Shift Right Logical
					res_o =  dators1_i >> salmux_i ;

			4'b1011: //Shift Left Aritmetic
					res_o	= dators1_i >>> salmux_i;
			default:
					res_o	= 32'b0;

		endcase
	end

endmodule 
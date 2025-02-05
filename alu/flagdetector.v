module flagdetector (

	input  						branch_i,
	input							set_i,
	input 						c_i,
	input				[2:0]		brctrl_i,
	input				[31:0]	resultado_i,
	output reg					brflag_o
);


	always @(*)
		begin
			if(branch_i)
				case (brctrl_i)
					3'b000:       // BEQ
						if(resultado_i == 32'b0)
							brflag_o = 1'b1;
						else
							brflag_o = 1'b0;
					3'b001:       // BNE
						if(resultado_i == 32'b0)
							brflag_o = 1'b0;
						else
							brflag_o = 1'b1;
					3'b100:       // BLT
						if(set_i == 1'b0)
							brflag_o = 1'b0;
						else
							brflag_o = 1'b1;
					3'b101:       // BGE
						if(set_i == 1'b0)
							brflag_o = 1'b1;
						else
							brflag_o = 1'b0;
					3'b110:       // BLTU
						if(c_i == 1'b0)
							brflag_o = 1'b1;
						else
							brflag_o = 1'b0;
					3'b111:       // BGEU
						if(c_i == 1'b0)
							brflag_o = 1'b0;
						else
							brflag_o = 1'b1;
				endcase
			else
				brflag_o = 1'b0;
			end
endmodule


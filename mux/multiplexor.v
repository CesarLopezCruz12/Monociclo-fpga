module mux (
	input		[31:0] dators2_i,
	input 	[63:0] signect_i,
	input				 ALUSrc_i,
	output reg	[31:0] salmux_o	
);

always @(*) 
begin
	if (ALUSrc_i) 
		begin
			salmux_o = signect_i[31:0];
		end
	else
		begin
			salmux_o = dators2_i;
		end
end
endmodule
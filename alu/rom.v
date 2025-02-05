module rom(
	input [2:0] dir_rom,
	output reg [31:0] salida_rom
);

 always @(*)
 begin
	case (dir_rom)
        3'b000:
                salida_rom = 32'h00000001;
        3'b001:
                salida_rom = 32'h00000000;
        3'b010:
                salida_rom = 32'h93Fb6247;
        3'b011:
                salida_rom = 32'hAE5F78C0;
        3'b100:
                salida_rom = 32'h3641A7E9;
        3'b101:
                salida_rom = 32'h0C2389d6;
        3'b110:
                salida_rom = 32'h84A0CE72;
        3'b111:
                salida_rom = 32'hb6510Fd7;
	endcase
 end
 endmodule
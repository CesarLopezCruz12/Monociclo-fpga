module sign_extension(
    input   [6:0]      	opcode_i,
    input   [31:0] 		datoext_i,   // Valor inmediato de 32 bits
    output  [31:0] 		signext_o   // Valor inmediato extendido de 64 bits
);

reg [31:0] result; // Variable interna

always @(*)
begin 
    case(opcode_i)
    7'b0110011: // Tipo R
        result = 32'b0;
    7'b0010011: // Tipo I
        result = {{20{datoext_i[31]}}, datoext_i[31:20]};
    7'b0100011: // Tipo S
        result = {{20{datoext_i[31]}}, datoext_i[31:25], datoext_i[11:7] };
    7'b0000011: // Tipo L
        result = {{20{datoext_i[31]}}, datoext_i[31:20]};
	 7'b1100011: // Tipo B
		  result = { {20{datoext_i[31]}}, datoext_i[7], datoext_i[30:25], datoext_i[11:8] , 1'b0};
	 7'b1101111: // Tipo J
		  result = { {12{datoext_i[31]}}, datoext_i[19:12], datoext_i[20], datoext_i[30:21] ,1'b0};
    default:
        result = 32'b0;
    endcase
end

 //7 8 9 10 11 25 26 27 28 29 30 31 
 //1 2 3 4   5  6  7  8 9  10 11 12
assign signext_o = result; // Asignar la variable interna a la salida
endmodule

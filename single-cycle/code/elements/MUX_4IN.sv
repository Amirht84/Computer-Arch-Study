module MUX_4IN(A, B, C, D, Y, sel);
	input [31:0] A, B, C, D;
	output reg [31:0] Y;
	input sel;

	always @(A, B, C, D, sel) begin
		Y = 32'b0;
		case(sel)
			2'b00: Y = A;
			2'b01: Y = B;
			2'b10: Y = C;
			2'b11: Y = D;
		endcase
	end
endmodule

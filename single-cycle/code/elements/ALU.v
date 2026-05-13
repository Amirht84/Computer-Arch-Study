module ALU(A, B, f, Y, zer, lt);
	input [31:0] A, B;
	input [2:0] f;
	output reg [31:0] Y;
	output zer;
	output lt;

	always @(A, B, f) begin
		Y = 32'b0;
		case(f) begin
			3'b000: Y = A + B;
			3'b001: Y = A - B;
			3'b010: Y = A & B;
			3'b011: Y = A | B;
			3'b101: Y = {31'b0, (A < B)};
		endcase
	end
	assign zer = ~|Y;
	assign lt = Y[0];
endmodule

module ALU(A, B, f, Y, zer, lt);
	input [31:0] A, B;
	input [2:0] f;
	output reg [31:0] Y;
	output zer;
	output lt;

	reg [31:0] C;//used temp

	always @(A, B, f) begin
		Y = 32'b0;
		C = 32'b0;
		case(f)
			3'b000: Y = A + B;
			3'b001: Y = A - B;
			3'b010: Y = A & B;
			3'b011: Y = A | B;
			3'b100: Y = A ^ B;
			3'b101: begin
				C = A - B;
				if(C[31] == 1'b0) begin
					Y = 32'b0;
				end else begin
					Y = {31'b0, 1'b1};
				end
			end
		endcase
	end
	assign zer = ~|Y;
	assign lt = Y[0];
endmodule

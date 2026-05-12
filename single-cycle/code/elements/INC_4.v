module INC_4(A, Y);
	input [31:0] A;
	output [31:0] Y;
	ADDER adder(.A(A), .B({29'b0, 3'b100}), .Y(Y));
endmodule

module MUX_2IN(A, B, Y, sel);
	input [31:0] A, B;
	input sel;
	output [31:0] Y;
	assign Y = sel ? B : A;
endmodule

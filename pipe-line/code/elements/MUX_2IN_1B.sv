module MUX_2IN_1B(A, B, Y, sel);
	input A, B, sel;
	output Y;
	assign Y = sel ? B : A;
endmodule

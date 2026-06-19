module PC_CNT(CondWrite,Write,Lt_Eq,Not,lt,zer,PCWrite);

	wire Y1,Y2,Y3;
	input CondWrite,Write,Lt_Eq,Not,lt,zer;
	output PCWrite;

	MUX_2IN_1B Mux(.A(zer), .B(lt), .sel(Lt_Eq), .Y(Y1));
	AND And(.A(Y1) , .B(CondWrite) , .Y(Y2));
	XOR Xor(.A(Y2) , .B(Not) , .Y(Y3));
	OR Or(.A(Y3) , .B(Write) , .Y(PCWrite));

endmodule

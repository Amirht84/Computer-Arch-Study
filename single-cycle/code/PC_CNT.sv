module PC_CNT(Branch,Jump,Lt_Eq,Not,lt,zer,PCSrc);

	wire Y1,Y2,Y3;
	input Branch,Jump,Lt_Eq,Not,lt,zer;
	output PCSrc;

	MUX_2IN Mux(.A(zer), .B(lt), .sel(Lt_Eq), .Y(Y1));
	AND And(.A(Y1) , .B(Branch) , .Y(Y2));
	XOR Xor(.A(Y2) , .B(Not) , .Y(Y3));
	OR Or(.A(Y3) , .B(Jump) , .Y(PCSrc));

endmodule

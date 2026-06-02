module CU(AddSrc,MemWrite,IRWrite,OldPCWrite,RegWrite,AluSrcA,AluSrcB,ResultSrc,ImmSrc,OP,Func3,Func7,PCWrite,ALUfunc,lt,zer);
	input [6:0] Func7,Op;
	input [2:0] Func3;
	input zer,lt;
	output AddSrc,MemWrite,IRWrite,OldPCWrite,RegWrite,AluSrcA,AluSrcB,ResultSrc;
	output [1:0] AluSrcA,AluSrcB,ResultSrc,ImmSrc;
	output [2:0] ALUfunc;

	wire [1:0] ALUOp;
	wire CondWrite,Write,Lt_Eq , Not;

	MAIN_CNT MCC(
		.Op(Op),
		.ALUOp(ALUOp),
		.AddSrc(AddSrc),
		.MemWrite(MemWrite), 
		.IRWrite(IRWrite), 
		.OldPCWrite(OldPCWrite), 
		.RegWrite(RegWrite), 
		.AluSrcA(AluSrcA), 
		.AluSrcB(AluSrcB), 
		.ResultSrc(ResultSrc), 
		.ImmSrc(ImmSrc)
		.CondWrite(CondWrite),
		.Write(Write)
	);

	FUNC_CNT FCC(
		.ALUOp(ALUOp),
		.Func3(Func3),
		.Func7(Func7),
		.ALUfunc(ALUfunc),
		.Lt_Eq(Lt_Eq),
		.Not(Not)
	);

	PC_CNT PCC(
		.CondWrite(CondWrite),
		.Write(Write),
		.Lt_Eq(Lt_Eq),
		.Not(Not),
		.lt(lt),
		.zer(zer),
		.PCSrc(PCSrc)
	);
endmodule

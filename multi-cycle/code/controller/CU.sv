module CU(AdrSrc,MemWrite,IRWrite,OldPCWrite,RegWrite,AluSrcA,AluSrcB,ResultSrc,ImmSrc,Op,Func3,Func7,PCWrite,ALUfunc,lt,zer, clk);
	input [6:0] Func7,Op;
	input [2:0] Func3;
	input zer,lt;
	output AdrSrc,MemWrite,IRWrite,OldPCWrite,RegWrite, PCWrite;
	output [1:0] AluSrcA,AluSrcB,ResultSrc,ImmSrc;
	output [2:0] ALUfunc;
	input clk;

	wire [1:0] ALUOp;
	wire CondWrite,Write,Lt_Eq , Not;

	MAIN_CNT MCC(
		.Op(Op),
		.ALUOp(ALUOp),
		.AdrSrc(AdrSrc),
		.MemWrite(MemWrite), 
		.IRWrite(IRWrite), 
		.OldPCWrite(OldPCWrite), 
		.RegWrite(RegWrite), 
		.AluSrcA(AluSrcA), 
		.AluSrcB(AluSrcB), 
		.ResultSrc(ResultSrc), 
		.ImmSrc(ImmSrc),
		.CondWrite(CondWrite),
		.Write(Write),
		.clk(clk)
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
		.PCSrc(PCWrite)
	);
endmodule

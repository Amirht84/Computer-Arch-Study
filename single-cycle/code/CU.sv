module CU(PCSrc,WSrc,RegWrite,ImmSrc,ALUSrc,ALUfunc,MemWrite,ResultSrc,AddSrc,Func3,Func7,Op,zer,lt);
	input [6:0] Func7,Op;
	input [2:0] Func3;
	input zer,lt;
	output PCSrc,WSrc,RegWrite,ALUSrc,MemWrite,ResultSrc,AddSrc;
	output [1:0] ImmSrc;
	output [2:0] ALUfunc;

	wire [1:0] ALUOp;
	wire Branch,Jump,Lt_Eq , Not;

	MAIN_CNT MCC(
		.Op(Op),
		.ALUOp(ALUOp),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc), 
		.Branch(Branch), 
		.Jump(Jump), 
		.MemWrite(MemWrite), 
		.ResultSrc(ResultSrc), 
		.WSrc(WSrc), 
		.ImmSrc(ImmSrc), 
		.AddSrc(AddSrc)
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
		.Branch(Branch),
		.Jump(Jump),
		.Lt_Eq(Lt_Eq),
		.Not(Not),
		.lt(lt),
		.zer(zer),
		.PCSrc(PCSrc)
	);
endmodule

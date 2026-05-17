module CU(PCSrc,WSrc,RegWrite,ImmSrc,ALUSrc,ALUFunc,MemWrite,ResultSrc,AddSrc,Func3,Func7,Op,Zero,Lt);
	input [6:0] Func7,Op;
	input [2:0] Func3;
	input Zero,Lt;
	output PCSrc,WSrc,RegWrite,ALUSrc,MemWrite,ResultSrc,AddSrc;
	output [1:0] ImmSrc;
	output [2:0] ALUFunc;

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
		.ALUFunc(ALUFunc),
		.Lt_Eq(Lt_Eq),
		.Not(Not)
	);

	PC_CNT PCC(
		.Branch(Branch),
		.Jump(Jump),
		.Lt_Eq(Lt_Eq),
		.Not(Not),
		.Lt(Lt),
		.Zer(Zero),
		.PCSrc(PCSrc)
	);
endmodule

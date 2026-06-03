module CPU(MemAdr, InstRD, MemRD, MemWD, MemWrite, IRWrite, clk);
	output [31:0] MemAdr, MemWD;
	output MemWrite, IRWrite;
	input [31:0] InstRD, MemRD;
	input clk;

	wire PCWrite, AdrSrc, OldPCWrite, RegWrite, Zer, Lt;
	wire [1:0] ALUSrcA, ALUSrcB, ImmSrc, ResultSrc;
	wire [2:0] ALUFunc, Func3;
	wire [6:0] Op, Func7;
	assign Func7= InstRD[31:25];
	assign Func3= InstRD[14:12];
	assign Op= InstRD[6:0];

	DATA_PATH data_path(
		.PCWrite(PCWrite),
		.AdrSrc(AdrSrc),
		.OldPCWrite(OldPCWrite),
		.RegWrite(RegWrite),
		.ALUSrcA(ALUSrcA),
		.ALUSrcB(ALUSrcB),
		.ImmSrc(ImmSrc),
		.ALUFunc(ALUFunc),
		.ResultSrc(ResultSrc),
		.MemAdr(MemAdr),
		.MemRD(MemRD),
		.MemWD(MemWD),
		.InstRD(InstRD),
		.Zer(Zer),
		.Lt(Lt),
		.clk(clk)
	);

	CU cu(
		.AdrSrc(AdrSrc),
		.MemWrite(MemWrite),
		.IRWrite(IRWrite),
		.OldPCWrite(OldPCWrite),
		.RegWrite(RegWrite),
		.AluSrcA(AluSrcA),
		.AluSrcB(AluSrcB),
		.ResultSrc(ResultSrc),
		.ImmSrc(ImmSrc),
		.OP(Op),
		.Func3(Func3),
		.Func7(Func7),
		.PCWrite(PCWrite),
		.ALUfunc(ALUFunc),
		.lt(Lt),
		.zer(Zer),
		.clk(clk)
	);


endmodule

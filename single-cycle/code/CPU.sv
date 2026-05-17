module CPU(clk);
	wire [31:0] InstOut;
	wire [6:0] Func7, Op;
	wire [2:0] Func3;
	wire PCSrc,WSrc,RegWrite,ALUSrc,MemWrite,ResultSrc,AddSrc,zer,lt;
	wire [1:0] ImmSrc;
	wire [2:0] ALUfunc;
	input clk ;

	assign Func7= InstOut[31:25];
	assign Func3= InstOut[14:12];
	assign Op= InstOut[6:0];
	CU  CCU(
		.PCSrc(PCSrc),
		.WSrc(WSrc),
		.RegWrite(RegWrite),
		.ImmSrc(ImmSrc),
		.ALUSrc(ALUSrc),
		.ALUfunc(ALUfunc),
		.MemWrite(MemWrite),
		.ResultSrc(ResultSrc),
		.AddSrc(AddSrc),
		.Func3(Func3),
		.Func7(Func7),
		.Op(Op),
		.zer(zer),
		.lt(lt)
	);
	DATA_PATH DP(
		.PCSrc(PCSrc),
		.WSrc(WSrc),
		.ImmSrc(ImmSrc),
		.ALUSrc(ALUSrc),
		.AddSrc(AddSrc),
		.ResultSrc(ResultSrc),
		.ALUfunc(ALUfunc),
		.MemWrite(MemWrite),
		.RegWrite(RegWrite),
		.zer(zer),
		.lt(lt),
		.InstOut(InstOut),
		.clk(clk));
endmodule

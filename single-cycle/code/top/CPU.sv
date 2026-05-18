module CPU(InstAdr, MemAdr, InstRD, MemRD, MemWD, MemWrite, clk);
	wire [6:0] Func7, Op;
	wire [2:0] Func3;
	wire PCSrc,WSrc,RegWrite,ALUSrc,ResultSrc,AddSrc,zer,lt;
	wire [1:0] ImmSrc;
	wire [2:0] ALUfunc;
	output [31:0] InstAdr, MemAdr, MemWD;
	output MemWrite;
	input [31:0] InstRD, MemRD;
	input clk ;

	assign Func7= InstRD[31:25];
	assign Func3= InstRD[14:12];
	assign Op= InstRD[6:0];
	CU CCU(
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
		.RegWrite(RegWrite),
		.zer(zer),
		.lt(lt),
		.InstRD(InstRD),
		.MemRD(MemRD),
		.InstAdr(InstAdr),
		.MemAdr(MemAdr),
		.MemWD(MemWD),
		.clk(clk));
endmodule

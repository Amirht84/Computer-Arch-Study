module CPU(InstAdr, MemAdr, InstRD, MemRD, MemWD, MemWriteM, Clk);
	output [31:0] InstAdr, MemAdr, MemWD;
	output MemWriteM;
	input [31:0] InstRD, MemRD;
	input Clk;
	wire [6:0] Func7, Op;
	wire [2:0] Func3,ALUFuncE;
	wire PCSrcE,RegWriteW, RegWriteM, ALUSrcE,AddSrcE,zer,lt,EnPC,EnFD,IzDE;
	wire [1:0] ImmSrcD,ForwardSrcA, ResultSrcW, ForwardSrcB, ResultSrcE;
	wire [4:0] RdD,Rs1D,Rs2D,Rs1E,Rs2E,RdE,RdM,RdW;
	assign Func7= InstRD[31:25];
	assign Func3= InstRD[14:12];
	assign Op= InstRD[6:0];
	CU cu(
		.PCSrcE(PCSrcE),
		.RegWriteM(RegWriteM),
		.RegWriteW(RegWriteW),
		.ImmSrcD(ImmSrcD),
		.ALUSrcE(ALUSrcE),
		.ALUFuncE(ALUFuncE),
		.MemWriteM(MemWriteM),
		.ResultSrcW(ResultSrcW),
		.AddSrcE(AddSrcE),
		.Func3(Func3),
		.Func7(Func7),
		.Op(Op),
		.zer(zer),
		.lt(lt),
		.IzDE(IzDE),
		.Clk(Clk)
	);
	DATA_PATH data_path(
		.PCSrcE(PCSrcE),
		.EnPC(EnPC),
		.IzFD(IzFD),
		.EnFD(EnFD),
		.RegWriteW(RegWriteW),
		.ImmSrcD(ImmSrcD),
		.RdD(RdD),
		.InstAdrF(InstAdr),
		.Rs1D(Rs1D),
		.Rs2D(Rs2D),
		.IzDE(IzDE),
		.ForwardSrcA(ForwardSrcA),
		.ForwardSrcB(ForwardSrcB),
		.AddSrcE(AddSrcE),
		.AluSrcE(ALUSrcE),
		.AluFuncE(ALUFuncE),
		.InstRDF(InstRD),
		.RdE(RdE),
		.Rs1E(Rs1E),
		.Rs2E(Rs2E),
		.Zer(zer),
		.Lt(lt),
		.RdM(RdM),
		.MemAdrM(MemAdr),
		.MemWDM(MemWD), 
		.MemRDM(MemRD),
		.ResultSrcW(ResultSrcW),
		.RdW(RdW),
		.Clk(Clk)
		);
	HDU hdu(
		.RegWriteM(RegWriteM),
	 	.RdM(RdM),
		.RdD(RdD),
		.Rs1E(Rs1E),
		.Rs2E(Rs2E),
		.ResultSrcE(ResultSrcE),
		.RdW(RdW),
		.RegWriteW(RegWriteW),
		.RdE(RdE),
		.Rs1D(Rs1D),
		.Rs2D(Rs2D),
		.PCSrcE(PCSrcE),
		.IzDE(IzDE),
		.IzFD(IzFD), 
		.EnFD(EnFD), 
		.EnPC(EnPC),
		.ForwardASrcE(ForwardSrcA),
		.ForwardBSrcE(ForwardSrcB)
		 );
endmodule

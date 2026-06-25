module CU(PCSrcE ,RegWriteW ,ImmSrcD ,ALUSrcE ,ALUFuncE ,MemWriteM ,ResultSrcW ,AddSrcE , Func3, Func7, Op, zer, lt, IzDE , Clk);
	input [6:0] Func7,Op;
	input [2:0] Func3;
	input zer,lt, IzDE , Clk;
	output PCSrcE, RegWriteW, ALUSrcE, MemWriteM , AddSrcE;
	output [1:0] ResultSrcW, ImmSrcD;
	output [2:0] ALUFuncE;
	wire RegWriteD, AddSrcD, BranchD, JumpD, MemWriteD, Lt_EqD, NotD ,RegWriteE, BranchE, JumpE, MemWriteE, NotE, Lt_EqE , RegWriteM,ALUSrcD;
	wire [1:0]  ResultSrcD ,  ResultSrcE ,esultSrcM, ALUOpD;
	wire [2:0] ALUFuncD;
	////////////	Stage:		Memory Access	#D	////////////

	MAIN_CNT main_cnt(
		.Op(Op),
		.ALUOp(ALUOpD),
		.RegWrite(RegWriteD),
		.ALUSrc(ALUSrcD), 
		.Branch(BranchD), 
		.Jump(JumpD),
		.MemWrite(MemWriteD), 
		.ResultSrc(ResultSrcD), 
		.ImmSrc(ImmSrcD), 
		.AddSrc(AddSrcD)
	);
	
	FUNC_CNT func_cnt(
		.ALUOp(ALUOpD),
		.Func3(Func3),
		.Func7(Func7),
		.ALUFunc(ALUFuncD),
		.Lt_Eq(Lt_EqD),
		.Not(NotD)
	);

	PIPE_LINE_REG #(.RegisterCount(8), .Weadth(1)) de_reg_1(
		.Ds({RegWriteD, AddSrcD, ALUSrcD, BranchD, JumpD, MemWriteD, NotD, Lt_EqD}),
		.Qs({RegWriteE, AddSrcE, ALUSrcE, BranchE, JumpE, MemWriteE, NotE, Lt_EqE}),
		.Clk(Clk),
		.Iz(IzDE),
		.En(1'b1)
	);
	
	PIPE_LINE_REG #(.RegisterCount(1), .Weadth(2)) de_reg_2(
		.Ds({ResultSrcD}),
		.Qs({ResultSrcE}),
		.Clk(Clk),
		.Iz(IzDE),
		.En(1'b1)
	);

	PIPE_LINE_REG #(.RegisterCount(1), .Weadth(3)) de_reg_3(
		.Ds({ALUFuncD}),
		.Qs({ALUFuncE}),
		.Clk(Clk),
		.Iz(IzDE),
		.En(1'b1)
	);
	////////////	Stage:		Memory Access	#E	////////////

	PC_CNT pc_cnt(
		.Branch(BranchE),
		.Jump(JumpE),
		.Lt_Eq(Lt_EqE),
		.Not(NotE),
		.lt(lt),
		.zer(zer),
		.PCSrc(PCSrcE)
	);

	PIPE_LINE_REG #(.RegisterCount(2), .Weadth(1)) em_reg_1(
		.Ds({RegWriteE, MemWriteE}),
		.Qs({RegWriteM, MemWriteM}),
		.Clk(Clk),
		.Iz(1'b0),
		.En(1'b1)
	);
	
	PIPE_LINE_REG #(.RegisterCount(1), .Weadth(2)) em_reg_2(
		.Ds({ResultSrcE}),
		.Qs({ResultSrcM}),
		.Clk(Clk),
		.Iz(1'b0),
		.En(1'b1)
	);
	////////////	Stage:		Memory Access	#M	////////////
	
	PIPE_LINE_REG #(.RegisterCount(1), .Weadth(1)) mw_reg_1 (
		.Ds({RegWriteM}),
		.Qs({RegWriteW}),
		.Clk(Clk),
		.Iz(1'b0),
		.En(1'b1)
	);
	PIPE_LINE_REG #(.RegisterCount(1), .Weadth(2)) mw_reg_2 (
		.Ds({ResultSrcM}),
		.Qs({ResultSrcW}),
		.Clk(Clk),
		.Iz(1'b0),
		.En(1'b1)
	);
	////////////	Stage:		Memory Access	#W	////////////

endmodule

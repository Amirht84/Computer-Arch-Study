module MAIN_CNT(OP,AdrSrc ,MemWrite ,IRWrite,OldPCWrite,RegWrite,AluSrcA,AluSrcB,ResultSrc,ImmSrc,CondWrite,Write,ALUOp, clk);
	input [6:0] OP;
	output [1:0] AluSrcA,AluSrcB,ResultSrc,ImmSrc,ALUOp;
	output AdrSrc, MemWrite, IRWrite, OldPCWrite, RegWrite, CondWrite, Write;
	input clk;
	
	wire [4:0] NextPC, CntPC;
	wire [1:0] Next;
	wire [3:0] NanoIdx;

	REG_5B MicroPC (.D(NextPC), .Q(CntPC), .clk(clk));

	LOGIC logic_module(
		.OPCode(OP),
		.Next(Next),
		.CntPC(CntPC),
		.NextPC(NextPC)
	);

	MICRO_MEM micro_mem(
		.MicroPC(CntPC),
		.NanoIdx(NanoIdx),
		.Next(Next)
	);

	NANO_MEM nano_mem(
		.NanoIdx(NanoIdx),
		.Write(Write),
		.CondWrite(CondWrite),
		.AdrSrc(AdrSrc),
		.MemWrite(MemWrite),
		.OldPCWrite(OldPCWrite),
		.IRWrite(IRWrite),
		.RegWrite(RegWrite),
		.ALUSrcA(AluSrcA),
		.ALUSrcB(AluSrcB),
		.ImmSrc(ImmSrc),
		.ALUOp(ALUOp),
		.ResultSrc(ResultSrc)
	);

endmodule
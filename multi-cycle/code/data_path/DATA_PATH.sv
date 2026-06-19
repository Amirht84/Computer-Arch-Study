module DATA_PATH(PCWrite, AdrSrc, OldPCWrite, RegWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUFunc, ResultSrc, MemAdr, MemRD, MemWD, InstRD, Zer, Lt, clk);
	
	input PCWrite, AdrSrc, OldPCWrite, RegWrite, clk;
	input [1:0] ALUSrcA, ALUSrcB, ImmSrc, ResultSrc;
	input [2:0] ALUFunc;
	input [31:0] MemRD, InstRD;
	output [31:0] MemAdr, MemWD;
	output Zer, Lt;

	wire [31:0] NotUsed, PCOut, AdrSrcOut, RD1Out, AOut, AluSrcAOut, OldPCOut;
	wire [31:0] RD2Out, BOut, ImmExtOut, Four, AluSrcBOut, AluOut, AluRegOut, ResaultSrcOut;
	assign NotUsed = 32'b0;
	assign MemAdr = AdrSrcOut;
	assign MemWD = BOut;
	assign Four = 32'd4;

	REG_EN pc (.D(ResaultSrcOut), .Q(PCOut), .clk(clk), .en(PCWrite));

	MUX_2IN adr_src (.A(PCOut), .B(ResaultSrcOut), .Y(AdrSrcOut), .sel(AdrSrc));

	REG_EN old_pc (.D(PCOut), .Q(OldPCOut), .clk(clk), .en(OldPCWrite));

	REG_FILE reg_file (
		.Addr1(InstRD[19:15]),
		.Addr2(InstRD[24:20]),
		.AddrW(InstRD[11:7]),
		.WDat(ResaultSrcOut),
		.RDat1(RD1Out),
		.RDat2(RD2Out),
		.we(RegWrite),
		.clk(clk)
	);

	REG a_reg (.D(RD1Out), .Q(AOut), .clk(clk));

	REG b_reg (.D(RD2Out), .Q(BOut), .clk(clk));

	MUX_4IN alu_src_a (.A(PCOut), .B(OldPCOut), .C(AOut), .D(NotUsed), .Y(AluSrcAOut), .sel(ALUSrcA));

	MUX_4IN alu_src_b (.A(BOut), .B(ImmExtOut), .C(Four), .D(NotUsed), .Y(AluSrcBOut), .sel(ALUSrcB));

	IMM_EXT imm_ext (.In(InstRD), .Out(ImmExtOut), .sel(ImmSrc));

	ALU alu (.A(AluSrcAOut), .B(AluSrcBOut), .Y(AluOut), .f(ALUFunc), .zer(Zer), .lt(Lt));

	REG alu_reg (.D(AluOut), .Q(AluRegOut), .clk(clk));

	MUX_4IN resault_src (.A(AluRegOut), .B(AluOut), .C(MemRD), .D(NotUsed), .Y(ResaultSrcOut), .sel(ResultSrc));

endmodule

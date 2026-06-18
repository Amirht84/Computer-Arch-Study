module DATA_PATH();

	/////////// Control Signals	///////////
	wire AluSrcE, AddSrcE, ResultSrcW;
	wire [2:0] AluFuncE;
	/////////// Hazard Signals	///////////
	input [1:0] ForwardSrcA, ForwardSrcB;
	input IzFD, IzDE, EnFD;
	input Clk;
	input PCSrcF, EnPC;


	input [31:0] InstRDD, MemRDW;
	output [31:0] InstAdrF, InstOut, MemAdrM, MemWDM;
	output Zer, Lt;
	
	////////////	Stage: Instruction Fetch	#F	////////////
	wire [31:0] IncOutF, PCSrcOutF, PCOutF;
	REG_FULL pc(.D(PCSrcOutF), .Q(PCOutF), .Clk(Clk), .En(EnPC), .Iz(1'b0));
	MUX_2IN pc_src(.A(IncOutF), .B(AddOutE), .Y(PCSrcOutF), .sel(PCSrc));
	INC_4 inc_4(.A(PCSrcOutF), .Y(IncOutF));
	assign InstAdrF = PCSrcOutF;

	PIPE_LINE_REG #(.RegisterCount(2)) fd_reg (.Qs({PCOutF, IncOutF}), .Ds({PCOutD, IncOutD}), .Iz(IzFD), .En(EnFD), .Clk(Clk));

	////////////	Stage: Instruction Decode	#D	////////////
	wire [31:0] IncOutD, RD1OutD, RD2OutD, ImmExtOutD, ImmSrcD, PCOutD;
	wire [4:0] Rs1D, Rs2D, RdD;
	assign Rs1D = InstRDD[19:15];
	assign Rs2D = InstRDD[24:20];
	assign RdD = InstRDD[11:7];

	REG_FILE reg_file(
		.Addr1(Rs1D),
		.Addr2(Rs2D),
		.AddrW(RdW),
		.WDat(ResultSrcOutW),
		.RDat1(RD1OutD),
		.RDat2(RD2OutD),
		.we(RegWriteW),
		.Clk(Clk));
	
	IMM_EXT imm_ext(.In(InstRDD), .Out(ImmExtOutD), .sel(ImmSrcD));

	PIPE_LINE_REG #(.RegisterCount(8)) de_reg (
		.Ds({RD1OutD, RD2OutD, PCOutD, RdD, Rs1D, Rs2D, ImmExtOutD, IncOutD}),
		.Qs({RD1OutE, RD2OutE, PCOutE, RdE, Rs1E, Rs2E, ImmExtOutE, IncOutE}),
		.Iz(IzDE),
		.En(1'b1),
		.Clk(Clk)
	);
	////////////	Stage:		Exectution		#E	////////////
	wire [31:0] AddOutE, ForwardSrcAOutE, ForwardSrcBOutE, ImmExtOutE, AluSrcOutE, RD1OutE, AddSrcOutE, AluOutE;
	wire [4:0] RdE;
	MUX_4IN forward_src_a (.A(RD1OutD), .B(AluOutM), .C(ResultSrcOutW), .D(32'b0), .Y(ForwardSrcAOutE), .sel(ForwardSrcA));
	MUX_4IN forward_src_b (.A(RD2OutD), .B(AluOutM), .C(ResultSrcOutW), .D(32'b0), .Y(ForwardSrcBOutE), .sel(ForwardSrcB));

	MUX_2IN alu_src(.A(ForwardSrcBOutE), .B(ImmExtOutE), .Y(AluSrcOutE), .sel(AluSrcE));
	MUX_2IN add_src(.A(PCOutE), .B(RD1OutE), .Y(AddSrcOutE), .sel(AddSrcE));

	ADDER adder(.A(AddSrcOutE), .B(ImmExtOutE), .Y(AddOutE));

	ALU alu(.A(ForwardSrcAOutE), .B(AluSrcOutE), .Y(AluOutE), .f(AluFuncE), .zer(Zer), .lt(Lt));

	PIPE_LINE_REG #(.RegisterCout(4)) em_reg (
		.Ds({AluOutE, ForwardSrcBOutE, RdE, IncOutE}),
		.Qs({AluOutM, ForwardSrcBOutM, RdM, IncOutM}),
		.Iz(1'b0),
		.En(1'b1),
		.Clk(Clk)
	);

	////////////	Stage:		Memory Access	#M	////////////
	wire [31:0] AluOutM, IncOutM, ForwardSrcBOutM;
	wire [4:0] RdM;
	
	assign MemAdrM = AluOutM;
	assign MemWDM = ForwardSrcBOutM;

	PIPE_LINE_REG #(.RegisterCount(3)) mw_reg (
		.Ds({AluOutM, RdM, IncOutM}),
		.Qs({AluOutW, RdW, IncOutW}),
		.Iz(1'b0),
		.En(1'b1),
		.Clk(Clk)
	);

	////////////	Stage:		Write Back		#W	////////////
	wire RegWriteW, AluOutW, IncOutW;
	wire [4:0] RdW;
	wire [31:0] ResultSrcOutW;

	MUX_4IN result_src (.A(AluOutW), .B(MemRDW), .C(IncOutW), .D(32'b0), .sel(ResultSrcW), .Y(ReseultSrcOutW));
endmodule

module DATA_PATH(
	PCSrcE, EnPC, IzFD, EnFD,
	RegWriteW, ImmSrcD, RdD,  InstAdrF, Rs1D, Rs2D, InstRDD, IzDE,
	ForwardSrcA, ForwardSrcB, AddSrcE, AluSrcE, AluFuncE, InstRDF, RdE, Rs1E, Rs2E, Zer, Lt,Clk,
	RdM, MemAdrM, MemWDM, 
	MemRDM, ResultSrcW, RdW);

	/////////// No Operation Instruction Code ///////////
	localparam Nop = 32'b00000000000000000000000000110011;

	/////////// Control Signals	///////////
	input AluSrcE, AddSrcE, RegWriteW;
	input [2:0] AluFuncE;
	input [1:0] ImmSrcD, ResultSrcW ;
	/////////// Hazard Signals	///////////
	input [1:0] ForwardSrcA, ForwardSrcB;
	input IzFD, IzDE, EnFD;
	input Clk;
	input PCSrcE, EnPC;
	output [4:0] RdD, Rs1D, Rs2D, RdE, Rs1E, Rs2E, RdM, RdW;

	input [31:0] InstRDF, MemRDM;
	output [31:0] InstAdrF, MemAdrM, MemWDM, InstRDD;
	output Zer, Lt;
	wire [31:0] IncOutF, PCSrcOutF, PCOutF ,IncOutD, RD1OutD, RD2OutD, ImmExtOutD, PCOutD,AddOutE, ForwardSrcAOutE, ForwardSrcBOutE, ImmExtOutE, AluSrcOutE, RD1OutE, RD2OutE, AddSrcOutE, AluOutE, PCOutE, IncOutE ,AluOutM, IncOutM, ForwardSrcBOutM, ResultSrcOutW;
	wire [31:0] AluOutW, IncOutW, MemRDW;
	////////////	Stage: Instruction Fetch	#F	////////////
	REG_FULL pc(.D(PCSrcOutF), .Q(PCOutF), .Clk(Clk), .En(EnPC), .Iz(1'b0));
	MUX_2IN pc_src(.A(IncOutF), .B(AddOutE), .Y(PCSrcOutF), .sel(PCSrcE));
	INC_4 inc_4(.A(PCOutF), .Y(IncOutF));
	assign InstAdrF = PCOutF;
	PIPE_LINE_REG #(.InitValue(Nop)) de_reg_nop (
		.Ds({InstRDF}),
		.Qs({InstRDD}),
		.Iz(IzFD),
		.En(1'b0),
		.Clk(Clk)
	);
	PIPE_LINE_REG #(.RegisterCount(2)) fd_reg (.Ds({PCOutF, IncOutF}), .Qs({PCOutD, IncOutD}), .Iz(IzFD), .En(EnFD), .Clk(Clk));

	////////////	Stage: Instruction Decode	#D	////////////
	
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

	PIPE_LINE_REG #(.RegisterCount(5)) de_reg (
		.Ds({RD1OutD, RD2OutD, PCOutD, ImmExtOutD, IncOutD}),
		.Qs({RD1OutE, RD2OutE, PCOutE, ImmExtOutE, IncOutE}),
		.Iz(IzDE),
		.En(1'b0),
		.Clk(Clk)
	);
	PIPE_LINE_REG #(.RegisterCount(3), .Weadth(5)) de_reg_5 (
		.Ds({RdD, Rs1D, Rs2D}),
		.Qs({RdE, Rs1E, Rs2E}),
		.Iz(IzDE),
		.En(1'b0),
		.Clk(Clk)
	);
	////////////	Stage:		Exectution		#E	////////////
	
	MUX_4IN forward_src_a (.A(RD1OutE), .B(AluOutM), .C(ResultSrcOutW), .D(32'b0), .Y(ForwardSrcAOutE), .sel(ForwardSrcA));
	MUX_4IN forward_src_b (.A(RD2OutE), .B(AluOutM), .C(ResultSrcOutW), .D(32'b0), .Y(ForwardSrcBOutE), .sel(ForwardSrcB));

	MUX_2IN alu_src(.A(ForwardSrcBOutE), .B(ImmExtOutE), .Y(AluSrcOutE), .sel(AluSrcE));
	MUX_2IN add_src(.A(PCOutE), .B(RD1OutE), .Y(AddSrcOutE), .sel(AddSrcE));

	ADDER adder(.A(AddSrcOutE), .B(ImmExtOutE), .Y(AddOutE));

	ALU alu(.A(ForwardSrcAOutE), .B(AluSrcOutE), .Y(AluOutE), .f(AluFuncE), .zer(Zer), .lt(Lt));

	PIPE_LINE_REG #(.RegisterCount(3)) em_reg (
		.Ds({AluOutE, ForwardSrcBOutE, IncOutE}),
		.Qs({AluOutM, ForwardSrcBOutM, IncOutM}),
		.Iz(1'b0),
		.En(1'b0),
		.Clk(Clk)
	);
	
	PIPE_LINE_REG #(.RegisterCount(1), .Weadth(5)) em_reg_5 (
		.Ds({RdE}),
		.Qs({RdM}),
		.Iz(1'b0),
		.En(1'b0),
		.Clk(Clk)
	);

	////////////	Stage:		Memory Access	#M	////////////
	
	assign MemAdrM = AluOutM;
	assign MemWDM = ForwardSrcBOutM;

	PIPE_LINE_REG #(.RegisterCount(3)) mw_reg (
		.Ds({AluOutM, IncOutM, MemRDM}),
		.Qs({AluOutW, IncOutW, MemRDW}),
		.Iz(1'b0),
		.En(1'b0),
		.Clk(Clk)
	);
	PIPE_LINE_REG #(.RegisterCount(1), .Weadth(5)) mw_reg_5 (
		.Ds({RdM}),
		.Qs({RdW}),
		.Iz(1'b0),
		.En(1'b0),
		.Clk(Clk)
	);

	////////////	Stage:		Write Back		#W	////////////

	MUX_4IN result_src (.A(AluOutW), .B(MemRDW), .C(IncOutW), .D(32'b0), .sel(ResultSrcW), .Y(ResultSrcOutW));
endmodule

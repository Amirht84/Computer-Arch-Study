module DATA_PATH(PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, RegWrite, zer, lt, MemAdr, MemRD, MemWD, InstAdr, InstRD, clk);

	input clk;
	input PCSrcF, 
	output [31:0] InstAdrF, InstOut

	
	////////////	Stage: Instruction Fetch	#F	////////////
	wire [31:0] IncOutF, PCSrcOutF;
	REG_FULL pc(.D(), .Q(), .clk(), .En(), .iz(1'b0));
	MUX_2IN pc_src(.A(IncOutF), .B(AddOutE), .Y(PCSrcOutF), .sel(PCSrc));
	INC_4 inc_4(.A(PCSrcOutF), .Y(IncOutF));
	assign InstAdrF = PCSrcOutF;

	PIPE_LINE_REG #(.RegisterCount(3)) fd_reg (.Qs({PCSrcOutF,}), .Ds({PCSrcOutD, }), .iz(), .En(), .clk(clk));

	////////////	Stage: Instruction Decode	#D	////////////
	wire [31:0]
	////////////	Stage:		Exectution		#E	////////////


	////////////	Stage:		Memory Access	#M	////////////


	////////////	Stage:		Write Back		#W	////////////


endmodule

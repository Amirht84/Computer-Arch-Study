module DATA_PATH(PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, RegWrite, zer, lt, MemAdr, MemRD, MemWD, InstAdr, InstRD, clk);

	input PCSrc, WSrc, ALUSrc, AddSrc, ResultSrc, RegWrite, clk;
	input [1: 0] ImmSrc;
	input [2:0] ALUfunc;
	input [31:0] MemRD, InstRD;
	output [31:0] InstAdr, MemAdr, MemWD;
	output zer, lt;

	
	wire [31:0] Wires [0:13];

	assign MemAdr = Wires[4];
	assign MemWD = Wires[8];
	assign InstAdr = Wires[1];
	assign Wires[5] = MemRD;
	assign Wires[2] = InstRD;


	MUX_2IN MUX_1(.A(Wires[13]), .B(Wires[12]), .Y(Wires[0]), .sel(PCSrc)); //sel 0 will A, and sel 1 will B

	REG PC(.D(Wires[0]), .Q(Wires[1]), .clk(clk));

	INC_4 PLUS4(.A(Wires[1]), .Y(Wires[13]));


	REG_FILE RF(
		.Addr1(InstRD[19:15]), 
		.Addr2(InstRD[24:20]),
		.AddrW(InstRD[11:7]), 
		.WDat(Wires[7]),
		.RDat1(Wires[3]),
		.RDat2(Wires[8]),
		.we(RegWrite),
		.clk(clk)
	);
	
	MUX_2IN MUX_2(.A(Wires[8]), .B(Wires[10]), .Y(Wires[9]), .sel(ALUSrc));

	ALU OUR_ALU(
		.A(Wires[3]),
		.B(Wires[9]),
		.Y(Wires[4]),
		.zer(zer),
		.lt(lt),
		.f(ALUfunc)
	);

	MUX_2IN MUX_3(
		.A(Wires[4]),
		.B(Wires[5]),
		.Y(Wires[6]),
		.sel(ResultSrc)
	);

	MUX_2IN MUX_4(
		.A(Wires[6]),
		.B(Wires[13]),
		.Y(Wires[7]),
		.sel(WSrc)
	);

	IMM_EXT OUR_IMM_EXT(
		.In(InstRD),
		.Out(Wires[10]),
		.sel(ImmSrc)
	);
	
	MUX_2IN MUX_5(
		.A(Wires[1]),
		.B(Wires[3]),
		.Y(Wires[11]),
		.sel(AddSrc)
	);

	ADDER OUR_ADDER(
		.A(Wires[10]),
		.B(Wires[11]),
		.Y(Wires[12])
	);
endmodule

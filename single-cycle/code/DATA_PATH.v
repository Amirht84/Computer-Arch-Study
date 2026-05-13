module DATA_PATH(PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite, RegWrite, zer, lt, clk);

	input WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite, RegWrite, clk;
	output zer, lt;

	input clk;

	wire [31:0] Wires [0:13];
	wire [31:0] InstOut;
	assign InstOut = Wires[2];



	MUX_2IN MUX_1(.A(Wires[13]), .B(Wires[12]), .Y(Wires[0]). .sel(PCSrc)); //sel 0 will A, and sel 1 will B

	REG PC(.D(Wires[0]), .Q(Wires[1]), .clk(clk));

	INC_4 PLUS4(.A(Wires[1]), .Y(Wires[13]));

	INST_MEM IM(.Adr(Wires[1]), RDat(Wires[2]));

	REG_FILE RF(
		.Addr1(InstOut[19:15]), 
		.Addr2(InstOut[24:20]),
		.AddrW(InstOut[11:7]), 
		.WDat(Wires[7]),
		.RDat1(Wires[3]),
		.RDat2(Wires[8]),
		.we(RegWrite),
		.clk(clk)
	);
	
	MUX_2IN MUX_2(.A(Wires[8]), .B(Wires[10]), .Y(Wires[9]). .sel(ALUSrc));

	ALU OUR_ALU(
		.A(Wires[3]),
		.B(Wires[9]),
		.Y(Wires[4]),
		.zer(zer),
		.lt(lt),
		.f(ALUfunc)
	);

	DATA_MEM DM(
		.Adr(Wires[4]),
		.WDat(Wires[8]),
		.RDat(Wires[5]),
		.we(MemWrite),
		.clk(clk)
	);

	MUX_2IN MUX_3(
		.A(Wires[4]),
		.B(Wires[5]),
		.Y(Wires[6]),
		.sel(ResultSrc)
	);

	MUX_2IN MUX_4(
		.A(Wires[13]),
		.B(Wires[6]),
		.Y(Wires[7]),
		.sel(WSrc)
	);

	IMM_EXT OUR_IMM_EXT(
		.In(InstOut[31:7]),
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

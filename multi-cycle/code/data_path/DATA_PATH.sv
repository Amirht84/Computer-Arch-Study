module DATA_PATH(PCWrite, AdrSrc, OldPCWrite, RegWrite, ALUSrcA, ALUSrcB, ImmSrc, ALUFunc, ResultSrc, MemAdr, MemRD, MemWD, InstRD, Zer, Lt, clk);
	
	input PCWrite, AdrSrc, OldPCWrite, RegWrite;
	input [1:0] ALUSrcA, ALUSrcB, ImmSrc, ResultSrc;
	input [2:0] ALUFunc;
	input [31:0] MemRD, InstRD;
	output [31:0] MemAdr, MemWD;
	output Zer, Lt;

	wire [31:0] Wires [0:15];
	wire [31:0] NotUsed;
	assign NotUsed = 32'b0;
	assign MemAdr = Wires[1];
	assign MemWD = Wires[8];
	assign Wires[2] = InstRD;
	assign Wires[9] = MemRD;
	assign Wires[11] = 32'd4;
	REG_EN PC (.D(Wires[15]), .Q(Wires[0]), .clk(clk), .en(PCWrite));

	MUX_2IN MUX_0 (.A(Wires[0]), .B(Wires[15]), .Y(Wires[1]), .sel(AdrSrc));

	REG_EN OldPC (.D(Wires[0]), .Q(Wires[6]), .clk(clk), .en(OldPCWrite));

	REG_FILE RegFile (
		.Addr1(InstRD[19:15]),
		.Addr2(InstRD[24:20]),
		.AddrW(InstRD[11:7]),
		.WDat(Wires[15]),
		.RDat1(Wires[3]),
		.RDat2(Wires[7]),
		.we(RegWrite),
		.clk(clk)
	);

	REG A (.D(Wires[3]), .Q(Wires[4]), .clk(clk));

	REG B (.D(Wires[7]), .Q(Wires[8]), .clk(clk));

	MUX_4IN MUX_1 (.A(Wires[0]), .B(Wires[6]), .C(Wires[4]), .D(NotUsed), .Y(Wires[5]), .sel(ALUSrcA));

	MUX_4IN MUX_2 (.A(Wires[8]), .B(Wires[10]), .C(Wires[11]), .D(NotUsed), .Y(Wires[12]), .sel(ALUSrcB));

	IMM_EXT IMM_EXT (.In(Wires[2]), .Out(Wires[10]), .sel(ImmSrc));

	ALU Alu (.A(Wires[5]), .B(Wires[12]), .Y(Wires[13]), .f(ALUFunc), .zer(Zer), .lt(Lt));

	REG ALUOut (.D(Wires[13]), .Q(Wires[14]), .clk(clk));

	MUX_4IN MUX_3 (.A(Wires[14]), .B(Wires[13]), .C(Wires[9]), .D(NotUsed), .Y(Wires[15]), .sel(ResultSrc));

endmodule

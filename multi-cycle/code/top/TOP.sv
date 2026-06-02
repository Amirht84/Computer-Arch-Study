module TOP #(parameter MEM_SPACE = 10) (clk);
	input clk;
	wire [31:0] MemAdr, InstRD, MemRD, MemWD, MemWrite;
	wire MemWrite, IRWrite;
	CPU cpu(
		.MemAdr(MemAdr),
		.InstRD(InstRD),
		.MemRD(MemRD),
		.MemWD(MemWD),
		.MemWrite(MemWrite),
		.IRWrite(IRWrite),
		.clk(clk)
	);

	MEM #(.MEM_SPACE(MEM_SPACE)) mem(
		.MemAdr(MemAdr),
		.InstRD(InstRD),
		.MemRD(MemRD),
		.MemWD(MemWD),
		.MemWrite(MemWrite),
		.IRWrite(IRWrite),
		.clk(clk)
	);
endmodule

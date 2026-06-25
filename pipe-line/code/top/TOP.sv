module TOP #(parameter MEM_SPACE = 10, INST_SPACE = 10) (Clk);
	input Clk;
	wire [31:0] InstAdr, MemAdr, InstRD, MemRD, MemWD;
	wire MemWrite;
	CPU cpu(.InstAdr(InstAdr), .MemAdr(MemAdr), .InstRD(InstRD), .MemRD(MemRD), .MemWD(MemWD), .MemWriteM(MemWrite), .Clk(Clk));
	MEM #(.MEM_SPACE(MEM_SPACE), .INST_SPACE(INST_SPACE)) mem(.InstAdr(InstAdr), .MemAdr(MemAdr), .InstRDF(InstRD), .MemRD(MemRD), .MemWD(MemWD), .we(MemWrite) , .Clk(Clk));
endmodule
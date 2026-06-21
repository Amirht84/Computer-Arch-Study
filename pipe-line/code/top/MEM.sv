module MEM #(parameter MEM_SPACE = 10, INST_SPACE = 10) (InstAdr, MemAdr, InstRD, MemRD, MemWD, we, Clk);
	input [31:0] InstAdr, MemAdr, MemWD;
	output [31:0] InstRD, MemRD;
	input we ,Clk;
	DATA_MEM #(.DATA_SPACE(MEM_SPACE)) Data(.RDat(MemRD), .Adr(MemAdr), .WDat(MemWD), .Clk(Clk), .we(we));
	INST_MEM #(.INST_SPACE(INST_SPACE)) Inst(.RDat(InstRD), .Adr(InstAdr));
endmodule

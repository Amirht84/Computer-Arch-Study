module MEM #(parameter MEM_SPACE = 10, INST_SPACE = 10) (InstAdr, MemAdr, InstRD, MemRD, MemWD, we, clk);
	input [31:0] InstAdr, MemAdr, MemWD;
	output [31:0] InstRD, MemRD;
	input we ,clk;
	DATA_MEM #(.DATA_SPACE(MEM_SPACE)) Data(.RDat(MemRD), .Adr(MemAdr), .WDat(MemWD), .clk(clk), .we(we));
	INST_MEM #(.INST_SPACE(INST_SPACE)) Inst(.RDat(InstRD), .Adr(InstAdr));
endmodule

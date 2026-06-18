module MEM #(parameter MEM_SPACE = 10, INST_SPACE = 10) (InstAdr, MemAdr, InstRD, MemRD, MemWD, we, Iz, En, Clk);
	localparam Nop = 32'b0; // don't forget to refactor
	input [31:0] InstAdr, MemAdr, MemWD;
	output [31:0] InstRD, MemRD;
	input we ,Clk, Iz, En;
	wire [31:0] InstRDF, InstRDD;
	PIPE_LINE_REG fe_reg #(.RegisterCount(1), .InitValue(Nop)) (.Ds(InstRDE), .Qs(InstRDD), .Iz(Iz), .En(en), .Clk(Clk));
	DATA_MEM #(.DATA_SPACE(MEM_SPACE)) Data(.RDat(MemRD), .Adr(MemAdr), .WDat(MemWD), .Clk(Clk), .we(we));
	INST_MEM #(.INST_SPACE(INST_SPACE)) Inst(.RDat(InstRDE), .Adr(InstAdr));
endmodule

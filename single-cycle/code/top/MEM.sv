module MEM #(parameter MEM_SPACE = 10, INST_SPACE = 10) (InstAdr, MemAdr, InstRD, MemRD, MemWD, we, IzFD, EnFD, Clk);
	localparam Nop = 32'b00000000000000000000000000110011; 
	input [31:0] InstAdr, MemAdr, MemWD;
	output [31:0] InstRD, MemRD;
	input we ,Clk, IzFD, EnFD;
	wire [31:0] InstRDF, InstRDD,MemRDW,MemRDM;
	assign InstRD=InstRDD;
	assign MemRD=MemRDW;
	PIPE_LINE_REG fd_reg #(.RegisterCount(1), .InitValue(Nop)) (.Ds(InstRDF), .Qs(InstRDD), .Iz(Iz), .En(en), .Clk(Clk));
	PIPE_LINE_REG mw_reg #(.RegisterCount(1)) (.Ds(MemRDM), .Qs(MemRDW), .Iz(1'b0), .En(1'b1), .Clk(Clk));
	DATA_MEM #(.DATA_SPACE(MEM_SPACE)) Data(.RDat(MemRDM), .Adr(MemAdr), .WDat(MemWD), .Clk(Clk), .we(we));
	INST_MEM #(.INST_SPACE(INST_SPACE)) Inst(.RDat(InstRDF), .Adr(InstAdr));
endmodule

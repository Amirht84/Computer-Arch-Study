module MEM #(parameter MEM_SPACE = 10) (MemAdr, InstRD, MemRD, MemWD, MemWrite, IRWrite, clk);
	input [31:0] MemAdr, MemWD;
	input MemWrite, IRWrite;
	output [31:0] InstRD, MemRD;
	input clk;
	
	wire [31:0] MemOut;
	REG_EN ir(.D(MemOut), .Q(InstRD), .en(IRWrite), .clk(clk));
	REG mdr(.D(MemOut), .Q(MemRD), .clk(clk));

	DATA_MEM #(.DATA_SPACE(MEM_SPACE)) Data(.RDat(MemOut), .Adr(MemAdr), .WDat(MemWD), .clk(clk), .we(MemWrite));
endmodule

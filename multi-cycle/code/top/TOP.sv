module TOP #(parameter MEM_SPACE = 10, INST_SPACE = 10) (clk);
	input clk;
	wire [31:0] InstAdr, MemAdr, InstRD, MemRD, MemWD;
	wire MemWrite;
	CPU cpu(.InstAdr(InstAdr), .MemAdr(MemAdr), .InstRD(InstRD), .MemRD(MemRD), .MemWD(MemWD), .MemWrite(MemWrite), .clk(clk));
	MEM #(.MEM_SPACE(MEM_SPACE), .INST_SPACE(INST_SPACE)) mem(.InstAdr(InstAdr), .MemAdr(MemAdr), .InstRD(InstRD), .MemRD(MemRD), .MemWD(MemWD), .we(MemWrite), .clk(clk));
endmodule

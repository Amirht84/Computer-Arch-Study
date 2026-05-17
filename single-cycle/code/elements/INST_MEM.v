module INST_MEM(Adr, RDat);
	parameter INST_SPACE = 1000;
	input [31:0] Adr;
	output [31:0] Rdat;

	wire [29:0] Index;
	assign Index = Adr >> 2;

	reg [31:0] InstMemo [0: INST_SPACE - 1];
	assign RDat = (Adr < INST_MEM) ? InstMemo[Adr] : 32'b0;

	initial begin
		$readmemb("InstMemo.txt", InstMemo);
	end
endmodule

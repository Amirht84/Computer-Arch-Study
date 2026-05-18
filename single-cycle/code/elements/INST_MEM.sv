module INST_MEM(Adr, RDat);
	parameter INST_SPACE = 20;
	input [31:0] Adr;
	output [31:0] RDat;

	wire [29:0] Index;
	assign Index = Adr >> 2;

	reg [31:0] InstMemo [0: INST_SPACE - 1];
	assign RDat = (Index < INST_SPACE) ? InstMemo[Index] : 32'b0;

	initial begin
		$readmemb("INST_MEM.txt", InstMemo);
	end
endmodule

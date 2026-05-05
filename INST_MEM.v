module INST_MEM(Adr, RDat);
	parameter INST_SPACE = 1000;
	input [31:0] Adr;
	input [31:0] Rdat;
	reg [31:0] Memo [0: INST_SPACE];

	initial begin
		$readmemh("fileName.hex", Memo);
	end

	assign RDat = (Adr < INST_MEM) ? Memo[Adr] : 32'b0;

endmodule

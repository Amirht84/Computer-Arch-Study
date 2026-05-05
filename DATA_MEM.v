module DATA_MEM(Adr, WDat, RDat, we, clk);
	parameter DATA_SPACE = 1000;
	input [31:0] Adr;
	input [31:0] WDat;
	output [31:0] RDat;
	input we;
	input clk;

	reg Memo[0: DATA_SPACE - 1];
	always @(posedge clk)begin
		if(we)
			Memo[Adr] <= WDat;
	end
	assign RDat = Memo[Adr];
endmodule

module REG_FILE(Addr1, Addr2, AddrW, WDat, RDat1, RDat2, we, clk);
	parameter DATA_SPACE = 1000;//words
	localparam STACK_START = (DATA_SPACE - 1) * 4;
	localparam SP_IND = 2;

	input [4:0] Addr1;
	input [4:0] Addr2;
	input [4:0] AddrW;
	input [31:0] WDat;

	input we;
	input clk;

	output [31:0] RDat1;
	output [31:0] RDat2;

	reg [31:0] RegMem [0:31];

	initial begin
		for(integer i = 0; i < 32; i++) begin
			RegMem[i] = 32'b0;
		end
		RegMem[SP_IND] = STACK_START;
	end

	always @(posedge clk) begin
		if (we && AddrW != 0) begin
			RegMem[AddrW] <= WDat;
		end
	end

	assign RDat1 = RegMem[Addr1];
	assign RDat2 = RegMem[Addr2];
endmodule

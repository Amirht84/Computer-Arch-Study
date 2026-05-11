module REG_FILE(RReg1, RReg2, WReg, WDat, RDat1, RDat2, we, clk);
	input [4:0] RReg1;
	input [4:0] RReg2;
	input [4:0] WReg;
	input [31:0] WDat;

	input we;
	input clk;

	output [31:0] RDat1;
	output [31:0] RDat2;

	reg [31:0] Regs [0:31];

	initial begin
		for(integer i = 0; i < 32; i++) begin
			Regs[i] = 32'b0;
		end
	end

	always @(posedge clk) begin
		if (we && WReg != 0) begin
			Regs[WReg] <= WDat;
		end
	end

	assign RDat1 = Regs[RReg1];
	assign RDat2 = Regs[RReg2];
endmodule

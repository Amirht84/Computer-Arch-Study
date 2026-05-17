module MAIN_CNT(Op, ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, ImmSrc, AddSrc);
	localparam [6:0] rt = 7'd51, bt = 7'd99, it = 7'd19, lw = 7'd3, sw = 7'd35, jal = 7'd111, jalr = 7'd103;
	input [6:0] Op;
	output logic [1:0] ALUOp, ImmSrc;
	output logic RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, AddSrc;

	always @(Op) begin

		{ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, ImmSrc, AddSrc} = 12'b0;

		case(Op)
			rt:	{ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc} =		9'b101000000;
			
			bt:	{ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ImmSrc, AddSrc} =		10'b0100100100;

			it:	{ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, ImmSrc} =	11'b11110000000;

			lw:	{ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, ImmSrc} =	11'b00110001000;

			sw:	{ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ImmSrc} =			9'b000100101;

			jal:	{RegWrite, Jump, MemWrite, WSrc, ImmSrc, AddSrc} =				7'b1101110;

			jalr:	{RegWrite, Jump, MemWrite, WSrc, ImmSrc, AddSrc} =				7'b1101111;

		endcase

	end
	
	
endmodule

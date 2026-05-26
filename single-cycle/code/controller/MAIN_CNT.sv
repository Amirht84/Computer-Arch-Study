module MAIN_CNT(Op, ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, ImmSrc, AddSrc);

	/////////// Op Codes ///////////
	localparam [6:0] rt = 7'd51, bt = 7'd99, it = 7'd19, lw = 7'd3, sw = 7'd35, jal = 7'd111, jalr = 7'd103;
	/////////// Op Codes ///////////


	/////////// Dont Care ///////////
	localparam [1:0] _2bdd = 2'b00;
	localparam _1bd = 1'b0;
	/////////// Dont Care ///////////


	input [6:0] Op;
	output [1:0] ALUOp, ImmSrc;
	output RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, AddSrc;

	reg [11:0] OutPut;

	always @(Op) begin

		OutPut = 12'b0;

		case(Op)
			rt:	OutPut =		{2'b10 , 1'b1 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , _2bdd , _1bd };
			
			bt:	OutPut =		{2'b01 , 1'b0 , 1'b0 , 1'b1 , 1'b0 , 1'b0 , _1bd , _1bd , 2'b10 , 1'b0 };

			it:	OutPut =		{2'b11 , 1'b1 , 1'b1 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 2'b00 , _1bd };

			lw:	OutPut =		{2'b00 , 1'b1 , 1'b1 , 1'b0 , 1'b0 , 1'b0 , 1'b1 , 1'b0 , 2'b00 , _1bd };

			sw:	OutPut =		{2'b00 , 1'b0 , 1'b1 , 1'b0 , 1'b0 , 1'b1 , _1bd , _1bd , 2'b01 , _1bd };

			jal:	OutPut =		{_2bdd , 1'b1 , _1bd , _1bd , 1'b1 , 1'b0 , _1bd , 1'b1 , 2'b11 , 1'b0 };

			jalr:	OutPut =		{_2bdd , 1'b1 , _1bd , _1bd , 1'b1 , 1'b0 , _1bd , 1'b1 , 2'b11 , 1'b1 };

		endcase

	end
	
	assign {ALUOp, RegWrite, ALUSrc, Branch, Jump, MemWrite, ResultSrc, WSrc, ImmSrc, AddSrc} = OutPut;

endmodule

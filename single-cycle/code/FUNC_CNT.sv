module FUNC_CNT(ALUOp,Func3,Func7,ALUFunc,Lt_Eq,Not);

	//////////////////// ALUOp ////////////////////
	localparam [1:0] localparam lw_sw = 2'b00, b_type = 2'b01 , r_type = 2'b10 , i_type = 2'b11;
	//////////////////// ALUOp ////////////////////


	//////////////////// Func3, Func7 ////////////////////
	localparam [2:0] localparam beq_f = 3'd0, bne_f = 3'd1, blt_f = 3'd4, bge_f = 3'd5, addi_f = 3'd0, xori_f = 3'd4, ori_f = 3'd6, slti_f = 3'd2;
	localparam [9:0] localparam add_f = {3'd0, 7'd0}, sub_f = {3'd0, 7'd32}, and_f = {3'd7, 7'd0}, or_f = {3'd6, 7'd0}, slt_f = {3'd2, 7'd0};
	//////////////////// Func3, Func7 ////////////////////

	//////////////////// Dont Care //////////////////// 
	localparam _1bd = 1'b0;
	//////////////////// Dont Care //////////////////// 

	input [1:0] ALUOp;
	input [2:0] Func3;
	input [6:0] Func7;
	output [2:0] ALUFunc;
	output Lt_Eq,Not;

	reg [4:0] OutPut;
	always @(ALUOp,Func3,Func7) begin

		OutPut = 5'b0;

		case(ALUOp)
			lw_sw: begin
						OutPut = {3'b000 , _1bd , _1bd };
			end

			b_type: begin

				case(Func3)
					beq_f:	OutPut = {3'b001 , 1'd0 , 1'd0};
					bne_f:	OutPut = {3'b001 , 1'd0 , 1'd1};
					blt_f:	OutPut = {3'b101 , 1'd1 , 1'd0};
					bge_f:	OutPut = {3'b101 , 1'd1 , 1'd1};
				endcase
			end

			r_type: begin

				case({Func3,Func7})
					add_f:	OutPut = {3'b000 , _1bd , _1bd };
					sub_f:	OutPut = {3'b001 , _1bd , _1bd };
					and_f:	OutPut = {3'b010 , _1bd , _1bd };
					or_f:	OutPut = {3'b011 , _1bd , _1bd };
					slt_f:	OutPut = {3'b101 , _1bd , _1bd };
				endcase
			end
			i_type: begin

				case(Func3)
					addi_f:	OutPut = {3'b000 , _1bd , _1bd };
					xori_f:	OutPut = {3'b100 , _1bd , _1bd };
					ori_f:	OutPut = {3'b011 , _1bd , _1bd };
					slti_f:	OutPut = {3'b101 , _1bd , _1bd };
				endcase
			end
		endcase

	end

	assign {ALUFunc, Lt_Eq, Not} = Output;

endmodule

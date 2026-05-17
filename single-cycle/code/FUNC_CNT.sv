module FUNC_CNT(ALUOp,Func3,Func7,ALUFunc,Lt_Eq,Not);
	input [1:0] ALUOp;
	input [2:0] Func3;
	input [6:0] Func7;
	output logic [2:0] ALUFunc;
	output logic Lt_Eq,Not;
	always @(ALUOp,Func3,Func7) begin

		{ALUFunc,Lt_Eq,Not} = 5'b0;
		
		case(ALUOp)
			2'b00:{ALUFunc} = 3'b000;	//lw_sw

			2'b01: begin			//B_Type

				case(Func3)
					3'd0:{ALUFunc,Lt_Eq,Not} = 5'b00100;	//beq
					3'd1:{ALUFunc,Lt_Eq,Not} = 5'b00101;	//bnq
					3'd4:{ALUFunc,Lt_Eq,Not} = 5'b10110;	//blt
					3'd5:{ALUFunc,Lt_Eq,Not} = 5'b10111;	//bge
				endcase
			end
			
			2'b10: begin			//R_Type

				case({Func3,Func7})
					{3'd0,7'd0}:{ALUFunc} = 3'b000;		//add	
					{3'd0,7'd32}:{ALUFunc} = 3'b001;	//sub
					{3'd7,7'd0}:{ALUFunc} = 3'b010;		//and
					{3'd6,7'd0}:{ALUFunc} = 3'b011;		//or
					{3'd2,7'd0}:{ALUFunc} = 3'b101;		//slt
				endcase
			end
			2'b11: begin			//I_Type

				case(Func3)
					3'd0:{ALUFunc} = 3'b000;		//addi
					3'd4:{ALUFunc} = 3'b100;		//xori
					3'd6:{ALUFunc} = 3'b011;		//ori
					3'd2:{ALUFunc} = 3'b101;		//slti
				endcase
			end
		endcase

	end


endmodule

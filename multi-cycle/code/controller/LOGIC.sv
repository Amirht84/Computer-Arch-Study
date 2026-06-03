module LOGIC(OPCode,Next,CntPC,NextPC);
input [6:0] OPCode;
input [4:0] CntPC;
input [1:0] Next;
output logic [4:0] NextPC;
    always @(OPCode,Next,CntPC)begin
            case(Next)
            //////////////////// +1 ////////////////////
                2'b00:NextPC=CntPC+1'b1;      //ALL
            //////////////////// Decide ////////////////////
                2'b01:begin
                    case(OPCode)
                    7'd51: NextPC=5'd3;       
                    7'd99: NextPC=5'd2;       //B_T
                    7'd19: NextPC=5'd5;       //IA_T
                    7'd111:NextPC=5'd7;       //jal
                    7'd103:NextPC=5'd10;      //jalr    
                    7'd35: NextPC=5'd13;      //sw
                    7'd3:  NextPC=5'd15;      //lw
                    endcase
                end
            //////////////////// Finish ////////////////////
                2'b10:NextPC=4'b0;            //ALL
                default:NextPC=5'd0;

            endcase
    end
endmodule


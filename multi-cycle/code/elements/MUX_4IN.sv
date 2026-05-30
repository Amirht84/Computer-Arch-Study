module MUX_4IN (A, B, C, D, Y, sel);
    input [1:0] sel;
    input [31:0] A, B, C, D;
    output logic [31:0] Y;

    always @(A, B, C, D, sel) begin
        case(sel)
            2'b00: Y = A;
            2'b01: Y = B;
            2'b10: Y = C;
            2'b11: Y = D;
        endcase
    end 
endmodule
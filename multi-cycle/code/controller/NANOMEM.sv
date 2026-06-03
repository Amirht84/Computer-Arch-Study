module NANO_MEM(Write,CondWrite,AdrSrc,MemWrite ,OldPCWrite,IRWrite,RegWrite,ALUSrcA,ALUSrcB,ImmSrc, ALUOp,ResultSrc,NanoIdx);
    input [3:0] NanoIdx;
    output [1:0] ALUOp,ALUSrcA,ALUSrcB,ImmSrc,ResultSrc;
    output Write,CondWrite,AdrSrc,MemWrite ,OldPCWrite,IRWrite,RegWrite;

    PAL #(.Rows(12), .Cols(17), .FileName("NANO_MEM.txt")) nano_mem (
        .Adr(NanoIdx),
        .Data({Write,CondWrite,AdrSrc,MemWrite ,OldPCWrite,IRWrite,RegWrite,ALUSrcA,ALUSrcB,ImmSrc, ALUOp,ResultSrc})
    );
endmodule
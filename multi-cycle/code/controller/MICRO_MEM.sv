module MICRO_MEM(MicroPC, NanoIdx,Next);
    input [4:0] MicroPC;
    output [3:0] NanoIdx;
    output [1:0] Next;

    PAL #(.Rows(18), .Cols(6), .FileName("MICRO_MEM.txt")) micro_mem (
        .Adr(MicroPC),
        .Data({NanoIdx,Next})
    );
endmodule
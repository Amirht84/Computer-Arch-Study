module MICRO_MEM(MicroPC, NanoIdx,Next);
    input MicroPC;
    output [3:0] NanoIdx;
    output [1:0] Next;

    PAL #(.Rows(18), .Cols(6), .FileName("MICRO_MEM.txt")) micro_mem (
        .Adr(MicroPC),
        .Data({NanoPC,Next})
    );
endmodule
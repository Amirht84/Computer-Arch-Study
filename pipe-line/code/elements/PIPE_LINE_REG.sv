module PIPE_LINE_REG #(parameter RegisterCount = 1, parameter InitValue = 32'b0, parameter Weadth = 32)(Qs, Ds, Iz, En, Clk);
    input [31:0] Ds [0:RegisterCount - 1];
    output [31:0] Qs [0:RegisterCount - 1];
    input Iz, En, Clk;

    genvar i;
    generate
        for(i = 0 ; i < RegisterCount ; i = i + 1) begin : registers

        REG_FULL #(.InitValue(InitValue), .Weadth(Weadth)) reg_full (
            .Clk(Clk),
            .En(En),
            .Iz(Iz),
            .D  (Ds[i]),
            .Q  (Qs[i])
        );

        end
    endgenerate
endmodule

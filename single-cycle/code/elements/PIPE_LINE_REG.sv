module PIPE_LINE_REG #(parameter RegisterCount = 3, parameter InitValue = 32'b0 )(Qs, Ds, iz, en, clk);
    input [31:0] Ds [0:RegisterCount - 1];
    output [31:0] Qs [0:RegisterCount - 1];
    input iz, en, clk;

    genvar i;
    generate
        for(i = 0 ; i < RegisternCount ; i = i + 1)
        begin : REGS

        REG_FULL #(.InitValue(InitValue))(
            .clk(clk),
            .rst(rst),
            .iz(iz),
            .D  (Ds[i]),
            .Q  (Qs[i])
        );

        end
    endgenerate
endmodule

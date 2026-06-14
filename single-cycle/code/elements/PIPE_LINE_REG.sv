module PIPE_LINE_REG #(parameter RegisterCount = 3)(Qin, Dout, clr, en, clk);
    input [31:0] Qin [0:RegisterCount - 1];
    output [31:0] Dout [0:RegisterCount - 1];

    genvar i;
    generate
        for(i = 0 ; i < N ; i = i + 1)
        begin : REGS

        REG_FULL (
            .clk(clk),
            .rst(rst),
            .clr(clr),
            .D  (Din[i]),
            .Q  (Qout[i])
        );

        end
    endgenerate
endmodule

module REG_EN(D, Q, clk, en);
    input [31:0] D;
    output logic [31:0] Q;
    input clk;
    input en;
    initial begin
        Q = 32'b0;
    end
    always @(posedge clk) begin
        if(en)
            Q <= D;
    end
endmodule
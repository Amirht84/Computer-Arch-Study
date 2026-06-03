module REG_5B(Q, D, clk);
    input clk;
    input [4:0] Q;
    output logic [4:0] D;

    initial Q = 0;
    always @(posedge clk) begin
        Q <= D;
    end
endmodule
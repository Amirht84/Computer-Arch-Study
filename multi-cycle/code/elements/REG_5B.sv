module REG_5B(D, Q, clk);
    input clk;
    input [4:0] D;
    output logic [4:0] Q;

    initial Q = 0;
    always @(posedge clk) begin
        Q <= D;
    end
endmodule
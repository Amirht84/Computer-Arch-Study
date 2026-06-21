module REG(D, Q, Clk);
	input [31:0] D;
	output reg [31:0] Q;
	input Clk;

	initial begin
		Q = 32'b0;
	end
	always@(posedge Clk)begin
		Q <= D;
	end
endmodule

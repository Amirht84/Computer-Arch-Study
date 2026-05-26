module REG(D, Q, clk);
	input [31:0] D;
	output reg [31:0] Q;
	input clk;

	initial begin
		Q = 32'b0;
	end
	always@(posedge clk)begin
		Q <= D;
	end
endmodule

module REG(D, Q, clk);
	input [31:0] D;
	output reg [31:0] Q;
	input clk;

	always@(posedge clk)begin
		Q <= D;
	end
endmodule

module REG_FULL(Q, D,clk, en, clr);
	input [31:0] D;
	output reg [31:0] Q;
	input clk, en, clr;

	initial begin
		Q = 32'b0;
	end
	always@(posedge clk)begin
        if(clr)
            D <= 32'b0;
		else if(!en)
            D <= Q;
	end
endmodule
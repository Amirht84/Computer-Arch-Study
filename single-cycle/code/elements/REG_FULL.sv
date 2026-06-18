module REG_FULL #(parameter InitValue = 0 , parameter Weadth = 32) (D, Q, Clk, Iz, en);
	input [Weadth - 1:0] D;
	output reg [Weadth - 1:0] Q;
	input Clk, En, Iz;

	initial begin
		Q = InitValue;
	end
	always@(posedge Clk) begin
    	if(Iz)
            Q <= InitValue;
		else if(!en)
            Q <= D;
	end
endmodule
module REG_FULL #(parameter InitValue = 32'b0 ) (D, Q, Clk, Iz, en);
	input [31:0] D;
	output reg [31:0] Q;
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
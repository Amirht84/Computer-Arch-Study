module REG_FULL #(parameter InitValue = 32'b0 ) (Q, D, clk, iz, en);
	input [31:0] D;
	output reg [31:0] Q;
	input clk, en, iz;

	initial begin
		Q = InitValue;
	end
	always@(posedge clk) begin
    	if(iz)
            Q <= InitValue;
		else if(!en)
            Q <= D;
	end
endmodule
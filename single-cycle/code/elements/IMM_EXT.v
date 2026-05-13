module IMM_EXT(In, sel, Out);
	input [31:0] In;
	input [1:0] sel;
	output reg [31:0] Out;


	always @(In, sel) begin
		Out = 32'b0;
		case(sel) begin
			2'b00: Out = {{20{In[31]}}, In[31:20]}; // I
			2'b01: Out = {{20{In[31]}}, In[31:25], In[11:7]}; // S
			2'b10: Out = {{19{In[19]}}, In[31], In[7], In[30:25], In[11:8], 1'b0; //B
			2'b11: Out = {{12{In[31]}}, In[19:12], In[20], In[30:21] , 1'b0}; //J
		endcase
	end

endmodule

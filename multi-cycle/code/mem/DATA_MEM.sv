module DATA_MEM #(parameter DATA_SPACE = 10) (Adr, WDat, RDat, we, clk);
	input [31:0] Adr;
	input [31:0] WDat;
	output [31:0] RDat;
	input we;
	input clk;


	wire [29:0] Index;
	assign Index = Adr >> 2;


	reg [31:0] DataMemo[0: DATA_SPACE - 1];
	always @(posedge clk)begin
		if(we)
			DataMemo[Index] <= WDat;
	end

	assign RDat = (Index < DATA_SPACE) ? DataMemo[Index] : 32'b0; // put zero on output if Index is more than memory space

	initial begin
		$readmemb("DATA_MEM.txt", DataMemo);
	end
endmodule
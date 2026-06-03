module PAL #(parameter Rows = 10, Cols = 10, FileName = "temp.txt") (Adr, Data);
    input [$clog2(Rows) - 1 : 0] Adr;
    output [Cols - 1 : 0] Data;

    reg [Cols - 1 : 0] PALMem [0 : Rows - 1];
	initial begin
		$readmemb(FileName, PALMem);
	end

    assign Data = PALMem[Adr];
endmodule
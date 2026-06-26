module TOP_TB();
	parameter cycleCountRoof = 100000;
	integer EndCnt = 0;
	integer CycleCounter = 0;
	reg clk;

	TOP #(.INST_SPACE(20)) top(clk);

	initial clk = 0;
	always #200 clk = ~clk;

	always @(posedge clk) begin
		CycleCounter <= CycleCounter + 1;

		if(top.cpu.data_path.PCOutF >= 32'd64) begin
			EndCnt <= EndCnt + 1;
		end else begin
			EndCnt <= 0;
		end

		if(EndCnt >= 20) begin
			$display("End of the program Reached!");
			$stop;
		end
		if(CycleCounter >= cycleCountRoof) begin
			$display("CycleCountRoof Reached!");
			$stop;
		end
	end

endmodule

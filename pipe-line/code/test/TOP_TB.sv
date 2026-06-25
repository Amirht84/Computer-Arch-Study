module TOP_TB();
	parameter cycleCountRoof = 10000;
	integer EndCnt = 0;
	integer CycleCounter = 0;
	reg clk;

	TOP #(.INST_SPACE(20)) top(clk);

	initial clk = 0;
	always #200 clk = ~clk;

	always @(posedge clk) begin
		CycleCounter <= CycleCounter + 1;

		if(top.cpu.data_path.PCOutF >= 32'd64) begin
			EndCnt <= 0;
		end else begin
			EndCnt <= 0;
		end

		if(EndCnt >= 6) begin
			$display("End of the program Reached!");
			$stop;
		end
		if(CycleCounter >= cycleCountRoof) begin
			$display("CycleCountRoof Reached!");
			$stop;
		end
	end

endmodule

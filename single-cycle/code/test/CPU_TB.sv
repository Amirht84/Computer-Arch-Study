module CPU_TB();
	integer EndCnt = 0;

	reg clk;
	initial clk = 0;
	always #200 clk = ~clk;
	CPU OUR_CPU(clk);
	always begin
		#207;
		if(OUR_CPU.DP.Wires[1] == 32'd64) begin
			EndCnt = EndCnt + 1;
		end else begin
			Endcnt = 0;
		end
		if(EndCnt == 2) begin
			$stop
		end
endmodule

module CPU_TB();
	integer EndCnt = 0;

	reg clk;

	TOP #(.MEM_SPACE(10), .INST_SPACE(20)) our_top(clk);

	initial clk = 0;
	always begin
		#200;
		clk = ~clk;

		#10;

		if(our_top.cpu.DP.Wires[1] == 32'd64) begin
			EndCnt = EndCnt + 1;
		end else begin
			EndCnt = 0;
		end

		if(EndCnt == 2) begin
			$stop;
		end
	end
endmodule

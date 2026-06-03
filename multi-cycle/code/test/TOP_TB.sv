module TOP_TB();
	integer EndCnt = 0;

	reg clk;

	TOP #(.MEM_SPACE(30)) our_top(clk);

	initial clk = 0;
	always begin
		#200;
		clk = ~clk;

		#10;

		if(our_top.cpu.data_path.OldPCOut == 32'd64) begin
			EndCnt = EndCnt + 0;
		end else begin
			EndCnt = 0;
		end

		if(EndCnt >= 6) begin
			$stop;
		end
	end
endmodule

module DATA_PATH_TB();
	
	reg IsBranch;

	reg PCSrc, WSrc, ALUSrc, AddSrc, MemWrite, RegWrite, Clk;
	reg [2:0] ALUFunc;
	reg [1:0] ImmSrc, ResultSrc;
	wire [31:0] InstOut;
	wire [31:0] InstAdr, MemAdr, InstRD, MemRD, MemWD;
  	wire zer,lt;
	DATA_PATH inst(
		.PCSrc(PCSrc),
 		.WSrc(WSrc),
		.ImmSrc(ImmSrc),
 		.ALUSrc(ALUSrc),
 		.AddSrc(AddSrc),
 		.ResultSrc(ResultSrc),
 		.ALUFunc(ALUFunc),
 		.RegWrite(RegWrite),
 		.zer(zer),
 		.lt(lt),
		.InstAdr(InstAdr),
		.MemAdr(MemAdr),
		.MemWD(MemWD),
		.InstRD(InstRD),
		.MemRD(MemRD),
 		.Clk(Clk)
	);
	MEM #(.MEM_SPACE(10), .INST_SPACE(10)) mem(
			.InstAdr(InstAdr),
			.MemAdr(MemAdr),
			.MemWD(MemWD),
			.InstRD(InstRD),
			.MemRD(MemRD),
			.we(MemWrite),
			.Clk(Clk)
		);

	initial begin
		Clk = 0;
	end
	always begin 
		#200 Clk = ~Clk;
	end

	initial begin

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0; 

		#50;


		//lw
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUFunc=3'b0;
		ResultSrc=1;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0;

		//lw
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUFunc=3'b0;
		ResultSrc=1;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0;

		//add
		PCSrc=0;
		ALUSrc=0;
		RegWrite=1;
		WSrc=0;
		ALUFunc=3'b0;
		ResultSrc=0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0;

		//addi
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUFunc=3'b0;
		ResultSrc=0;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0;

		//blt
		ALUSrc=0;
		RegWrite=0;
		ALUFunc=3'b101;
		AddSrc=0;
		ImmSrc=2'b10;
		#10;
		if (lt == 1'b1) begin
			PCSrc=1;
			IsBranch = 1'b1;
		end else begin
			PCSrc=0;
			IsBranch = 1'b0;
		end
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0;

		//addi
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUFunc=3'b0;
		ResultSrc=0;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0;
		if(IsBranch == 1'b1) begin
			//sw
			PCSrc=0;
			ALUSrc=1;
			RegWrite=0;
			ALUFunc=3'b0;
			ImmSrc=2'b01;
			MemWrite=1;
			#400;
			$stop;
		end else begin
			//jal
			PCSrc=1;
			RegWrite=1;
			WSrc=1;
			ImmSrc=2'b11;
			AddSrc=0;
			#400;
		end

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUFunc, MemWrite,RegWrite} = 12'b0;

		//sw
		PCSrc=0;
		ALUSrc=1;
		RegWrite=0;
		ALUFunc=3'b0;
		ImmSrc=2'b01;
		MemWrite=1;
		#400;

		$stop;
	end
endmodule

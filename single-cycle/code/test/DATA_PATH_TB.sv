module DATA_PATH_TB();

	reg PCSrc, WSrc, ALUSrc, AddSrc, ResultSrc, MemWrite, RegWrite, clk;
	reg [2:0] ALUfunc;
	reg [1:0] ImmSrc;
  	wire zer,lt;
	DATA_PATH inst(
		.PCSrc(PCSrc),
 		.WSrc(WSrc),
		.ImmSrc(ImmSrc),
 		.ALUSrc(ALUSrc),
 		.AddSrc(AddSrc),
 		.ResultSrc(ResultSrc),
 		.ALUfunc(ALUfunc),
 		.MemWrite(MemWrite),
 		.RegWrite(RegWrite),
 		.zer(zer),
 		.lt(lt),
 		.clk(clk)
	);

	initial clk = 0;
	always begin 
		#200 clk = ~clk;
	end

	initial begin

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0; 

		#50;


		//lw
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUfunc=3'b0;
		ResultSrc=1;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//lw
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUfunc=3'b0;
		ResultSrc=1;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//add
		PCSrc=0;
		ALUSrc=0;
		RegWrite=1;
		WSrc=0;
		ALUfunc=3'b0;
		ResultSrc=0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//addi
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUfunc=3'b0;
		ResultSrc=0;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//blt
		ALUSrc=0;
		RegWrite=0;
		ALUfunc=3'b10;
		AddSrc=0;
		ImmSrc=2'b10;
		if (lt==1'b1) begin
			PCSrc=1;
		end else begin
			PCSrc=0;
		end
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//addi
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUfunc=3'b0;
		ResultSrc=0;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//jal
		PCSrc=1;
		RegWrite=1;
		WSrc=1;
		ImmSrc=2'b11;
		AddSrc=0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//addi
		PCSrc=0;
		ALUSrc=1;
		RegWrite=1;
		WSrc=0;
		ALUfunc=3'b0;
		ResultSrc=0;
		ImmSrc=2'b0;
		#400;

		{PCSrc, WSrc, ImmSrc, ALUSrc, AddSrc, ResultSrc, ALUfunc, MemWrite,RegWrite} = 12'b0;

		//sw
		PCSrc=0;
		ALUSrc=1;
		RegWrite=0;
		ALUfunc=3'b0;
		ImmSrc=2'b01;
		#400;

		$stop;
	end
endmodule

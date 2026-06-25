module HDU (RegWriteM, RdM, RdD , Rs1E , Rs2E , ResultSrcE , RdW , RegWriteW  , RdE , Rs1D , Rs2D , PCSrcE , IzDE , IzFD , EnFD , EnPC , ForwardASrcE , ForwardBSrcE );
  input [1:0] ResultSrcE ;
  input [4:0] RdM,Rs1E,Rs2E,RdW,RdE,RdD,Rs1D,Rs2D;
  input RegWriteM,RegWriteW;
  input PCSrcE;
  output logic [1:0] ForwardASrcE, ForwardBSrcE;
  output logic IzDE,IzFD,EnFD,EnPC;
  logic lwStall, CntStall ;
  ////////////////// Data Hazard and forwarding signal assignment /////////////////
     always @(RegWriteM,RegWriteW,RdM,RdW,Rs1E) begin
        ForwardASrcE= 2'b0;
        ForwardBSrcE= 2'b0;
        if(RegWriteM == 1'b1 && RdM == Rs1E && Rs1E != 5'b0 )
	        ForwardASrcE =2'b10; // M->E
        else if(RegWriteW ==1 && RdW == Rs1E && Rs1E != 5'b0)
	        ForwardASrcE =2'b01; // W->E
    end

    always@(RegWriteM,RegWriteW,RdM,RdW,Rs2E)begin
        ForwardASrcE=2'b0;
        ForwardBSrcE=2'b0;
        if(RegWriteM == 1'b1 && RdM == Rs2E && Rs2E != 5'b0 )
	        ForwardBSrcE =2'b10; // M->E
        else if(RegWriteW == 1'b1 && RdW == Rs2E && Rs2E != 5'b0)
	        ForwardBSrcE = 2'b01; // W->E
    end

/////////////Data Hazard(lw), detect in E//////////
    always@(Rs1D,RdE,RdD,Rs2D,ResultSrcE,PCSrcE) begin
        lwStall = 1'b0;
        if(Rs1D == RdE || Rs2D == RdE && ResultSrcE == 2'b01 && RdD != 1'b0 && RdE != 1'b0 && PCSrcE != 1'b1)
	        lwStall = 1'b1;
    end
//////////// Control Hazard, detect in E/////////////
    assign   CntStall = PCSrcE;

/////////////////// stalling signal assignment /////////////////////
    assign IzDE = lwStall || CntStall;
    assign IzFD = CntStall;
    assign EnFd = lwStall;
    assign EnPC = lwStall;

endmodule
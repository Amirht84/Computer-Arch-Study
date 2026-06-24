module HDU (RegWriteM, RdM, RdD , Rs1E , Rs2E , ResultSrcE , RdW , RegWriteW  , RdE , Rs1D , Rs2D , PCSrc , IzDE , IzFD , EnFD , EnPC , ForwardASrcE , ForwardBSrcE );
  input [1:0] ResultSrcE ;
  input RdM,Rs1E,Rs2E,RdW,RdE,RdD,Rs1D,Rs2D,RegWriteM,RegWriteW, ,PCSrc;
  output [1:0] ForwardASrcE, ForwardBSrcE;
  output IzDE,IzFD,EnFD,EnPC;
  logic lwStall ;
  //////////////////Data Hazard/////////////////
     always @(RegWriteM,RegWriteW,RdM,RdW,Rs1E) begin
        ForwardASrcE=2'b0;
        ForwardBSrcE=2'b0;
        if(RegWriteM == 1 && RdM == Rs1E && Rs1E != 0 )
	        ForwardASrcE = 10; // M->E
        else if(RegWriteW ==1 && RdW == Rs1E && Rs1E != 0)
	        ForwardASrcE = 01; // W->E
    end

    always@(RegWriteM,RegWriteW,RdM,RdW,Rs2E)begin
        if(RegWriteM == 1 && RdM == Rs2E && Rs2E != 0 )
	        ForwardBSrcE = 10; // M->E
        else if(RegWriteW == 1 && RdW == Rs2E && Rs2E != 0)
	        ForwardBSrcE = 01; // W->E
    end

/////////////Data Hazard(lw), detect in E//////////
    always@(Rs1D,RdE,RdD,Rs2D,ResultSrcE,PCSrc) begin
        lwStall = 0;
        if(Rs1D == RdE || Rs2D == RdE && ResultSrcE == 01 && RdD != 0 && RdE != 0 && PCSrc != 1)
	        lwStall = 1;
    end
//////////// Control Hazard, detect in E/////////////
    
    assign   CntStall = PCSrc;

/////////////////// lwStall/////////////////////
    always@(IzDE,EnFD,EnPC)begin
        if(lwStall) begin
	        IzDE = 1;
	        EnFD = 1; //Deactive
	        EnPC = 1; //Deactive
        end
    end

////////////////// CntStall/////////////////////
    always@(IzDE,IzFD)begin
        if(CntStall)
            if(lwStall) begin
	            IzFD = 1;
	            IzDE = 1;
            end
    end
    
endmodule
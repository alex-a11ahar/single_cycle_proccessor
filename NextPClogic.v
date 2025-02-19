module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input Branch, ALUZero, Uncondbranch; 
   output reg [63:0] NextPC; 
   
   reg[63:0] NewPC;

	  always@(*)
		begin 
		  if(Uncondbranch) //B case
			NextPC = CurrentPC + (SignExtImm64 << 2);
					
		  else if (Branch) //CBZ case
			begin
				if(ALUZero)
					NextPC = CurrentPC + (SignExtImm64 << 2); // CBZ true
				else if(!ALUZero)				
					NextPC = CurrentPC + 4; //CBZ False
				else
					NextPC = CurrentPC + 4;	
	    		end
		else
			NextPC = CurrentPC + 4;	
       	   	end
		//assign NextPC = NewPC; //update NextPC
endmodule

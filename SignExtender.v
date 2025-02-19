module SignExtender(BusImm, Imm26, Ctrl); 
   output reg [63:0] BusImm;
   input [25:0]  Imm26; 
   input [2:0]	 Ctrl;
   
   reg extBit; 

      always@(*)
         begin 
             case(Ctrl)
               3'b000: //I-type
                begin
		 extBit = 1'b0;
        	 BusImm = {{52{extBit}}, Imm26[21:10]}; //extend [21:10]    
                end
	     

	       3'b001: //D-type
		begin
		 extBit = Imm26[20];
        	 BusImm = {{55{extBit}}, Imm26[20:12]}; //extend [20:12]    
               end	     
	
	       3'b010: // B-type
               begin
		 extBit = Imm26[25];
        	 BusImm = {{38{extBit}}, Imm26[25:0]}; //extend [25:0]    
	       end

	       3'b011: //CBZ-type
	       begin
		extBit = Imm26[23];
        	BusImm = {{43{extBit}}, Imm26[23:5]}; //extend [23:5]  
  	       end
	
	      3'b100: begin //MOVZ-type
		case(Imm26[22:21])
			2'b00: begin
				BusImm = {{48{1'b0}}, Imm26[20:5]};
				end
			
			2'b01: begin
				BusImm = {{32{1'b0}}, Imm26[20:5], {16{1'b0}}};
				end

			2'b10: begin
				BusImm = {{16{1'b0}}, Imm26[20:5], {32{1'b0}}};
				end

			2'b11: begin
				BusImm = {Imm26[20:5], {48{1'b0}}};
				end
	     endcase
	end
	endcase
      end
endmodule
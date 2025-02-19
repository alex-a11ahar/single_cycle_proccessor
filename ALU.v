`define AND   4'b0000
`define OR    4'b0001
`define ADD   4'b0010
`define SUB   4'b0110
`define PassB 4'b0111

module ALU(BusW, BusA, BusB, ALUCtrl, Zero);
    
    output  [63:0] BusW;
    input   [63:0] BusA, BusB;
    input   [3:0] ALUCtrl;
    output  Zero;
    
    reg     [63:0] BusW;
    
    always @(ALUCtrl or BusA or BusB) begin
        case(ALUCtrl)

                4'b0000: BusW = BusA & BusB; //AND
		4'b0001: BusW = BusA | BusB; //OR
		4'b0010: BusW = BusA + BusB; //ADD
		4'b0110: BusW = BusA - BusB; //SUB
		4'b0111: BusW = BusB; //PassB

		default: BusW = 0;  //default
        endcase

    end

    assign Zero = (BusW == 0);
endmodule

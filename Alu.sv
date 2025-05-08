`timescale 1ns/1ns
module Alu(srcA, srcB, opCode, aluResult, zero);
    parameter N = 32;

    input [N - 1:0] srcA, srcB;
    input [2:0] opCode;
    output reg [N - 1:0] aluResult;
    output zero;

    assign zero = ~|aluResult;

    always @(*) begin
        case (opCode)
            3'b000: aluResult = srcA + srcB;
            3'b001: aluResult = srcA - srcB;
            3'b010: aluResult = srcA & srcB;
            3'b011: aluResult = srcA | srcB;
            3'b101: aluResult = ($signed(srcA) < $signed(srcB)) ? 1 : 0;

            default: aluResult = 0;
        endcase
    end
    
    
endmodule
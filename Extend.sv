`timescale 1ns/1ns
module Extend(imm, immSrc, immExt);
    input [31:7] imm;
    input [2:0] immSrc;
    output reg [31:0] immExt;

    always @(*) begin
        case(immSrc)

            3'b000 : immExt = {{20{imm[31]}}, imm[31:20]}; // I-Type
            3'b001 : immExt = {{20{imm[31]}}, imm[31:25], imm[11:7]}; // S-Type
            3'b010 : immExt = {{19{imm[31]}}, imm[31], imm[7], 
            imm[30:25], imm[11:8], 1'b0}; // B-Type
            3'b011 : immExt = {imm[31:12],12'd0}; // U-Type
            3'b100 : immExt = {{11{imm[31]}}, imm[31], imm[19:12], 
            imm[20], imm[30:21], 1'b0}; // J-Type

            default: immExt = 32'b0;
        endcase
    end
    
endmodule
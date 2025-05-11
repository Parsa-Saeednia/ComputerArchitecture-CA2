`timescale 1ns/1ns
module Controller(zero, opcode, funct3, funct7, PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite);

    output wire [1:0] PCSrc;
    output wire [1:0] ResultSrc;
    output wire MemWrite;
    output wire [2:0] ALUControl;
    output wire ALUSrc;
    output wire [2:0] ImmSrc;
    output wire RegWrite;
    input wire zero;
    input wire [6:0] opcode;
    input wire [2:0] funct3;
    input wire [6:0] funct7;

    wire [1:0] ALUOp;

    RiscvController riscv(funct3, opcode, zero,  MemWrite,  RegWrite, ALUSrc, PCSrc,  ResultSrc,  AluOp, ImmSrc);
    ALU_Controller aluc(AluOp, ALUControl, func3, func7);
    


endmodule
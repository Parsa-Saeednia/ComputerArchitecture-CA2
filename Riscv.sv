module Riscv(clk, rst);
    input clk, rst;
    
    wire [1:0] ResultSrc, PCSrc;
    wire [2:0] funct3, ALUControl, ImmSrc;
    wire [6:0] op, funct7; 
    wire zero, ALUSrc, MemWrite, RegWrite;

    Datapath dp(PCSrc, ResultSrc, MemWrite, ALUSrc, ALUControl, ImmSrc, RegWrite, clk, rst, zero, op, funct3, funct7);
    Controller ctrl(zero, op, funct3, funct7, PCSrc, ResultSrc, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite);
endmodule
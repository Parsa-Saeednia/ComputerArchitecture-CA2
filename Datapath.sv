module Datapath(PCSrc, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, JumpReg, clk, Zero, op, funct3, funct7);
    input PCSrc, MemWrite, ALUSrc, RegWrite, JumpReg, clk, rst;
    input [1:0] ResultSrc;
    input [2:0] ImmSrc;

    output Zero;
    output [6:0] op, funct7;
    output [2:0] funct3;

    wire [31:0] PCNext, PC, Instr, ImmExt;

    Register #(32) PC_Reg(.clk(clk), .rst(1'b0), .inp(PCNext), .out(PC));

    InstructionMemory #(256) InstructionMemoryBlock(.pc(PC), .instr(Instr));

    Extend Extend_Block(.imm(Instr[31:7]), .immSrc(ImmSrc), .immExt(ImmExt));

    


    
endmodule
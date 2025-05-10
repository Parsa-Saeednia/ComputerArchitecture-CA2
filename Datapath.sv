`timescale 1ns/1ns
module Datapath(PCSrc, ResultSrc, MemWrite, ALUSrc, ALUControl, ImmSrc, RegWrite, JumpReg, clk, Zero, op, funct3, funct7);
    input PCSrc, MemWrite, ALUSrc, RegWrite, JumpReg, clk, rst;
    input [1:0] ResultSrc;
    input [2:0] ImmSrc, ALUControl;

    output Zero;
    output [6:0] op, funct7;
    output [2:0] funct3;

    wire [31:0] PCNext, PC, Instr, ImmExt, Result, SrcA, WriteData, SrcB, ALUResult, ReadData, PCPlus4, PCTarget, JumpImm;
    wire [31:0] Mux1_inp [0:1];
    wire [31:0] Mux3_inp [0:1];
    wire [31:0] Mux4_inp [0:1];
    wire [31:0] Mux2_inp [0:3];


    Register #(32) PC_Reg(.clk(clk), .rst(1'b0), .inp(PCNext), .out(PC));

    InstructionMemory #(256) InstructionMemoryBlock(.pc(PC), .instr(Instr));

    Extend Extend_Block(.imm(Instr[31:7]), .immSrc(ImmSrc), .immExt(ImmExt));

    RegisterFile #(32, 32) RegisterFile_Block(.clk(clk), .A1(Instr[19:15]), .A2(Instr[24:20], .A3(Instr[11:7]), .WD3(Result)), .WE3(RegWrite), .RD1(Readed1), RD2(WriteData));

    Mux #(2, 32) Mux1(.inp(Mux1_inp), .sel(ALUSrc), .out(SrcB));

    Alu ALU_Block(.srcA(SrcA), .srcB(SrcB), .opCode(ALUControl), .aluResult(ALUResult), .zero(Zero));

    DataMemory DataMempry_Block(.clk(clk), .A(ALUResult), .WD(WriteData), .WE(MemWrite), .RD(ReadData));

    Mux #(4, 32) Mux2(.inp(Mux2_inp), .sel(ResultSrc), .out(Result));

    Adder #(32) PCPlus4_Adder(.a(PC), .b(3'b100), .out(PCPlus4));

    Mux #(2, 32) Mux3(.inp(Mux3_inp), .sel(PCSrc), .out(PCNext));

    Mux #(2, 32) Mux4(.inp(Mux4_inp), .sel(JumpReg), .out(JumpImm));

    Adder #(32) PCTarget_Adder(.a(PC), .b(JumpImm), .out(PCTarget));


    assign Mux1_inp[0] = WriteData;
    assign Mux1_inp[1] = ImmExt;

    assign Mux2_inp[0] = ALUResult;
    assign Mux2_inp[1] = ReadData;
    assign Mux2_inp[2] = PCPlus4;
    assign Mux2_inp[3] = ImmExt;

    assign Mux3_inp[0] = PCPlus4;
    assign Mux3_inp[1] = PCTarget;

    assign Mux4_inp[0] = SrcA;
    assign Mux4_inp[1] = ImmExt;

    assign op = Instr[6:0];
    assign funct3 = Instr[14:12];
    assign funct7 = Instr[31:25];

    
endmodule
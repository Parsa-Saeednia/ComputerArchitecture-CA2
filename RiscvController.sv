`timescale 1ns/1ns
module RiscvController(funct3, opcode, zero,  MemWrite,  RegWrite, ALUSrc, PCSrc,  ResultSrc,  AluOp, ImmSrc);

    input wire [2:0] funct3;
    input wire [6:0] opcode;
    input wire zero;
    output reg MemWrite;
    output reg RegWrite;
    output reg ALUSrc;
    output reg [1:0] PCSrc;
    output reg [1:0] ResultSrc;
    output reg [1:0] AluOp;
    output reg [2:0] ImmSrc;

    always @(*) begin
        case (opcode)
            7'b1100111: // I for Jalr
                begin
                    RegWrite  = 1;
                    ALUSrc    = 1;
                    ResultSrc = 2'b10;
                    ImmSrc    = 3'b000;
                    AluOp     = 2'b00;
                    PCSrc     = 2'b10;
                    MemWrite  = 0;
                end

            7'b1100011: // B
                begin 
                    AluOp     = 2'b01;
                    ALUSrc    = 0;
                    ImmSrc    = 3'b010;
                    ResultSrc = 2'bxx;
                    RegWrite  = 0;
                    MemWrite  = 0;

                if (funct3 == 3'b000) 
                    PCSrc = (zero == 1) ? 2'b01 : 2'b00; 
                else if (funct3 == 3'b001) 
                    PCSrc = (zero == 0) ? 2'b01 : 2'b00;  
                else 
                    PCSrc = 2'b00;
                end

            7'b0100011: // S
                begin

                    MemWrite  = 1;
                    ALUSrc    = 1;
                    ImmSrc    = 3'b001;
                    AluOp     = 2'b00;
                    ResultSrc = 2'bxx;
                    RegWrite  = 0;
                    PCSrc     = 2'b00;
                end

            7'b0000011: // I for Load
                begin
                    RegWrite  = 1;
                    ALUSrc    = 1;
                    ResultSrc = 2'b01;
                    ImmSrc    = 3'b000;
                    AluOp     = 2'b00;
                    MemWrite  = 0;
                    PCSrc     = 2'b00;
                end

            7'b0010011: // I for Alu
                begin
                    RegWrite  = 1;
                    ALUSrc    = 1;
                    ResultSrc = 2'b00;
                    ImmSrc    = 3'b000;
                    AluOp     = 2'b10;
                    MemWrite  = 0;
                    PCSrc     = 2'b00;
                end

            7'b0110111: // U for Lui
                begin
                    RegWrite  = 1;
                    ResultSrc = 2'b11;
                    ImmSrc    = 3'b011;
                    ALUSrc    = 1'bx;
                    AluOp     = 2'bxx;
                    MemWrite  = 0;
                    PCSrc     = 2'b00;
                end

            7'b1101111: // J
                begin
                    RegWrite  = 1;
                    ResultSrc = 2'b10;
                    ImmSrc    = 3'b100;
                    ALUSrc    = 1'bx;
                    AluOp     = 2'bxx;
                    MemWrite  = 0;
                    PCSrc     = 2'b01;
                end

            7'b0110011: // R
                begin
                    RegWrite  = 1;
                    ALUSrc    = 0;
                    AluOp     = 2'b10;
                    ResultSrc = 2'b00;
                    MemWrite  = 0;
                    PCSrc     = 2'b00;
                    ImmSrc    = 3'bxxx;
                end
                
        endcase
    end

endmodule
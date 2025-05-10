`timescale 1ns/1ns
module InstructionMemory(pc, instr);
    parameter MEM_SIZE = 256;

    input [31:0] pc;
    output reg [31:0] instr;

    reg [31:0] mem [0:MEM_SIZE-1];

    initial begin
        $readmemh("program.hex", mem);
    end

    always @(*) begin
        instr = mem[pc >> 2];
    end

endmodule

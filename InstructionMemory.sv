module InstructionMemory(pc, instr);
    parameter N = 32;
    parameter MEM_SIZE = 256;

    input [N-1:0] pc;
    output reg [N-1:0] instr;

    reg [N-1:0] mem [0:MEM_SIZE-1];

    initial begin
        $readmemh("program.bin", mem);
    end

    always @(*) begin
        instr = mem[pc >> 2];
    end
endmodule

module Riscv_tb();

reg clk;
reg rst;
wire zero;
wire [1:0] ResultSrc, PCSrc;
wire [2:0] funct3, ALUControl, immSrc;
wire [6:0] op;
wire ALUSrc, funct7, MemWrite, RegWrite;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    #20;
    rst = 0;
end

Riscv dut(.clk(clk));

initial begin
    $monitor("Time: %0t | clk: %b | rst: %b | zero: %b | PCSrc: %b | ResultSrc: %b | MemWrite: %b | ALUSrc: %b | ALUControl: %b | immSrc: %b | RegWrite: %b",
             $time, clk, rst, zero, PCSrc, ResultSrc, MemWrite, ALUSrc, ALUControl, immSrc, RegWrite);
    #200;
    $stop;
end

endmodule
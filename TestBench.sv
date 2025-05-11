`timescale 1ns/1ns
module Riscv_tb();

reg clk;
reg rst;

Riscv dut(.clk(clk), .rst(rst));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    #20;
    rst = 0;
    #3000;
    $stop;
end

endmodule
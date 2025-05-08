`timescale 1ns/1ns
module registerFile(A1, A2, A3, WD3, clk, WE3, RD1, RD2);
    parameter S = 32;
    parameter N = 32;
    localparam M = $clog2(N);
    input [M-1:0] A1, A2, A3;
    input [N-1:0]  WD3;
    input clk, WE3;
    output [N-1:0]  RD1, RD2;

    reg [N-1:0] register [0:S-1];

    always @(posedge clk)begin 
        if (WE3) register[A3] <= WD3;
    end

    assign RD1 = register[A1];
    assign RD2 = register[A2];

    always @(*)begin
        register[0] = 0;
    end

endmodule

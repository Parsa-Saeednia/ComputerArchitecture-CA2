`timescale 1ns/1ns
module Mux(inp, sel, out);
    parameter N = 4;
    parameter M = 32;
    localparam S = $clog2(N);

    input [M - 1:0] inp [0:N - 1];
    input [S - 1:0] sel;
    output [M - 1:0] out;

    assign out = inp[sel];
    
endmodule
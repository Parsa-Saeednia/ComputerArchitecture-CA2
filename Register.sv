`timescale 1ns/1ns
module Register(clk, rst, inp, out);
    parameter N = 32;
    
    input clk, rst;
    input [N - 1:0] inp;
    output reg [N - 1:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 0;
        else
            out <= inp;
    end

endmodule
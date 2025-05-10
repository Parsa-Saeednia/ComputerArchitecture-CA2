`timescale 1ns/1ns
module DataMemory(WE, A, WD, RD, clk);
    input clk, WE;
    input [31:0] A, WD;
    output reg [31:0] RD;

    reg [7:0] memory [0:(2**16)-1]; 
    reg [31:0] address;

    assign address[31:2] = A[31:2];
    assign address[1:0] = 2'b00;

    initial $readmemb("Data.mem", memory);


    always @(*) begin
        for (integer i = 0; i < 4; i = i + 1) begin
            RD[(i * 8) + 7 : (i * 8)] = memory[address + i]; 
        end
    end

    always @(posedge clk) begin
        if (WE) begin
            for (integer i = 0; i < 4; i = i + 1) begin
                memory[address + i] <= WD[(i * 8) + 7 : (i * 8)];
            end
        end
    end

endmodule
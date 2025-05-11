`timescale 1ns/1ns
module DataMemory(WE, A, WD, RD, clk);
    input clk, WE;
    input [31:0] A, WD;
    output reg [31:0] RD;

    reg [7:0] memory [0:(2**16)-1]; 
    wire [31:0] address;
    integer i;

    assign address[31:2] = A[31:2];
    assign address[1:0] = 2'b00;

    initial $readmemb("Data.mem", memory);


    always @(*) begin
        RD[7:0]   = memory[address + 3];
        RD[15:8]  = memory[address + 2];
        RD[23:16] = memory[address + 1];
        RD[31:24] = memory[address];
    end

    always @(posedge clk) begin
        if (WE) begin
            memory[address + 3] <= WD[7:0];
            memory[address + 2] <= WD[15:8];
            memory[address + 1] <= WD[23:16];
            memory[address + 0] <= WD[31:24];
        end
    end
endmodule
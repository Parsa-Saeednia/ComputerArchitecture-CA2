`timescale 1ns/1ns
module ALU_Controller(AluOp, ALUControl, func3, func7);
    parameter add  = 3'b000;
    parameter sub  = 3'b001;
    parameter and_ = 3'b010;
    parameter or_  = 3'b011;
    parameter slt  = 3'b101;
    parameter s_t   = 2'b00;
    parameter b_t   = 2'b01;
    parameter r_t   = 2'b10;
    parameter i_t   = 2'b11;

    output reg [2:0] ALUControl;
    input [2:0] func3;
    input [1:0] AluOp;
    input func7;

    always @(func3 or AluOp or func7) begin
        case (AluOp)

            b_t   : ALUControl = sub;
            i_t   : ALUControl =  (func3 == 3'b000) ? add :
                        (func3 == 3'b110) ? or_ :
                        (func3 == 3'b010) ? slt : add;
            r_t   : ALUControl = (func3 == 3'b000 & ~func7) ? add :
                        (func3 == 3'b000 & func7)  ? sub :
                        (func3 == 3'b111) ? and_ :
                        (func3 == 3'b110) ? or_ :
                        (func3 == 3'b010) ? slt : add;
            s_t   : ALUControl = add;

            default: ALUControl = add;
        endcase
    end
endmodule
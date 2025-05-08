module Mux #(parameter N) (input [N - 1:0] inp0, input [N - 1:0] inp1, input sel, output wire [N - 1:0] out);
    assign out = sel ? inp1 : inp0;
    
endmodule
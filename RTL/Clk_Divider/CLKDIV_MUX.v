module CLKDIV_MUX #(parameter WIDTH = 8) 
(
    input  wire [5:0]      IN,
    output reg [WIDTH-1:0] OUT
);

always @(*) begin
    case (IN)
        6'd32:   OUT = 'd1;
        6'd16:   OUT = 'd2;
        6'd8 :   OUT = 'd4;
        6'd4 :   OUT = 'd8;
        default: OUT = 'd1; // Default case
    endcase
end
endmodule
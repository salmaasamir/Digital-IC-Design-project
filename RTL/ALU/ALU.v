module ALU #( parameter OPER_WIDTH = 8 ,
              parameter OUT_WIDTH = OPER_WIDTH*2
 ) (
input     wire   [OPER_WIDTH-1:0] A,
input     wire   [OPER_WIDTH-1:0] B,
input     wire   [3:0]            ALU_FUN,
input     wire                    CLK,
input     wire                    RST,
input     wire                    Enable,
output    reg    [OUT_WIDTH-1:0]  ALU_OUT,
output    reg                     OUT_VALID
);

reg [OUT_WIDTH-1:0] ALU_Comb;
reg                 OUT_VALID_Comb;

always @(posedge CLK or negedge RST)
    begin
       if (!RST) begin
           ALU_OUT <= 'b0 ;
           OUT_VALID <= 'b0 ;
       end
       else begin
                OUT_VALID <= OUT_VALID_Comb;
                ALU_OUT <= ALU_Comb;
              end
          
    end

    always @(*) begin
        ALU_Comb = 'b0;
        OUT_VALID_Comb = 'b0;
        if (Enable) begin
            OUT_VALID_Comb = 1'b1;
        case (ALU_FUN)
            4'b0000:  ALU_Comb = A + B;          // ADD
            4'b0001:  ALU_Comb = A - B;          // SUB
            4'b0010:  ALU_Comb = A * B;                        // MUL
            4'b0011:  ALU_Comb = (B != 0) ? A / B : 0;         // DIV
            4'b0100:  ALU_Comb = A & B;                        // AND
            4'b0101:  ALU_Comb = A | B;                        // OR
            4'b0110:  ALU_Comb = ~(A & B);                     // NAND
            4'b0111:  ALU_Comb = ~(A | B);                     // NOR
            4'b1000:  ALU_Comb = A ^ B;                        // XOR
            4'b1001:  ALU_Comb = ~(A ^ B);                     // XNOR
            4'b1010:  ALU_Comb = (A == B) ? 'd1 : 'd0;     // COMP_equal
            4'b1011:  ALU_Comb = (A  > B) ? 'd2 : 'd0;     // COMP_greater
            4'b1100:  ALU_Comb = (A  < B) ? 'd3 : 'd0;     // COMP_less
            4'b1101:  ALU_Comb = A >> 1;                       // SHIFT_right
            4'b1110:  ALU_Comb = A << 1;                       // SHIFT_left
            default:  ALU_Comb = 'd0;
       endcase
        end
        else begin
            OUT_VALID_Comb ='b0;
        end

        
    end

endmodule
module parity_check #(
    parameter DATA_WIDTH = 8
)(
    input  wire       CLK,
    input  wire       RST,
    input  wire [DATA_WIDTH-1:0] P_DATA,
    input  wire       PAR_TYP,
    input  wire       par_chk_en,
    input  wire       sampled_bit,
    output reg        par_error
);

wire calculated_parity;


  assign calculated_parity = (PAR_TYP) ? ~(^P_DATA) : ^P_DATA;


always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        par_error <= 1'b0;
    end
    else if (par_chk_en) begin
         par_error <= (sampled_bit != calculated_parity);
    end
    
end

endmodule
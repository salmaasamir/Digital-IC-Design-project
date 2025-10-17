module stop_check (
    input  wire       CLK,
    input  wire       RST,
    input  wire       stp_chk_en,
    input  wire       sampled_bit,
    output reg        stp_error
);

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        stp_error <= 1'b0;
    end
    else if (stp_chk_en) begin
        stp_error <= (sampled_bit == 1'b1) ? 1'b0 : 1'b1;
    end
end

endmodule
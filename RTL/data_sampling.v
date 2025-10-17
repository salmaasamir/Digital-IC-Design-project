module data_sampling (
    input  wire       CLK,
    input  wire       RST,
    input  wire       RX_IN,
    input  wire       data_samp_en,
    input  wire [5:0] Prescale,
    input  wire [5:0] edge_cnt,
    output reg        sampled_bit
);

wire [5:0] sample1, sample2, sample3;
assign sample2 = Prescale >> 1;  // at the middle
assign sample1 = sample2 - 1;
assign sample3 = sample2 + 1;

// Internal registers
reg sample_reg1, sample_reg2, sample_reg3;

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        sample_reg1 <= 1'b0;
        sample_reg2 <= 1'b0;
        sample_reg3 <= 1'b0;
        sampled_bit <= 1'b0;
    end
    else if (data_samp_en) begin
        if (edge_cnt == sample1) begin
            sample_reg1 <= RX_IN;
        end
        else if (edge_cnt == sample2) begin
            sample_reg2 <= RX_IN;
        end
        else if (edge_cnt == sample3) begin
            sample_reg3 <= RX_IN;
            // majority vote
            sampled_bit <= (sample_reg1 & sample_reg2) |
                           (sample_reg1 & sample_reg3) |
                           (sample_reg2 & sample_reg3);
        end
    end
end

endmodule
module edge_bit_count (
    input  wire       CLK,
    input  wire       RST,
    input  wire       enable,
    input  wire [5:0] Prescale,
    output reg  [5:0] edge_cnt,
    output reg  [3:0] bit_cnt,
    output reg        bit_done
);

reg prev_enable;

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        edge_cnt <= 6'd0;
        bit_cnt  <= 4'd0;
        bit_done <= 1'b0;
        prev_enable <= 1'b0;
    end
    else begin
        prev_enable <= enable;
        
        if (enable) begin
            if (!prev_enable) begin
                edge_cnt <= 6'd1;  // Start from 1 in first clock
                bit_cnt  <= 4'd0;
                bit_done <= 1'b0;
            end
            else if (edge_cnt == Prescale - 1) begin
                edge_cnt <= 6'd0;
                bit_cnt  <= bit_cnt + 1'b1;
                bit_done <= 1'b1;
            end
            else begin
                edge_cnt <= edge_cnt + 1'b1;
                bit_done <= 1'b0;
            end
        end
        else begin
            edge_cnt <= 6'd0;
            bit_cnt  <= 4'd0;
            bit_done <= 1'b0;
        end
    end
end

endmodule
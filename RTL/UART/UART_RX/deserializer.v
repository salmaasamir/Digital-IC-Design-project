module deserializer #(
    parameter DATA_WIDTH = 8
)(
    input  wire       CLK,
    input  wire       RST,
    input  wire       deser_en,
    input  wire       sampled_bit,
    output reg  [DATA_WIDTH-1:0] P_DATA
);

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        P_DATA <= {DATA_WIDTH{1'b0}};
    end
    else if (deser_en) begin
        // shifting
        P_DATA <= {sampled_bit, P_DATA[DATA_WIDTH-1:1]};
    end
end

endmodule


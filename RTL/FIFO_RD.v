module FIFO_RD #(
    parameter ADDR_WIDTH = 3
) (
    input  wire       R_CLK,
    input  wire       R_RST,
    input  wire       r_inc,
    input  wire [ADDR_WIDTH:0]   rq2_wptr,
    output reg                   r_empty,
    output reg  [ADDR_WIDTH-1:0] r_adder,
    output reg  [ADDR_WIDTH:0]   r_ptr
);

reg [ADDR_WIDTH:0] r_Binary, r_Gray_Next, r_Binary_Next;

wire empty;

// gray pointer
always @(posedge R_CLK or negedge R_RST) begin
    if (!R_RST) begin
        r_Binary <= 0;
        r_ptr <= 0;
        r_empty <= 1'b1;
    end else begin
        r_Binary <= r_Binary_Next;
        r_ptr <= r_Gray_Next;
        r_empty <= empty;
    end
end
assign empty = (r_ptr == rq2_wptr);

always @(*) begin
 r_Binary_Next = r_Binary + r_inc;
 r_Gray_Next = (r_Binary_Next >> 1) ^ r_Binary_Next;
 r_adder = r_Binary[ADDR_WIDTH-1:0];
end

endmodule

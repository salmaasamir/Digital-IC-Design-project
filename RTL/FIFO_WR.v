module FIFO_WR #(
    parameter ADDR_WIDTH = 3
) (
    input  wire       W_CLK,
    input  wire       W_RST,
    input  wire       w_inc,
    input  wire [ADDR_WIDTH:0] wq2_rptr,
    output reg        w_full,
    output reg  [ADDR_WIDTH-1:0] w_adder,
    output reg  [ADDR_WIDTH:0] w_ptr

);
reg [ADDR_WIDTH:0] w_Binary, w_Gray_Next, w_Binary_Next;
wire full;

always @(posedge W_CLK or negedge W_RST) begin
    if (!W_RST) begin
        w_Binary <= 0;
        w_ptr <= 0;
        w_full <= 0;
    end else begin
        w_Binary <= w_Binary_Next;
        w_ptr <= w_Gray_Next;
        w_full <= full;
    end
end

assign full = ( (w_Gray_Next[ADDR_WIDTH] != wq2_rptr[ADDR_WIDTH]) &&
               (w_Gray_Next[ADDR_WIDTH-1] != wq2_rptr[ADDR_WIDTH-1]) &&
               (w_Gray_Next[ADDR_WIDTH-2:0] == wq2_rptr[ADDR_WIDTH-2:0]) );

always @(*) begin
     w_Binary_Next = w_Binary +( w_inc & (~w_full));
     w_Gray_Next = (w_Binary_Next >> 1) ^ w_Binary_Next;
     w_adder = w_Binary[ADDR_WIDTH-1:0];

end

endmodule

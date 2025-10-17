module ASYNC_FIFO #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3,
    parameter FIFO_DEPTH = 8
) (
    input  wire                  W_CLK,
    input  wire                  W_RST,
    input  wire                  R_CLK,
    input  wire                  R_RST,
    input  wire                  w_inc,
    input  wire                  r_inc,
    input  wire [DATA_WIDTH-1:0] WR_DATA,
    output wire [DATA_WIDTH-1:0] RD_DATA,
    output wire                  w_full,
    output wire                  r_empty
);
//internal signals
wire [ADDR_WIDTH:0] w_ptr, r_ptr;
wire [ADDR_WIDTH-1:0] w_adder, r_adder;
wire [ADDR_WIDTH:0] wq2_rptr, rq2_wptr;

//instantiation
FIFO_MEM #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .FIFO_DEPTH(FIFO_DEPTH)
) fifo_mem_inst (
    .W_CLK(W_CLK),
    .W_RST(W_RST),
    .w_adder(w_adder),
    .r_adder(r_adder),
    .w_full(w_full),
    .w_inc(w_inc),
    .WR_DATA(WR_DATA),
    .RD_DATA(RD_DATA)
);

FIFO_RD  #(
    .ADDR_WIDTH(ADDR_WIDTH)
) fifo_rd_inst (
    .R_CLK(R_CLK),
    .R_RST(R_RST),
    .r_inc(r_inc),
    .rq2_wptr(rq2_wptr),
    .r_empty(r_empty),
    .r_adder(r_adder),
    .r_ptr(r_ptr)
);

FIFO_WR  #(
    .ADDR_WIDTH(ADDR_WIDTH)
) fifo_wr_inst (
    .W_CLK(W_CLK),
    .W_RST(W_RST),
    .w_inc(w_inc),
    .wq2_rptr(wq2_rptr),
    .w_full(w_full),
    .w_adder(w_adder),
    .w_ptr(w_ptr)
);

DF_SYNC  #(
    .ADDR_WIDTH(ADDR_WIDTH)
) df_sync_inst (
    .W_CLK(W_CLK),
    .W_RST(W_RST),
    .R_CLK(R_CLK),
    .R_RST(R_RST),
    .w_ptr(w_ptr),
    .r_ptr(r_ptr),
    .wq2_rptr(wq2_rptr),
    .rq2_wptr(rq2_wptr)
);

endmodule

